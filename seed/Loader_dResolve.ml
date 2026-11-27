open Vuna_runtime
# 41 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFuelBound = 1073741824

# 45 "Vuna/Compiler/Loader/Resolve.vuna"
let v_builtinArity = (fun (dtb_u_u1 : string) -> (match (Base_dIntrinsics.v_findIntrinsic dtb_u_u1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2) -> (if (Base_dIntrinsics.v_intrinsicVisible dtb_u_u2) then (B_dData_dMaybe.C_Maybe_Just ((Base_dIntrinsics.v_intrinsicArity dtb_u_u2))) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isBuiltinName = (fun (dtb_u_u3 : string) -> (match (v_builtinArity dtb_u_u3) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u4) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Loader/Resolve.vuna"
let v_dtPreludeNames = ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ("Type", (B_dData_dList.C_List__x58__x58_ ("->", (B_dData_dList.C_List__x58__x58_ ("_", B_dData_dList.C_List_Nil))))))) ((B_dData_dList.v_append Base_dIntrinsics.v_preludeTypeNames) Base_dIntrinsics.v_preludeValueNames))

# 64 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isDtPreludeName = (fun (dtb_u_u5 : string) -> ((B_dData_dList.v_memName dtb_u_u5) v_dtPreludeNames))

# 74 "Vuna/Compiler/Loader/Resolve.vuna"
let v_traitImportHint = (fun (dtb_u_u6 : string) -> (if (dtb_u_u6 = "Show") then " (trait Show is not in scope; add `import Base.Trait.Show`)" else (if (dtb_u_u6 = "Eq") then " (trait Eq is not in scope; add `import Base.Trait.Eq`)" else (if (dtb_u_u6 = "Ord") then " (trait Ord is not in scope; add `import Base.Trait.Ord`)" else (if (dtb_u_u6 = "show") then " (trait method show; add `import Base.Trait.Show`)" else (if (dtb_u_u6 = "eq") then " (trait method eq; add `import Base.Trait.Eq`)" else (if (dtb_u_u6 = "neq") then " (trait method neq; add `import Base.Trait.Eq`)" else (if (dtb_u_u6 = "lt") then " (trait method lt; add `import Base.Trait.Ord`)" else (if (dtb_u_u6 = "le") then " (trait method le; add `import Base.Trait.Ord`)" else (if (dtb_u_u6 = "gt") then " (trait method gt; add `import Base.Trait.Ord`)" else (if (dtb_u_u6 = "ge") then " (trait method ge; add `import Base.Trait.Ord`)" else "")))))))))))

# 96 "Vuna/Compiler/Loader/Resolve.vuna"
let v_declValueNames = (fun (dtb_u_u7 : Frontend_dAst.t_Decl) -> (match dtb_u_u7 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u8, dtb_u_u9, dtb_u_u10, dtb_u_u11) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u8, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u12, dtb_u_u13, dtb_u_u14, dtb_u_u15) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u12, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u16, dtb_u_u17, dtb_u_u18) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u16, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u19, dtb_u_u20, dtb_u_u21, dtb_u_u22) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u19, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u23, dtb_u_u24, dtb_u_u25, dtb_u_u26) -> B_dData_dList.C_List_Nil
  | _ -> B_dData_dList.C_List_Nil
))

# 108 "Vuna/Compiler/Loader/Resolve.vuna"
let v_valueNamesOf = (fun (dtb_u_u27 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap v_declValueNames) dtb_u_u27))

# 116 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorCandsOf = (fun (dtb_u_u28 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u29, dtb_u_u30) -> (match dtb_u_u29 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u31, dtb_u_u32, dtb_u_u33, dtb_u_u34, dtb_u_u35, dtb_u_u36, dtb_u_u37, dtb_u_u38, dtb_u_u39) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u40 : Frontend_dAst.t_Ctor) -> { B_dData_dPair.f_Pair_first = (Frontend_dAst.v_ctorName dtb_u_u40); B_dData_dPair.f_Pair_second = (String.concat "" [dtb_u_u31; "."; (Frontend_dAst.v_ctorName dtb_u_u40)]) })) dtb_u_u34)) (v_ctorCandsOf dtb_u_u30))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u41, dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47, dtb_u_u48) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u41; B_dData_dPair.f_Pair_second = dtb_u_u41 }, (v_ctorCandsOf dtb_u_u30)))
  | _ -> (v_ctorCandsOf dtb_u_u30)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 128 "Vuna/Compiler/Loader/Resolve.vuna"
let v_namespacesOfWith = (fun (dtb_u_u49 : bool) (dtb_u_u50 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u51 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u52 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (let dtb_u_u53 = (v_valueNamesOf dtb_u_u51) in (let dtb_u_u54 = (Frontend_dAst.v_ctorsOf dtb_u_u51) in (let dtb_u_u55 = (Frontend_dAst.v_typeNamesOf dtb_u_u51) in (let dtb_u_u56 = (v_ctorCandsOf dtb_u_u51) in { Loader_dModules.f_Namespaces_nsValues = dtb_u_u53; Loader_dModules.f_Namespaces_nsCtors = dtb_u_u54; Loader_dModules.f_Namespaces_nsTypes = dtb_u_u55; Loader_dModules.f_Namespaces_nsValueSet = (B_dContainer_dHashMap.v_ofNames dtb_u_u53); Loader_dModules.f_Namespaces_nsCtorSet = (B_dContainer_dHashMap.v_ofNames dtb_u_u54); Loader_dModules.f_Namespaces_nsTypeSet = (B_dContainer_dHashMap.v_ofNames dtb_u_u55); Loader_dModules.f_Namespaces_nsCtorCands = dtb_u_u56; Loader_dModules.f_Namespaces_nsModuleTbl = (Loader_dModules.v_moduleTblOf dtb_u_u50); Loader_dModules.f_Namespaces_nsOpenNames = (Loader_dModules.v_openModuleNames dtb_u_u52); Loader_dModules.f_Namespaces_nsRelease = dtb_u_u49 })))))

# 150 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTargets = (fun (dtb_u_u57 : string) (dtb_u_u58 : Loader_dModules.t_Namespaces) (dtb_u_u59 : string) -> ((B_dData_dList.v_map (fun (dtb_u_u60 : (string, string) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_mangle dtb_u_u57) (B_dData_dPair.v_secondOf dtb_u_u60)))) ((B_dData_dList.v_filter (fun (dtb_u_u61 : (string, string) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_firstOf dtb_u_u61) = dtb_u_u59))) (dtb_u_u58).Loader_dModules.f_Namespaces_nsCtorCands)))

# 155 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorTarget = (fun (dtb_u_u62 : string) (dtb_u_u63 : Loader_dModules.t_Namespaces) (dtb_u_u64 : string) -> (let dtb_u_u65 = (((v_localCtorTargets dtb_u_u62) dtb_u_u63) dtb_u_u64) in (match dtb_u_u65 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (match dtb_u_u67 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u66))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 166 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairExportTarget = (fun (dtb_u_u68 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((B_dData_dPair.v_secondOf dtb_u_u68)).Loader_dModules.f_ExportEntry_target)

# 170 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pairIsDataCtor = (fun (dtb_u_u69 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u70 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> ((Loader_dModules.v_isDataOrRecordCtorTarget dtb_u_u69) (v_pairExportTarget dtb_u_u70)))

# 174 "Vuna/Compiler/Loader/Resolve.vuna"
let v_importedCtorTargets = (fun (dtb_u_u71 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u72 : (string, Loader_dModules.t_Module) B_dContainer_dHashMap.t_HashMap) (dtb_u_u73 : string B_dData_dList.t_List) (dtb_u_u74 : string) -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn dtb_u_u72) dtb_u_u73) dtb_u_u74)) (fun (dtb_u_u75 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) ((B_dData_dList.v_filter (v_pairIsDataCtor dtb_u_u71)) dtb_u_u75))))))))

# 193 "Vuna/Compiler/Loader/Resolve.vuna"
let v_notEmptyList = (fun dtb_u_u77 -> (match dtb_u_u77 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorCandidates = (fun (dtb_u_u80 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u81 : string) (dtb_u_u82 : Loader_dModules.t_Namespaces) (dtb_u_u83 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u84 : string) -> ((Base_dCommon.v_bind ((((v_importedCtorTargets dtb_u_u80) (dtb_u_u82).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u82).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u84)) (fun (dtb_u_u85 : string B_dData_dList.t_List) -> (let dtb_u_u86 = (((v_localCtorTargets dtb_u_u81) dtb_u_u82) dtb_u_u84) in (if (if (if (if (v_notEmptyList dtb_u_u86) then (dtb_u_u84 <> "Nil") else false) then (dtb_u_u84 <> "Cons") else false) then (dtb_u_u84 <> "::") else false) then (Base_dDiag.C_Check_OkC (dtb_u_u86)) else (Base_dDiag.C_Check_OkC ((B_dData_dList.v_nubNames ((B_dData_dList.v_append dtb_u_u86) dtb_u_u85)))))))))

# 237 "Vuna/Compiler/Loader/Resolve.vuna"
let v_realModuleName = (fun (dtb_u_u87 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u88 : string) -> (match ((Loader_dModules.v_resolveModuleName dtb_u_u87) dtb_u_u88) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u89) -> dtb_u_u89
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u88
  | _ -> failwith "DT: impossible branch"
))

# 270 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pathKey = (fun (dtb_u_u90 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u90 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u91; B_dData_dPair.f_Pair_second = dtb_u_u92 } -> (String.concat "" [dtb_u_u91; "|"; (Base_dSource.v_joinDots dtb_u_u92)])
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_memPathKey = (fun (dtb_u_u93 : string) (dtb_u_u94 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if ((v_pathKey dtb_u_u95) = dtb_u_u93) then true else ((v_memPathKey dtb_u_u93) dtb_u_u96))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_uniqPathResults = (fun (dtb_u_u97 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u97 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (if ((v_memPathKey (v_pathKey dtb_u_u98)) dtb_u_u99) then (v_uniqPathResults dtb_u_u99) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u98, (v_uniqPathResults dtb_u_u99))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_commaJoin = (fun (dtb_u_u100 : string B_dData_dList.t_List) -> (match dtb_u_u100 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u101, dtb_u_u102) -> (match dtb_u_u102 with
  | B_dData_dList.C_List_Nil -> dtb_u_u101
  | _ -> (String.concat "" [dtb_u_u101; ", "; (v_commaJoin dtb_u_u102)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 282 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lastSegmentOf = (fun (dtb_u_u103 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u103)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u104; B_dData_dPair.f_Pair_second = dtb_u_u105 } -> dtb_u_u105
  | _ -> failwith "DT: impossible branch"
))

# 288 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_memberLabel = (fun (dtb_u_u106 : string) (dtb_u_u107 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u107 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (match dtb_u_u108 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u110; B_dData_dPair.f_Pair_second = dtb_u_u111 } -> (match dtb_u_u111 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u112, dtb_u_u113) -> dtb_u_u112
  | B_dData_dList.C_List_Nil -> ((v_memberLabel dtb_u_u106) dtb_u_u109)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u106
  | _ -> failwith "DT: impossible branch"
))

# 295 "Vuna/Compiler/Loader/Resolve.vuna"
let v_firstModuleOf = (fun (dtb_u_u114 : string) (dtb_u_u115 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u116, dtb_u_u117) -> (match dtb_u_u116 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = dtb_u_u119 } -> dtb_u_u118
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u114
  | _ -> failwith "DT: impossible branch"
))

# 300 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_entryHits = (fun (dtb_u_u120 : (Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (string) -> Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u121 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u122 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u123 : string) -> (match dtb_u_u122 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u124, dtb_u_u125) -> (match dtb_u_u124 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u126; B_dData_dPair.f_Pair_second = dtb_u_u127 } -> (let dtb_u_u128 = dtb_u_u127 in (match dtb_u_u128 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> (match dtb_u_u130 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u129 = dtb_u_u123) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u121) dtb_u_u126)) (fun (dtb_u_u131 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((dtb_u_u120 dtb_u_u131) dtb_u_u123) with
  | B_dData_dList.C_List_Nil -> ((((v_entryHits dtb_u_u120) dtb_u_u121) dtb_u_u125) dtb_u_u123)
  | dtb_u_u132 -> ((Base_dCommon.v_bind ((((v_entryHits dtb_u_u120) dtb_u_u121) dtb_u_u125) dtb_u_u123)) (fun (dtb_u_u133 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u134 : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb_u_u126; B_dData_dPair.f_Pair_second = dtb_u_u134 })) dtb_u_u132)) dtb_u_u133)))))
))) else ((((v_entryHits dtb_u_u120) dtb_u_u121) dtb_u_u125) dtb_u_u123))
  | _ -> ((((v_entryHits dtb_u_u120) dtb_u_u121) dtb_u_u125) dtb_u_u123)
)
  | _ -> ((((v_entryHits dtb_u_u120) dtb_u_u121) dtb_u_u125) dtb_u_u123)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueEntry = (fun (dtb_u_u135 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u136 : string) -> (match ((Loader_dModules.v_findExportValue dtb_u_u135) dtb_u_u136) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u137) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u137))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_findExportType dtb_u_u135) dtb_u_u136)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueEntries = (fun (dtb_u_u138 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u139 : string) -> (match ((Loader_dModules.v_findExportValues dtb_u_u138) dtb_u_u139) with
  | B_dData_dList.C_List_Nil -> ((Loader_dModules.v_findExportTypes dtb_u_u138) dtb_u_u139)
  | dtb_u_u140 -> dtb_u_u140
))

# 328 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickTypeEntries = (fun (dtb_u_u141 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u142 : string) -> (match ((Loader_dModules.v_findExportTypes dtb_u_u141) dtb_u_u142) with
  | B_dData_dList.C_List_Nil -> ((Loader_dModules.v_findExportValues dtb_u_u141) dtb_u_u142)
  | dtb_u_u143 -> dtb_u_u143
))

# 369 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_anyCtorNamed = (fun (dtb_u_u144 : string) (dtb_u_u145 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u145 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u146, dtb_u_u147) -> (if ((Frontend_dAst.v_ctorName dtb_u_u146) = dtb_u_u144) then true else ((v_anyCtorNamed dtb_u_u144) dtb_u_u147))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorTargetInDecls = (fun (dtb_u_u148 : string) (dtb_u_u149 : string) (dtb_u_u150 : string) (dtb_u_u151 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u151 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u152, dtb_u_u153) -> (match dtb_u_u152 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u154, dtb_u_u155, dtb_u_u156, dtb_u_u157, dtb_u_u158, dtb_u_u159, dtb_u_u160, dtb_u_u161, dtb_u_u162) -> (if (((Loader_dModules.v_mangle dtb_u_u148) dtb_u_u154) = dtb_u_u149) then (if ((v_anyCtorNamed dtb_u_u150) dtb_u_u157) then (B_dData_dMaybe.C_Maybe_Just ((((Loader_dModules.v_ctorCanonical dtb_u_u148) dtb_u_u154) dtb_u_u150))) else B_dData_dMaybe.C_Maybe_Nothing) else ((((v_ctorTargetInDecls dtb_u_u148) dtb_u_u149) dtb_u_u150) dtb_u_u153))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u163, dtb_u_u164, dtb_u_u165, dtb_u_u166, dtb_u_u167, dtb_u_u168, dtb_u_u169, dtb_u_u170) -> (if (if (((Loader_dModules.v_mangle dtb_u_u148) dtb_u_u163) = dtb_u_u149) then (dtb_u_u163 = dtb_u_u150) else false) then (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle dtb_u_u148) dtb_u_u163))) else ((((v_ctorTargetInDecls dtb_u_u148) dtb_u_u149) dtb_u_u150) dtb_u_u153))
  | _ -> ((((v_ctorTargetInDecls dtb_u_u148) dtb_u_u149) dtb_u_u150) dtb_u_u153)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_findFamilyCtorInModules = (fun (dtb_u_u171 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u172 : string) (dtb_u_u173 : string) -> (match dtb_u_u171 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u174, dtb_u_u175) -> (match ((((v_ctorTargetInDecls (Loader_dModules.v_moduleNameOf dtb_u_u174)) dtb_u_u172) dtb_u_u173) (Loader_dModules.v_moduleDeclsOf dtb_u_u174)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u176) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u176))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_findFamilyCtorInModules dtb_u_u175) dtb_u_u172) dtb_u_u173)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 382 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorRelFamily = (fun (dtb_u_u177 : string) (dtb_u_u178 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u178)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> ((Loader_dModules.v_mangle dtb_u_u177) (Base_dSource.v_joinDots dtb_u_u179))
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorTargetInFamily = (fun (dtb_u_u181 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u182 : string) (dtb_u_u183 : Loader_dModules.t_Namespaces) (dtb_u_u184 : string) (dtb_u_u185 : string) -> (let dtb_u_u186 = ((B_dData_dList.v_filter (fun (dtb_u_u191 : (string, string) B_dData_dPair.t_Pair) -> (if ((B_dData_dPair.v_firstOf dtb_u_u191) = dtb_u_u185) then (((v_ctorRelFamily dtb_u_u182) (B_dData_dPair.v_secondOf dtb_u_u191)) = dtb_u_u184) else false))) (dtb_u_u183).Loader_dModules.f_Namespaces_nsCtorCands) in (match dtb_u_u186 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u187, dtb_u_u188) -> (match dtb_u_u187 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u189; B_dData_dPair.f_Pair_second = dtb_u_u190 } -> (match dtb_u_u188 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle dtb_u_u182) dtb_u_u190)))
  | _ -> (((v_findFamilyCtorInModules dtb_u_u181) dtb_u_u184) dtb_u_u185)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_findFamilyCtorInModules dtb_u_u181) dtb_u_u184) dtb_u_u185)
)))

# 449 "Vuna/Compiler/Loader/Resolve.vuna"
let v_exportTarget = (fun (dtb_u_u192 : Loader_dModules.t_ExportEntry) -> (dtb_u_u192).Loader_dModules.f_ExportEntry_target)

# 467 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_allEq = (fun (dtb_u_u193 : string) (dtb_u_u194 : string B_dData_dList.t_List) -> (match dtb_u_u194 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u195, dtb_u_u196) -> (if (dtb_u_u193 = dtb_u_u195) then ((v_allEq dtb_u_u193) dtb_u_u196) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Loader/Resolve.vuna"
let v_allSameTarget = (fun (dtb_u_u197 : string B_dData_dList.t_List) -> (match dtb_u_u197 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u198, dtb_u_u199) -> ((v_allEq dtb_u_u198) dtb_u_u199)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 453 "Vuna/Compiler/Loader/Resolve.vuna"
let v_uniqueCtorTarget = (fun (dtb_u_u200 : string) (dtb_u_u201 : string) (dtb_u_u202 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u202 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u203, dtb_u_u204) -> (if (v_allSameTarget ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb_u_u203, dtb_u_u204)))) then (Base_dDiag.C_Check_OkC ((v_exportTarget dtb_u_u203))) else (Base_dDiag.C_Check_OkC ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u201, (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_exportTarget) (B_dData_dList.C_List__x58__x58_ (dtb_u_u203, dtb_u_u204))))))))))
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (dtb_u_u201))) dtb_u_u201)
  | _ -> failwith "DT: impossible branch"
))

# 473 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorEntryHits = (fun (dtb_u_u205 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u206 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u207 : string) -> (match dtb_u_u206 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u208, dtb_u_u209) -> (match dtb_u_u208 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u210; B_dData_dPair.f_Pair_second = dtb_u_u211 } -> (let dtb_u_u212 = dtb_u_u211 in (match dtb_u_u212 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u213, dtb_u_u214) -> (match dtb_u_u214 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u213 = dtb_u_u207) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u205) dtb_u_u210)) (fun (dtb_u_u215 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportCtors dtb_u_u215) dtb_u_u213) with
  | B_dData_dList.C_List_Nil -> (((v_ctorEntryHits dtb_u_u205) dtb_u_u209) dtb_u_u207)
  | dtb_u_u216 -> ((Base_dCommon.v_bind (((v_ctorEntryHits dtb_u_u205) dtb_u_u209) dtb_u_u207)) (fun (dtb_u_u217 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u218 : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = dtb_u_u210; B_dData_dPair.f_Pair_second = dtb_u_u218 })) dtb_u_u216)) dtb_u_u217)))))
))) else (((v_ctorEntryHits dtb_u_u205) dtb_u_u209) dtb_u_u207))
  | _ -> (((v_ctorEntryHits dtb_u_u205) dtb_u_u209) dtb_u_u207)
)
  | _ -> (((v_ctorEntryHits dtb_u_u205) dtb_u_u209) dtb_u_u207)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 490 "Vuna/Compiler/Loader/Resolve.vuna"
let v_ctorFamilyEntryOf = (fun (dtb_u_u219 : string) (dtb_u_u220 : string) (dtb_u_u221 : Loader_dModules.t_ExportEntry) -> (if (if ((dtb_u_u221).Loader_dModules.f_ExportEntry_kind = "ctor") then ((dtb_u_u221).Loader_dModules.f_ExportEntry_public = dtb_u_u219) else false) then ((dtb_u_u221).Loader_dModules.f_ExportEntry_parent = dtb_u_u220) else false))

# 493 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorFamilyHits = (fun (dtb_u_u222 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u223 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u224 : string) (dtb_u_u225 : string) -> (match dtb_u_u223 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u226, dtb_u_u227) -> (match dtb_u_u226 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u228; B_dData_dPair.f_Pair_second = dtb_u_u229 } -> (let dtb_u_u230 = dtb_u_u229 in (match dtb_u_u230 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u231, dtb_u_u232) -> (match dtb_u_u232 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u233, dtb_u_u234) -> (match dtb_u_u234 with
  | B_dData_dList.C_List_Nil -> (if (if (dtb_u_u231 = dtb_u_u224) then (dtb_u_u233 = dtb_u_u225) else false) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u222) dtb_u_u228)) (fun (dtb_u_u235 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportType dtb_u_u235) dtb_u_u224) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u236) -> (match ((B_dData_dList.v_filter ((v_ctorFamilyEntryOf dtb_u_u225) (dtb_u_u236).Loader_dModules.f_ExportEntry_target)) dtb_u_u235) with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238) -> ((Base_dCommon.v_bind ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)) (fun (dtb_u_u239 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u228; B_dData_dPair.f_Pair_second = { Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb_u_u225; Loader_dModules.f_ExportEntry_target = (dtb_u_u237).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (dtb_u_u236).Loader_dModules.f_ExportEntry_target } }, dtb_u_u239))))))
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((Loader_dModules.v_moduleDecls dtb_u_u222) dtb_u_u228)) (fun (dtb_u_u240 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match ((((v_ctorTargetInDecls dtb_u_u228) (dtb_u_u236).Loader_dModules.f_ExportEntry_target) dtb_u_u225) dtb_u_u240) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u241) -> ((Base_dCommon.v_bind ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)) (fun (dtb_u_u242 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u228; B_dData_dPair.f_Pair_second = { Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb_u_u225; Loader_dModules.f_ExportEntry_target = dtb_u_u241; Loader_dModules.f_ExportEntry_parent = (dtb_u_u236).Loader_dModules.f_ExportEntry_target } }, dtb_u_u242))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225))
  | _ -> ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)
)
  | _ -> ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)
)
  | _ -> ((((v_ctorFamilyHits dtb_u_u222) dtb_u_u227) dtb_u_u224) dtb_u_u225)
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 581 "Vuna/Compiler/Loader/Resolve.vuna"
let v_selectorRecordTarget = (fun (dtb_u_u243 : string) (dtb_u_u244 : Loader_dModules.t_Namespaces) (dtb_u_u245 : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u245) (dtb_u_u244).Loader_dModules.f_Namespaces_nsTypeSet) then (B_dData_dMaybe.C_Maybe_Just (((Loader_dModules.v_mangle dtb_u_u243) dtb_u_u245))) else (match (((Loader_dModules.v_modulesExportingTypeIn (dtb_u_u244).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u244).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u245) with
  | Base_dDiag.C_Check_OkC (dtb_u_u246) -> (let dtb_u_u247 = (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) dtb_u_u246)) in (match dtb_u_u247 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u248, dtb_u_u249) -> (match dtb_u_u249 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u248))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | Base_dDiag.C_Check_ErrC (dtb_u_u250) -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 593 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_foldFieldChain = (fun (dtb_u_u251 : Frontend_dAst.t_Expr) (dtb_u_u252 : string B_dData_dList.t_List) (dtb_u_u253 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u252 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u254, dtb_u_u255) -> (((v_foldFieldChain (Frontend_dAst.C_Expr_EField (dtb_u_u251, dtb_u_u254, dtb_u_u253))) dtb_u_u255) dtb_u_u253)
  | B_dData_dList.C_List_Nil -> dtb_u_u251
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Loader/Resolve.vuna"
let v_dottedFieldSelector = (fun (dtb_u_u256 : string) (dtb_u_u257 : Loader_dModules.t_Namespaces) (dtb_u_u258 : string) (dtb_u_u259 : string B_dData_dList.t_List) (dtb_u_u260 : Frontend_dAst.t_NodeRef) -> (match dtb_u_u259 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u261, dtb_u_u262) -> (match (((v_selectorRecordTarget dtb_u_u256) dtb_u_u257) dtb_u_u258) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u263) -> (B_dData_dMaybe.C_Maybe_Just ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsFieldSel (dtb_u_u263, dtb_u_u261))), dtb_u_u260))) dtb_u_u262) dtb_u_u260)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 597 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_takeSegs = (fun (dtb_u_u265 : int) dtb_u_u266 -> (match dtb_u_u266 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u267, dtb_u_u268) -> (if (dtb_u_u265 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb_u_u267, ((v_takeSegs (dtb_u_u265 - 1)) dtb_u_u268))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_longestNamespaceEntryGo = (fun (dtb_u_u269 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u270 : string B_dData_dList.t_List) (dtb_u_u271 : int) -> (if (dtb_u_u271 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match ((Loader_dModules.v_findExportModule dtb_u_u269) (Base_dSource.v_joinDots ((v_takeSegs dtb_u_u271) dtb_u_u270))) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u272) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (dtb_u_u272).Loader_dModules.f_ExportEntry_target; B_dData_dPair.f_Pair_second = dtb_u_u271 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_longestNamespaceEntryGo dtb_u_u269) dtb_u_u270) (dtb_u_u271 - 1))
  | _ -> failwith "DT: impossible branch"
)))

# 217 "Vuna/Compiler/Loader/Resolve.vuna"
let v_longestNamespaceEntry = (fun (dtb_u_u273 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u274 : string B_dData_dList.t_List) -> (((v_longestNamespaceEntryGo dtb_u_u273) dtb_u_u274) (B_dData_dList.v_length dtb_u_u274)))

# 601 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_dropSegs = (fun (dtb_u_u276 : int) dtb_u_u277 -> (match dtb_u_u277 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u278, dtb_u_u279) -> (if (dtb_u_u276 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u278, dtb_u_u279)) else ((v_dropSegs (dtb_u_u276 - 1)) dtb_u_u279))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespacePathsFuel = (fun (dtb_u_u280 : int) (dtb_u_u281 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u282 : string) (dtb_u_u283 : string B_dData_dList.t_List) -> (if (dtb_u_u280 <= 0) then (Base_dDiag.v_icFuel "namespace path") else (if (v_notEmptyList dtb_u_u283) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u281) dtb_u_u282)) (fun (dtb_u_u284 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let dtb_u_u285 = ((v_longestNamespaceEntry dtb_u_u284) dtb_u_u283) in (match dtb_u_u285 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u286) -> (match dtb_u_u286 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u287; B_dData_dPair.f_Pair_second = dtb_u_u288 } -> ((((v_walkNamespacePathsFuel (dtb_u_u280 - 1)) dtb_u_u281) dtb_u_u287) ((v_dropSegs dtb_u_u288) dtb_u_u283))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u282; B_dData_dPair.f_Pair_second = dtb_u_u283 }))
  | _ -> failwith "DT: impossible branch"
)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u282; B_dData_dPair.f_Pair_second = dtb_u_u283 })))))

# 199 "Vuna/Compiler/Loader/Resolve.vuna"
let v_walkNamespacePaths = (fun (dtb_u_u289 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u290 : string) (dtb_u_u291 : string B_dData_dList.t_List) -> ((((v_walkNamespacePathsFuel (1 + (B_dData_dList.v_length dtb_u_u291))) dtb_u_u289) dtb_u_u290) dtb_u_u291))

# 258 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_walkNamespaceCandidates = (fun (dtb_u_u292 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u293 : string B_dData_dList.t_List) (dtb_u_u294 : string B_dData_dList.t_List) (dtb_u_u295 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u293 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u296, dtb_u_u297) -> ((Base_dCommon.v_bind (((v_walkNamespacePaths dtb_u_u292) dtb_u_u296) dtb_u_u294)) (fun (dtb_u_u298 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((((v_walkNamespaceCandidates dtb_u_u292) dtb_u_u297) dtb_u_u294) (B_dData_dList.C_List__x58__x58_ (dtb_u_u298, dtb_u_u295)))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u295)))
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePathPrefixesTry = (fun (dtb_u_u299 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u300 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u301 : string B_dData_dList.t_List) (dtb_u_u302 : int) -> (if (dtb_u_u302 < 1) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (match ((Loader_dModules.v_qualifierCandidates dtb_u_u300) (Base_dSource.v_joinDots ((v_takeSegs dtb_u_u302) dtb_u_u301))) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry dtb_u_u299) dtb_u_u300) dtb_u_u301) (dtb_u_u302 - 1))
  | dtb_u_u303 -> ((Base_dCommon.v_bind ((((v_walkNamespaceCandidates dtb_u_u299) ((B_dData_dList.v_map (v_realModuleName dtb_u_u299)) dtb_u_u303)) ((v_dropSegs dtb_u_u302) dtb_u_u301)) B_dData_dList.C_List_Nil)) (fun (dtb_u_u304 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match (v_uniqPathResults dtb_u_u304) with
  | B_dData_dList.C_List_Nil -> ((((v_resolvePathPrefixesTry dtb_u_u299) dtb_u_u300) dtb_u_u301) (dtb_u_u302 - 1))
  | dtb_u_u305 -> (Base_dDiag.C_Check_OkC (dtb_u_u305))
)))
)))

# 231 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolvePathPrefixes = (fun (dtb_u_u306 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u307 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u308 : string B_dData_dList.t_List) -> ((((v_resolvePathPrefixesTry dtb_u_u306) dtb_u_u307) dtb_u_u308) ((B_dData_dList.v_length dtb_u_u308) - 1)))

# 334 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualified = (fun (dtb_u_u309 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u310 : string) (dtb_u_u311 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u312 : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes dtb_u_u309) dtb_u_u311) (Base_dSource.v_splitOnDot dtb_u_u312))) (fun (dtb_u_u313 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u313 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb_u_u312))) dtb_u_u312)
  | _ -> ((Base_dCommon.v_bind ((((v_entryHits v_pickValueEntries) dtb_u_u309) dtb_u_u313) ((v_memberLabel dtb_u_u312) dtb_u_u313))) (fun (dtb_u_u314 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u314 with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel dtb_u_u312) dtb_u_u313), ((v_firstModuleOf dtb_u_u312) dtb_u_u313)))) ((v_memberLabel dtb_u_u312) dtb_u_u313)) ((v_firstModuleOf dtb_u_u312) dtb_u_u313))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u310) "value") ((v_memberLabel dtb_u_u312) dtb_u_u313)) dtb_u_u314)) (fun (dtb_u_u315 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u315)).Loader_dModules.f_ExportEntry_target))))
)))
))))

# 605 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_pathEntryHits = (fun (dtb_u_u316 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u317 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u318 : string) -> (match dtb_u_u317 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u319, dtb_u_u320) -> (match dtb_u_u319 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u321; B_dData_dPair.f_Pair_second = dtb_u_u322 } -> (let dtb_u_u323 = dtb_u_u322 in (match dtb_u_u323 with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u324, dtb_u_u325) -> (match dtb_u_u325 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u324 = dtb_u_u318) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u316) dtb_u_u321)) (fun (dtb_u_u326 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((v_pickValueEntries dtb_u_u326) dtb_u_u318) with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318)
  | dtb_u_u327 -> ((Base_dCommon.v_bind (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318)) (fun (dtb_u_u328 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u329 : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = (v_exportTarget dtb_u_u329); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })) dtb_u_u327)) dtb_u_u328)))))
))) else (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318))
  | _ -> (if (dtb_u_u324 = dtb_u_u318) then ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u316) dtb_u_u321)) (fun (dtb_u_u330 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportValues dtb_u_u330) dtb_u_u318) with
  | B_dData_dList.C_List_Nil -> (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318)
  | dtb_u_u331 -> ((Base_dCommon.v_bind (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318)) (fun (dtb_u_u332 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u333 : Loader_dModules.t_ExportEntry) -> { B_dData_dPair.f_Pair_first = (v_exportTarget dtb_u_u333); B_dData_dPair.f_Pair_second = dtb_u_u325 })) dtb_u_u331)) dtb_u_u332)))))
))) else (((v_pathEntryHits dtb_u_u316) dtb_u_u320) dtb_u_u318))
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_uniqPathTargets = (fun (dtb_u_u334 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u334 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u335, dtb_u_u336) -> (if ((v_memPathKey (v_pathKey dtb_u_u335)) dtb_u_u336) then (v_uniqPathTargets dtb_u_u336) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u335, (v_uniqPathTargets dtb_u_u336))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 653 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_allEmptyTails = (fun (dtb_u_u337 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u337 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u338, dtb_u_u339) -> (match dtb_u_u338 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u340; B_dData_dPair.f_Pair_second = dtb_u_u341 } -> (match dtb_u_u341 with
  | B_dData_dList.C_List_Nil -> (v_allEmptyTails dtb_u_u339)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isEmptyPaths = (fun dtb_u_u343 -> (match dtb_u_u343 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u344, dtb_u_u345) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeTargetOnly = (fun (dtb_u_u346 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u347 : string) (dtb_u_u348 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u349 : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes dtb_u_u346) dtb_u_u348) (Base_dSource.v_splitOnDot dtb_u_u349))) (fun (dtb_u_u350 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths dtb_u_u350) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb_u_u349))) dtb_u_u349) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) dtb_u_u346) dtb_u_u350) ((v_memberLabel dtb_u_u349) dtb_u_u350))) (fun (dtb_u_u351 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u351 with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel dtb_u_u349) dtb_u_u350), ((v_firstModuleOf dtb_u_u349) dtb_u_u350)))) ((v_memberLabel dtb_u_u349) dtb_u_u350)) ((v_firstModuleOf dtb_u_u349) dtb_u_u350))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u347) "type") ((v_memberLabel dtb_u_u349) dtb_u_u350)) dtb_u_u351)) (fun (dtb_u_u352 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u352)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 397 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTarget = (fun (dtb_u_u353 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u354 : string) (dtb_u_u355 : string) (dtb_u_u356 : Loader_dModules.t_Namespaces) (dtb_u_u357 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u358 : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u358) (dtb_u_u356).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u355) dtb_u_u358))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName dtb_u_u358) then (Base_dDiag.C_Check_OkC (dtb_u_u358)) else (if (if (dtb_u_u358 = "Type") then true else (dtb_u_u358 = "->")) then (Base_dDiag.C_Check_OkC (dtb_u_u358)) else (if (Base_dSource.v_containsDot dtb_u_u358) then ((((v_resolveDottedTypeTargetOnly dtb_u_u353) dtb_u_u354) dtb_u_u357) dtb_u_u358) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (dtb_u_u356).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u356).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u358)) (fun (dtb_u_u359 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u359 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownType (dtb_u_u358))) dtb_u_u358)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u354) "type") dtb_u_u358) dtb_u_u359)) (fun (dtb_u_u360 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u360)).Loader_dModules.f_ExportEntry_target))))
))))))))

# 432 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveFamilyQualifiedCtor = (fun (dtb_u_u361 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u362 : string) (dtb_u_u363 : string) (dtb_u_u364 : Loader_dModules.t_Namespaces) (dtb_u_u365 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u366 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u366)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u367; B_dData_dPair.f_Pair_second = dtb_u_u368 } -> (let dtb_u_u369 = (Base_dSource.v_joinDots dtb_u_u367) in ((Base_dCommon.v_bind ((((((v_resolveTypeTarget dtb_u_u361) dtb_u_u362) dtb_u_u363) dtb_u_u364) dtb_u_u365) dtb_u_u369)) (fun (dtb_u_u370 : string) -> (match (((((v_ctorTargetInFamily dtb_u_u361) dtb_u_u363) dtb_u_u364) dtb_u_u370) dtb_u_u368) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u371) -> (Base_dDiag.C_Check_OkC (dtb_u_u371))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeHasNoConstructor (dtb_u_u369, dtb_u_u368))) dtb_u_u369) dtb_u_u368)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDotted = (fun (dtb_u_u372 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u373 : string) (dtb_u_u374 : string) (dtb_u_u375 : Loader_dModules.t_Namespaces) (dtb_u_u376 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u377 : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes dtb_u_u372) dtb_u_u376) (Base_dSource.v_splitOnDot dtb_u_u377))) (fun (dtb_u_u378 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths dtb_u_u378) then ((((((v_resolveFamilyQualifiedCtor dtb_u_u372) dtb_u_u373) dtb_u_u374) dtb_u_u375) dtb_u_u376) dtb_u_u377) else ((Base_dCommon.v_bind (((v_ctorEntryHits dtb_u_u372) dtb_u_u378) ((v_memberLabel dtb_u_u377) dtb_u_u378))) (fun (dtb_u_u379 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_notEmptyList dtb_u_u379) then (((v_uniqueCtorTarget dtb_u_u373) ((v_memberLabel dtb_u_u377) dtb_u_u378)) ((B_dData_dList.v_map B_dData_dPair.v_secondOf) dtb_u_u379)) else ((Base_dCommon.v_bind ((((v_ctorFamilyHits dtb_u_u372) dtb_u_u378) ((v_memberLabel dtb_u_u377) dtb_u_u378)) (v_lastSegmentOf dtb_u_u377))) (fun (dtb_u_u380 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u380 with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel dtb_u_u377) dtb_u_u378), ((v_firstModuleOf dtb_u_u377) dtb_u_u378)))) ((v_memberLabel dtb_u_u377) dtb_u_u378)) ((v_firstModuleOf dtb_u_u377) dtb_u_u378))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u373) "constructor") (v_lastSegmentOf dtb_u_u377)) dtb_u_u380)) (fun (dtb_u_u381 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u381)).Loader_dModules.f_ExportEntry_target))))
))))))))))

# 636 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveQualifiedPath = (fun (dtb_u_u382 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u383 : string) (dtb_u_u384 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u385 : string B_dData_dList.t_List) (dtb_u_u386 : int) (dtb_u_u387 : Frontend_dAst.t_NodeRef) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes dtb_u_u382) dtb_u_u384) ((v_takeSegs dtb_u_u386) dtb_u_u385))) (fun (dtb_u_u388 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths dtb_u_u388) then (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)) else ((Base_dCommon.v_bind (((v_pathEntryHits dtb_u_u382) dtb_u_u388) ((v_memberLabel "") dtb_u_u388))) (fun (dtb_u_u389 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u390 = (v_uniqPathTargets dtb_u_u389) in (match dtb_u_u390 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u391, dtb_u_u392) -> (match dtb_u_u391 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u393; B_dData_dPair.f_Pair_second = dtb_u_u394 } -> (match dtb_u_u394 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u392 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar (dtb_u_u393, dtb_u_u387))))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (((v_memberLabel "") dtb_u_u388), (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u390))))) ((v_memberLabel "") dtb_u_u388)) (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u390)))
)
  | _ -> (match dtb_u_u392 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb_u_u393, dtb_u_u387))) dtb_u_u394) dtb_u_u387)))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (((v_memberLabel "") dtb_u_u388), (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u390))))) ((v_memberLabel "") dtb_u_u388)) (v_commaJoin ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u390)))
)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_ValueNotExported (((v_memberLabel "") dtb_u_u388), ((v_firstModuleOf "") dtb_u_u388)))) ((v_memberLabel "") dtb_u_u388)) ((v_firstModuleOf "") dtb_u_u388))
  | _ -> failwith "DT: impossible branch"
))))))))

# 716 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_valuePairTargets = (fun (dtb_u_u395 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u396 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u396 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u397, dtb_u_u398) -> (match dtb_u_u397 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u399; B_dData_dPair.f_Pair_second = dtb_u_u400 } -> (let dtb_u_u401 = (if ((dtb_u_u400).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget dtb_u_u395) (dtb_u_u400).Loader_dModules.f_ExportEntry_target)) in (if dtb_u_u401 then ((v_valuePairTargets dtb_u_u395) dtb_u_u398) else (B_dData_dList.C_List__x58__x58_ ((dtb_u_u400).Loader_dModules.f_ExportEntry_target, ((v_valuePairTargets dtb_u_u395) dtb_u_u398)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 724 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickValueOrOver = (fun (dtb_u_u402 : string) (dtb_u_u403 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let dtb_u_u404 = (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) dtb_u_u403)) in (match dtb_u_u404 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u405, dtb_u_u406) -> (match dtb_u_u406 with
  | B_dData_dList.C_List_Nil -> dtb_u_u405
  | _ -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u402, dtb_u_u404)))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u402, B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)))

# 732 "Vuna/Compiler/Loader/Resolve.vuna"
let v_pickCtorOrOver = (fun (dtb_u_u407 : string) (dtb_u_u408 : string B_dData_dList.t_List) -> (match dtb_u_u408 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u409, dtb_u_u410) -> (match dtb_u_u410 with
  | B_dData_dList.C_List_Nil -> dtb_u_u409
  | _ -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u407, dtb_u_u408)))
)
  | B_dData_dList.C_List_Nil -> (Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u407, B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 740 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtor = (fun (dtb_u_u411 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u412 : string) (dtb_u_u413 : string) (dtb_u_u414 : Loader_dModules.t_Namespaces) (dtb_u_u415 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u416 : string) -> (if (Base_dSource.v_containsDot dtb_u_u416) then ((((((v_resolveCtorDotted dtb_u_u411) dtb_u_u412) dtb_u_u413) dtb_u_u414) dtb_u_u415) dtb_u_u416) else ((Base_dCommon.v_bind (((((v_ctorCandidates dtb_u_u411) dtb_u_u413) dtb_u_u414) dtb_u_u415) dtb_u_u416)) (fun (dtb_u_u417 : string B_dData_dList.t_List) -> (match dtb_u_u417 with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u416) (dtb_u_u414).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u413) dtb_u_u416))) else (if (Base_dIntrinsics.v_isIntrinsicName dtb_u_u416) then (Base_dDiag.C_Check_OkC (dtb_u_u416)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (dtb_u_u414).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u414).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u416)) (fun (dtb_u_u418 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u418 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest dtb_u_u416) (dtb_u_u414).Loader_dModules.f_Namespaces_nsCtors))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownConstructor (dtb_u_u416))) dtb_u_u416))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver dtb_u_u416) (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) dtb_u_u418)))))
)))))
  | _ -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver dtb_u_u416) dtb_u_u417)))
)))))

# 763 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkBinder = (fun (dtb_u_u419 : string) (dtb_u_u420 : string) -> (if (Base_dSource.v_containsDot dtb_u_u420) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidVariableName (dtb_u_u420))) dtb_u_u420) else (Base_dDiag.C_Check_OkC (dtb_u_u420))))

# 767 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkTopName = (fun (dtb_u_u421 : string) (dtb_u_u422 : string) -> (if (dtb_u_u422 = "_") then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName ("_"))) "_") else (if (Base_dSource.v_containsDot dtb_u_u422) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTopLevelName (dtb_u_u422))) dtb_u_u422) else (Base_dDiag.C_Check_OkC (dtb_u_u422)))))

# 773 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTopName = (fun (dtb_u_u423 : string) (dtb_u_u424 : string) (dtb_u_u425 : string) -> ((Base_dCommon.v_bind ((v_checkTopName dtb_u_u423) dtb_u_u425)) (fun (dtb_u_u426 : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u424) dtb_u_u425))))))

# 777 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolvePattern = (fun (dtb_u_u427 : int) (dtb_u_u428 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u429 : string) (dtb_u_u430 : string) (dtb_u_u431 : Loader_dModules.t_Namespaces) (dtb_u_u432 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u433 : Frontend_dAst.t_Pat) -> (if (dtb_u_u427 <= 0) then (Base_dDiag.v_icFuel "resolver") else (match dtb_u_u433 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u434) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PWild (dtb_u_u434)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u435, dtb_u_u436) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u436))) ((v_checkBinder dtb_u_u429) dtb_u_u435))) (fun (dtb_u_u437 : string) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PVar (dtb_u_u435, dtb_u_u436)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u435, B_dData_dList.C_List_Nil)) }))))
  | Frontend_dAst.C_Pat_PAs (dtb_u_u438, dtb_u_u439, dtb_u_u440) -> ((Base_dCommon.v_bind (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u439)) (fun (dtb_u_u441 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PAs (dtb_u_u438, (B_dData_dPair.v_firstOf dtb_u_u441), dtb_u_u440)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u438, (B_dData_dPair.v_secondOf dtb_u_u441))) }))))
  | Frontend_dAst.C_Pat_PInt (dtb_u_u442, dtb_u_u443) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PInt (dtb_u_u442, dtb_u_u443)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PStr (dtb_u_u444, dtb_u_u445) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PStr (dtb_u_u444, dtb_u_u445)); B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | Frontend_dAst.C_Pat_PCon (dtb_u_u446, dtb_u_u447, dtb_u_u448) -> (let dtb_u_u449 = (Frontend_dReserved.v_classify dtb_u_u446) in (match dtb_u_u449 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u450) -> (match dtb_u_u450 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) (Frontend_dAst.C_Pat_PCon ("MkUnit", B_dData_dList.C_List_Nil, dtb_u_u448)))
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) (Frontend_dAst.C_Pat_PCon ("Pair", dtb_u_u447, dtb_u_u448)))
  | _ -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u446) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u451 : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u451))) dtb_u_u447)) (fun (dtb_u_u452 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u446, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u452), dtb_u_u448)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u452) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u448))) ((((((v_resolveCtor dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u446))) (fun (dtb_u_u453 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u454 : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u454))) dtb_u_u447)) (fun (dtb_u_u455 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u453, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u455), dtb_u_u448)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u455) })))))))
)
  | _ -> (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u446) then ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u456 : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u456))) dtb_u_u447)) (fun (dtb_u_u457 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u446, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u457), dtb_u_u448)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u457) })))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u448))) ((((((v_resolveCtor dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u446))) (fun (dtb_u_u458 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u459 : Frontend_dAst.t_Pat) -> (((((((v_resolvePattern (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u459))) dtb_u_u447)) (fun (dtb_u_u460 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PCon (dtb_u_u458, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u460), dtb_u_u448)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u460) })))))))
))
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u461, dtb_u_u462, dtb_u_u463) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u463))) ((((((v_resolveCtor dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u461))) (fun (dtb_u_u464 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u465 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (((((((v_resolveRecordPatternField (dtb_u_u427 - 1)) dtb_u_u428) dtb_u_u429) dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u465))) dtb_u_u462)) (fun (dtb_u_u466 : ((string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Frontend_dAst.C_Pat_PRecord (dtb_u_u464, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u466), dtb_u_u463)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u466) }))))))
  | _ -> failwith "DT: impossible branch"
)))
# 795 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecordPatternField = (fun (dtb_u_u467 : int) (dtb_u_u468 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u469 : string) (dtb_u_u470 : string) (dtb_u_u471 : Loader_dModules.t_Namespaces) (dtb_u_u472 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u473 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (match dtb_u_u473 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u474; B_dData_dPair.f_Pair_second = dtb_u_u475 } -> (if (dtb_u_u467 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (dtb_u_u467 - 1)) dtb_u_u468) dtb_u_u469) dtb_u_u470) dtb_u_u471) dtb_u_u472) dtb_u_u475)) (fun (dtb_u_u476 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u476 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u477; B_dData_dPair.f_Pair_second = dtb_u_u478 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u474; B_dData_dPair.f_Pair_second = dtb_u_u477 }; B_dData_dPair.f_Pair_second = dtb_u_u478 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 848 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveLocalPats = (fun (dtb_u_u479 : int) (dtb_u_u480 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u481 : string) (dtb_u_u482 : string) (dtb_u_u483 : Loader_dModules.t_Namespaces) (dtb_u_u484 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u485 : Frontend_dAst.t_Pat B_dData_dList.t_List) -> (match dtb_u_u485 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u486, dtb_u_u487) -> (if (dtb_u_u479 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern (dtb_u_u479 - 1)) dtb_u_u480) dtb_u_u481) dtb_u_u482) dtb_u_u483) dtb_u_u484) dtb_u_u486)) (fun (dtb_u_u488 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u488 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u489; B_dData_dPair.f_Pair_second = dtb_u_u490 } -> ((Base_dCommon.v_bind (((((((v_resolveLocalPats (dtb_u_u479 - 1)) dtb_u_u480) dtb_u_u481) dtb_u_u482) dtb_u_u483) dtb_u_u484) dtb_u_u487)) (fun (dtb_u_u491 : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u491 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u492; B_dData_dPair.f_Pair_second = dtb_u_u493 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u489, dtb_u_u492)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u490) dtb_u_u493) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u479 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil })))
  | _ -> failwith "DT: impossible branch"
))

# 913 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_collectRecBinds = (fun (dtb_u_u494 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u495 : string) (dtb_u_u496 : string) (dtb_u_u497 : Loader_dModules.t_Namespaces) (dtb_u_u498 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u499 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u499 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u500, dtb_u_u501) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) dtb_u_u494) dtb_u_u495) dtb_u_u496) dtb_u_u497) dtb_u_u498) (dtb_u_u500).Frontend_dAst.f_Binding_bindPat)) (fun (dtb_u_u502 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u502 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u503; B_dData_dPair.f_Pair_second = dtb_u_u504 } -> ((Base_dCommon.v_bind ((((((v_collectRecBinds dtb_u_u494) dtb_u_u495) dtb_u_u496) dtb_u_u497) dtb_u_u498) dtb_u_u501)) (fun (dtb_u_u505 : (string B_dData_dList.t_List, Frontend_dAst.t_Binding B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u505 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u506; B_dData_dPair.f_Pair_second = dtb_u_u507 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u504) dtb_u_u506); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb_u_u503; Frontend_dAst.f_Binding_bindValue = (dtb_u_u500).Frontend_dAst.f_Binding_bindValue; Frontend_dAst.f_Binding_bindSig = (dtb_u_u500).Frontend_dAst.f_Binding_bindSig; Frontend_dAst.f_Binding_bindRef = (dtb_u_u500).Frontend_dAst.f_Binding_bindRef }, dtb_u_u507)) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 956 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_templateChunks = (fun (dtb_u_u508 : Frontend_dAst.t_NodeRef) (dtb_u_u509 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match dtb_u_u509 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u510, dtb_u_u511) -> (match dtb_u_u510 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u512) -> (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar (Base_dIntrinsics.v_interpMethodName, (Frontend_dAst.v_exprRef dtb_u_u512))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u512, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_exprRef dtb_u_u512))), ((v_templateChunks dtb_u_u508) dtb_u_u511)))
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u513) -> (if (dtb_u_u513 = "") then ((v_templateChunks dtb_u_u508) dtb_u_u511) else (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_EStr (dtb_u_u513, dtb_u_u508)), ((v_templateChunks dtb_u_u508) dtb_u_u511))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_concatLeft = (fun (dtb_u_u514 : Frontend_dAst.t_NodeRef) (dtb_u_u515 : Frontend_dAst.t_Expr) (dtb_u_u516 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (match dtb_u_u516 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u517, dtb_u_u518) -> (((v_concatLeft dtb_u_u514) (Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("++", dtb_u_u514)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u515, (B_dData_dList.C_List__x58__x58_ (dtb_u_u517, B_dData_dList.C_List_Nil)))), dtb_u_u514))) dtb_u_u518)
  | B_dData_dList.C_List_Nil -> dtb_u_u515
  | _ -> failwith "DT: impossible branch"
))

# 950 "Vuna/Compiler/Loader/Resolve.vuna"
let v_lowerTemplate = (fun (dtb_u_u519 : Frontend_dAst.t_NodeRef) (dtb_u_u520 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (match ((v_templateChunks dtb_u_u519) dtb_u_u520) with
  | B_dData_dList.C_List_Nil -> (Frontend_dAst.C_Expr_EStr ("", dtb_u_u519))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u521, dtb_u_u522) -> (((v_concatLeft dtb_u_u519) dtb_u_u521) dtb_u_u522)
  | _ -> failwith "DT: impossible branch"
))

# 971 "Vuna/Compiler/Loader/Resolve.vuna"
let v_checkDebugConstruct = (fun (dtb_u_u523 : bool) (dtb_u_u524 : Frontend_dAst.t_NodeRef) (dtb_u_u525 : string) (dtb_u_u526 : string) (dtb_u_u527 : string B_dData_dList.t_List) -> (if dtb_u_u523 then (if (Base_dIntrinsics.v_isDebugOnlyName dtb_u_u526) then (if ((B_dData_dList.v_memName dtb_u_u525) dtb_u_u527) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u526, dtb_u_u524)))) else (((Base_dDiagnostics_dTc.v_tcErr1 (Frontend_dAst.v_nodeRefSpan dtb_u_u524)) (Base_dDiagnostics_dTc.C_TcErr_DebugConstructInRelease (dtb_u_u526))) dtb_u_u526)) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u526, dtb_u_u524))))) else (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u526, dtb_u_u524))))))

# 988 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isParserSyntaxName = (fun (dtb_u_u528 : string) -> (match (Frontend_dReserved.v_classify dtb_u_u528) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u529) -> (Frontend_dReserved.v_isParserSurface dtb_u_u529)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u528 = Frontend_dReserved.v_handleOpBinderName) then true else (dtb_u_u528 = Frontend_dReserved.v_handleOpIndexBinderName))
  | _ -> failwith "DT: impossible branch"
))

# 997 "Vuna/Compiler/Loader/Resolve.vuna"
let v_hiddenRef = (fun (dtb_u_u530 : string) (dtb_u_u531 : Frontend_dAst.t_NodeRef) -> (let dtb_u_u532 = (((B_dData_dString.v_substring 1) (bi_natFromInt (String.length dtb_u_u530))) dtb_u_u530) in (match (Base_dIntrinsics.v_findIntrinsic dtb_u_u532) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u533) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u532, dtb_u_u531))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal ("hidden reference to unknown intrinsic " ^ dtb_u_u532))
  | _ -> failwith "DT: impossible branch"
)))

# 1008 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeSyntaxNames = (fun (dtb_u_u534 : Frontend_dAst.t_Expr) -> (match dtb_u_u534 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u535, dtb_u_u536, dtb_u_u537) -> (match dtb_u_u535 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u538, dtb_u_u539) -> (match dtb_u_u536 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u540, dtb_u_u541) -> (match dtb_u_u541 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u542, dtb_u_u543) -> (match dtb_u_u543 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u544 = (Frontend_dReserved.v_classify dtb_u_u538) in (match dtb_u_u544 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u545) -> (match dtb_u_u545 with
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb_u_u539)), (B_dData_dList.C_List__x58__x58_ (dtb_u_u540, (B_dData_dList.C_List__x58__x58_ (dtb_u_u542, B_dData_dList.C_List_Nil)))), dtb_u_u537))))
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
  | Frontend_dAst.C_Expr_EVar (dtb_u_u546, dtb_u_u547) -> (let dtb_u_u548 = (Frontend_dReserved.v_classify dtb_u_u546) in (match dtb_u_u548 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u549) -> (match dtb_u_u549 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("MkUnit", dtb_u_u547))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1178 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorDecl = (fun (dtb_u_u550 : string) (dtb_u_u551 : string) (dtb_u_u552 : string) (dtb_u_u553 : string) -> ((Base_dCommon.v_bind ((v_checkTopName dtb_u_u550) dtb_u_u553)) (fun (dtb_u_u554 : string) -> (Base_dDiag.C_Check_OkC ((((Loader_dModules.v_ctorCanonical dtb_u_u551) dtb_u_u552) dtb_u_u553))))))

# 1184 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerTypeName = (fun (dtb_u_u555 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u555) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u556, dtb_u_u557) -> (Frontend_dLexer.v_isLowerChar dtb_u_u556)
  | _ -> failwith "DT: impossible branch"
))

# 1190 "Vuna/Compiler/Loader/Resolve.vuna"
let v_startsUpperName = (fun (dtb_u_u558 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u558) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u559, dtb_u_u560) -> (if (dtb_u_u559 >= 65) then (dtb_u_u559 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1240 "Vuna/Compiler/Loader/Resolve.vuna"
let v_localCtorResult = (fun (dtb_u_u561 : string) (dtb_u_u562 : string) (dtb_u_u563 : Loader_dModules.t_Namespaces) (dtb_u_u564 : string) -> (let dtb_u_u565 = (((v_localCtorTargets dtb_u_u562) dtb_u_u563) dtb_u_u564) in (match dtb_u_u565 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u566, dtb_u_u567) -> (match dtb_u_u567 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just (dtb_u_u566))))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructor (dtb_u_u564, ("Data." ^ dtb_u_u564)))) dtb_u_u564) ("Data." ^ dtb_u_u564))
)
  | _ -> failwith "DT: impossible branch"
)))

# 1248 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveLowerTypeName = (fun (dtb_u_u568 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u569 : string) (dtb_u_u570 : string) (dtb_u_u571 : Loader_dModules.t_Namespaces) (dtb_u_u572 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u573 : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u573) (dtb_u_u571).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u570) dtb_u_u573))) else ((Base_dCommon.v_bind ((((v_localCtorResult dtb_u_u569) dtb_u_u570) dtb_u_u571) dtb_u_u573)) (fun (dtb_u_u574 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u574 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u575) -> (Base_dDiag.C_Check_OkC (dtb_u_u575))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValueIn (dtb_u_u571).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u571).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u573)) (fun (dtb_u_u576 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u576 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingCtorIn (dtb_u_u571).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u571).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u573)) (fun (dtb_u_u577 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u577 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (dtb_u_u571).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u571).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u573)) (fun (dtb_u_u578 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u578 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u573))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u569) "name") dtb_u_u573) dtb_u_u578)) (fun (dtb_u_u579 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u579)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u569) "name") dtb_u_u573) dtb_u_u577)) (fun (dtb_u_u580 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u580)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u569) "name") dtb_u_u573) dtb_u_u576)) (fun (dtb_u_u581 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u581)).Loader_dModules.f_ExportEntry_target))))
)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1304 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedTypeName = (fun (dtb_u_u582 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u583 : string) (dtb_u_u584 : string) (dtb_u_u585 : Loader_dModules.t_Namespaces) (dtb_u_u586 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u587 : string) -> ((Base_dCommon.v_bind (((v_resolvePathPrefixes dtb_u_u582) dtb_u_u586) (Base_dSource.v_splitOnDot dtb_u_u587))) (fun (dtb_u_u588 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (v_isEmptyPaths dtb_u_u588) then ((((((v_resolveFamilyQualifiedCtor dtb_u_u582) dtb_u_u583) dtb_u_u584) dtb_u_u585) dtb_u_u586) dtb_u_u587) else ((Base_dCommon.v_bind ((((v_entryHits v_pickTypeEntries) dtb_u_u582) dtb_u_u588) ((v_memberLabel dtb_u_u587) dtb_u_u588))) (fun (dtb_u_u589 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u589 with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtorDotted dtb_u_u582) dtb_u_u583) dtb_u_u584) dtb_u_u585) dtb_u_u586) dtb_u_u587) with
  | Base_dDiag.C_Check_OkC (dtb_u_u590) -> (Base_dDiag.C_Check_OkC (dtb_u_u590))
  | Base_dDiag.C_Check_ErrC (dtb_u_u591) -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (((v_memberLabel dtb_u_u587) dtb_u_u588), ((v_firstModuleOf dtb_u_u587) dtb_u_u588)))) ((v_memberLabel dtb_u_u587) dtb_u_u588)) ((v_firstModuleOf dtb_u_u587) dtb_u_u588))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u583) "type") ((v_memberLabel dtb_u_u587) dtb_u_u588)) dtb_u_u589)) (fun (dtb_u_u592 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u592)).Loader_dModules.f_ExportEntry_target))))
)))))))

# 1279 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveNonLowerTypeName = (fun (dtb_u_u593 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u594 : string) (dtb_u_u595 : string) (dtb_u_u596 : Loader_dModules.t_Namespaces) (dtb_u_u597 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u598 : string) -> ((Base_dCommon.v_bind ((((v_localCtorResult dtb_u_u594) dtb_u_u595) dtb_u_u596) dtb_u_u598)) (fun (dtb_u_u599 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u599 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u600) -> (Base_dDiag.C_Check_OkC (dtb_u_u600))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Base_dSource.v_containsDot dtb_u_u598) then ((((((v_resolveDottedTypeName dtb_u_u593) dtb_u_u594) dtb_u_u595) dtb_u_u596) dtb_u_u597) dtb_u_u598) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (dtb_u_u596).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u596).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u598)) (fun (dtb_u_u601 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u601 with
  | B_dData_dList.C_List_Nil -> (match ((((((v_resolveCtor dtb_u_u593) dtb_u_u594) dtb_u_u595) dtb_u_u596) dtb_u_u597) dtb_u_u598) with
  | Base_dDiag.C_Check_OkC (dtb_u_u602) -> (Base_dDiag.C_Check_OkC (dtb_u_u602))
  | Base_dDiag.C_Check_ErrC (dtb_u_u603) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u598) (dtb_u_u596).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u595) dtb_u_u598))) else (Base_dDiag.C_Check_ErrC (dtb_u_u603)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u594) "type") dtb_u_u598) dtb_u_u601)) (fun (dtb_u_u604 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u604)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1225 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeName = (fun (dtb_u_u605 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u606 : string) (dtb_u_u607 : string) (dtb_u_u608 : Loader_dModules.t_Namespaces) (dtb_u_u609 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u610 : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u610) (dtb_u_u608).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u607) dtb_u_u610))) else (if (Base_dIntrinsics.v_isIntrinsicTypeName dtb_u_u610) then (Base_dDiag.C_Check_OkC (dtb_u_u610)) else (if (if (dtb_u_u610 = "Type") then true else (dtb_u_u610 = "->")) then (Base_dDiag.C_Check_OkC (dtb_u_u610)) else (if (v_isLowerTypeName dtb_u_u610) then ((((((v_resolveLowerTypeName dtb_u_u605) dtb_u_u606) dtb_u_u607) dtb_u_u608) dtb_u_u609) dtb_u_u610) else ((((((v_resolveNonLowerTypeName dtb_u_u605) dtb_u_u606) dtb_u_u607) dtb_u_u608) dtb_u_u609) dtb_u_u610))))))

# 1211 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveRecordDeriving = (fun (dtb_u_u611 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u612 : string) (dtb_u_u613 : string) (dtb_u_u614 : Loader_dModules.t_Namespaces) (dtb_u_u615 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u616 : string) -> (if (dtb_u_u616 = Loader_dSelectors.v_selectorDerivingName) then (Base_dDiag.C_Check_OkC (dtb_u_u616)) else ((((((v_resolveTypeName dtb_u_u611) dtb_u_u612) dtb_u_u613) dtb_u_u614) dtb_u_u615) dtb_u_u616)))

# 1218 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDataDeriving = (fun (dtb_u_u617 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u618 : string) (dtb_u_u619 : string) (dtb_u_u620 : Loader_dModules.t_Namespaces) (dtb_u_u621 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u622 : string) (dtb_u_u623 : string) -> (if (dtb_u_u623 = Loader_dSelectors.v_selectorDerivingName) then ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_SelectorNotRecord (dtb_u_u622))) dtb_u_u622) else ((((((v_resolveTypeName dtb_u_u617) dtb_u_u618) dtb_u_u619) dtb_u_u620) dtb_u_u621) dtb_u_u623)))

# 1335 "Vuna/Compiler/Loader/Resolve.vuna"
let v_constraintHeadOf = (fun (dtb_u_u624 : Frontend_dAst.t_Expr) -> (match dtb_u_u624 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u625, dtb_u_u626) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u625))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u627, dtb_u_u628, dtb_u_u629) -> (match dtb_u_u627 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u630, dtb_u_u631) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u630))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1347 "Vuna/Compiler/Loader/Resolve.vuna"
let v_normalizeTypeSyntaxNames = (fun (dtb_u_u632 : Frontend_dAst.t_Expr) -> (match dtb_u_u632 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u633, dtb_u_u634, dtb_u_u635) -> (match dtb_u_u633 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u636, dtb_u_u637) -> (let dtb_u_u638 = (Frontend_dReserved.v_classify dtb_u_u636) in (match dtb_u_u638 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u639) -> (match dtb_u_u639 with
  | Frontend_dReserved.C_Reserved_RsTuplePair -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ("Pair", dtb_u_u637)), dtb_u_u634, dtb_u_u635))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u640, dtb_u_u641) -> (let dtb_u_u642 = (Frontend_dReserved.v_classify dtb_u_u640) in (match dtb_u_u642 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u643) -> (match dtb_u_u643 with
  | Frontend_dReserved.C_Reserved_RsTupleUnit -> (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.C_Expr_EVar ("Unit", dtb_u_u641))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1385 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeTopName = (fun (dtb_u_u644 : string) (dtb_u_u645 : string) (dtb_u_u646 : string) -> ((Base_dCommon.v_bind ((v_checkTopName dtb_u_u644) dtb_u_u646)) (fun (dtb_u_u647 : string) -> (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u645) dtb_u_u646))))))

# 1496 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isLowerIdent = (fun (dtb_u_u648 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u648) with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u649, dtb_u_u650) -> (if (dtb_u_u649 >= 97) then (dtb_u_u649 <= 122) else false)
  | _ -> failwith "DT: impossible branch"
))

# 1491 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_exprLowerNames = (fun (dtb_u_u651 : Frontend_dAst.t_Expr) -> (match dtb_u_u651 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u652, dtb_u_u653, dtb_u_u654) -> ((B_dData_dList.v_append (v_exprLowerNames dtb_u_u652)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb_u_u653))
  | Frontend_dAst.C_Expr_EVar (dtb_u_u655, dtb_u_u656) -> (if (v_isLowerIdent dtb_u_u655) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u655, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1502 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_scopeNamesOf = (fun (dtb_u_u657 : string) (dtb_u_u658 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u658 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u659, dtb_u_u660) -> (match dtb_u_u659 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u661; B_dData_dPair.f_Pair_second = dtb_u_u662 } -> (if (dtb_u_u661 = dtb_u_u657) then dtb_u_u662 else ((v_scopeNamesOf dtb_u_u657) dtb_u_u660))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1528 "Vuna/Compiler/Loader/Resolve.vuna"
let v_tyShape = (fun (dtb_u_u663 : Frontend_dAst.t_Expr) -> (match dtb_u_u663 with
  | Frontend_dAst.C_Expr_EDo (dtb_u_u664, dtb_u_u665) -> "do"
  | Frontend_dAst.C_Expr_EIf (dtb_u_u666, dtb_u_u667, dtb_u_u668, dtb_u_u669) -> "if"
  | Frontend_dAst.C_Expr_ECase (dtb_u_u670, dtb_u_u671, dtb_u_u672) -> "case"
  | Frontend_dAst.C_Expr_ELet (dtb_u_u673, dtb_u_u674, dtb_u_u675, dtb_u_u676) -> "let"
  | Frontend_dAst.C_Expr_ELam (dtb_u_u677, dtb_u_u678, dtb_u_u679) -> "lam"
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u680, dtb_u_u681) -> "float"
  | Frontend_dAst.C_Expr_EStr (dtb_u_u682, dtb_u_u683) -> "str"
  | Frontend_dAst.C_Expr_EInt (dtb_u_u684, dtb_u_u685) -> "int"
  | Frontend_dAst.C_Expr_EApp (dtb_u_u686, dtb_u_u687, dtb_u_u688) -> "app"
  | Frontend_dAst.C_Expr_EVar (dtb_u_u689, dtb_u_u690) -> ("var " ^ dtb_u_u689)
  | _ -> "other"
))

# 1358 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveTypeExprScoped = (fun (dtb_u_u691 : int) (dtb_u_u692 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u693 : string) (dtb_u_u694 : string) (dtb_u_u695 : Loader_dModules.t_Namespaces) (dtb_u_u696 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u697 : string B_dData_dList.t_List) (dtb_u_u698 : Frontend_dAst.t_Expr) -> (if (dtb_u_u691 <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeTypeSyntaxNames dtb_u_u698) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u699) -> ((((((((v_resolveTypeExprScoped (dtb_u_u691 - 1)) dtb_u_u692) dtb_u_u693) dtb_u_u694) dtb_u_u695) dtb_u_u696) dtb_u_u697) dtb_u_u699)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveTypeExprScopedRaw dtb_u_u691) dtb_u_u692) dtb_u_u693) dtb_u_u694) dtb_u_u695) dtb_u_u696) dtb_u_u697) dtb_u_u698)
  | _ -> failwith "DT: impossible branch"
)))
# 1367 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveTypeExprScopedRaw = (fun (dtb_u_u700 : int) (dtb_u_u701 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u702 : string) (dtb_u_u703 : string) (dtb_u_u704 : Loader_dModules.t_Namespaces) (dtb_u_u705 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u706 : string B_dData_dList.t_List) (dtb_u_u707 : Frontend_dAst.t_Expr) -> (if (dtb_u_u700 <= 0) then (Base_dDiag.v_icFuel "resolver") else (let dtb_u_u708 = dtb_u_u707 in (match dtb_u_u708 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u709, dtb_u_u710, dtb_u_u711, dtb_u_u712, dtb_u_u713, dtb_u_u714) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (dtb_u_u700 - 1)) dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) dtb_u_u706) dtb_u_u712)) (fun (dtb_u_u715 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (dtb_u_u700 - 1)) dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) (B_dData_dList.C_List__x58__x58_ (dtb_u_u709, dtb_u_u706))) dtb_u_u713)) (fun (dtb_u_u716 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb_u_u709, dtb_u_u710, dtb_u_u711, dtb_u_u715, dtb_u_u716, dtb_u_u714))))))))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u717, dtb_u_u718, dtb_u_u719) -> (match dtb_u_u717 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u720, dtb_u_u721) -> (if (dtb_u_u720 = "Type") then (Base_dDiag.C_Check_OkC (dtb_u_u707)) else ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (dtb_u_u700 - 1)) dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) dtb_u_u706) dtb_u_u717)) (fun (dtb_u_u722 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u723 : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (dtb_u_u700 - 1)) dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) dtb_u_u706) dtb_u_u723))) dtb_u_u718)) (fun (dtb_u_u724 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u722, dtb_u_u724, dtb_u_u719)))))))))
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveTypeExprScoped (dtb_u_u700 - 1)) dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) dtb_u_u706) dtb_u_u717)) (fun (dtb_u_u725 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u726 : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped (dtb_u_u700 - 1)) dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) dtb_u_u706) dtb_u_u726))) dtb_u_u718)) (fun (dtb_u_u727 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u725, dtb_u_u727, dtb_u_u719))))))))
)
  | Frontend_dAst.C_Expr_EVar (dtb_u_u728, dtb_u_u729) -> (if ((B_dData_dList.v_memName dtb_u_u728) dtb_u_u706) then (Base_dDiag.C_Check_OkC (dtb_u_u707)) else (if (Frontend_dReserved.v_isMacroSyntaxName dtb_u_u728) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb_u_u728)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u728) then (Base_dDiag.C_Check_OkC (dtb_u_u707)) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u729))) ((((((v_resolveTypeName dtb_u_u701) dtb_u_u702) dtb_u_u703) dtb_u_u704) dtb_u_u705) dtb_u_u728))) (fun (dtb_u_u730 : string) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u730, dtb_u_u729)))))))))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u731, dtb_u_u732) -> (Base_dDiag.C_Check_OkC (dtb_u_u707))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u733, dtb_u_u734) -> (Base_dDiag.C_Check_OkC (dtb_u_u707))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan dtb_u_u707))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_InvalidTypeExpression ((v_tyShape dtb_u_u707)))) (v_tyShape dtb_u_u707)))
))))

# 1340 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTypeExpr = (fun (dtb_u_u735 : int) (dtb_u_u736 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u737 : string) (dtb_u_u738 : string) (dtb_u_u739 : Loader_dModules.t_Namespaces) (dtb_u_u740 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u741 : Frontend_dAst.t_Expr) -> ((((((((v_resolveTypeExprScoped dtb_u_u735) dtb_u_u736) dtb_u_u737) dtb_u_u738) dtb_u_u739) dtb_u_u740) B_dData_dList.C_List_Nil) dtb_u_u741))

# 1326 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveConstraintExpr = (fun (dtb_u_u742 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u743 : string) (dtb_u_u744 : string) (dtb_u_u745 : Loader_dModules.t_Namespaces) (dtb_u_u746 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u747 : Frontend_dAst.t_Expr) -> (match (v_constraintHeadOf dtb_u_u747) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u748) -> (match ((((((v_resolveTypeName dtb_u_u742) dtb_u_u743) dtb_u_u744) dtb_u_u745) dtb_u_u746) dtb_u_u748) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u749) -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_exprSpan dtb_u_u747))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownInterface (dtb_u_u748))) dtb_u_u748))
  | Base_dDiag.C_Check_OkC (dtb_u_u750) -> (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u742) dtb_u_u743) dtb_u_u744) dtb_u_u745) dtb_u_u746) dtb_u_u747)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u742) dtb_u_u743) dtb_u_u744) dtb_u_u745) dtb_u_u746) dtb_u_u747)
  | _ -> failwith "DT: impossible branch"
))

# 1390 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveCtorSpec = (fun (dtb_u_u751 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u752 : string) (dtb_u_u753 : string) (dtb_u_u754 : Loader_dModules.t_Namespaces) (dtb_u_u755 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u756 : string) (dtb_u_u757 : Frontend_dAst.t_Ctor) -> (match dtb_u_u757 with
  | { Frontend_dAst.f_Ctor_ctorName = dtb_u_u758; Frontend_dAst.f_Ctor_ctorType = dtb_u_u759; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u760; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u761 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u761))) ((((v_resolveCtorDecl dtb_u_u752) dtb_u_u753) dtb_u_u756) dtb_u_u758))) (fun (dtb_u_u762 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u751) dtb_u_u752) dtb_u_u753) dtb_u_u754) dtb_u_u755) dtb_u_u759)) (fun (dtb_u_u763 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Ctor_ctorName = dtb_u_u762; Frontend_dAst.f_Ctor_ctorType = dtb_u_u763; Frontend_dAst.f_Ctor_ctorArity = dtb_u_u760; Frontend_dAst.f_Ctor_ctorRef = dtb_u_u761 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1433 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveRecordField = (fun (dtb_u_u764 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u765 : string) (dtb_u_u766 : string) (dtb_u_u767 : Loader_dModules.t_Namespaces) (dtb_u_u768 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u769 : Frontend_dAst.t_Field) -> (match dtb_u_u769 with
  | { Frontend_dAst.f_Field_fieldName = dtb_u_u770; Frontend_dAst.f_Field_fieldType = dtb_u_u771; Frontend_dAst.f_Field_fieldRef = dtb_u_u772 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u772))) ((v_checkBinder dtb_u_u765) dtb_u_u770))) (fun (dtb_u_u773 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u764) dtb_u_u765) dtb_u_u766) dtb_u_u767) dtb_u_u768) dtb_u_u771)) (fun (dtb_u_u774 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Field_fieldName = dtb_u_u770; Frontend_dAst.f_Field_fieldType = dtb_u_u774; Frontend_dAst.f_Field_fieldRef = dtb_u_u772 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1439 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveTraitMethod = (fun (dtb_u_u775 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u776 : string) (dtb_u_u777 : string) (dtb_u_u778 : Loader_dModules.t_Namespaces) (dtb_u_u779 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u780 : Frontend_dAst.t_TraitMethod) -> (match dtb_u_u780 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u781; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u782; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb_u_u783 } -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u783))) (((v_resolveTopName dtb_u_u776) dtb_u_u777) dtb_u_u781))) (fun (dtb_u_u784 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u775) dtb_u_u776) dtb_u_u777) dtb_u_u778) dtb_u_u779) dtb_u_u782)) (fun (dtb_u_u785 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u784; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u785; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb_u_u783 }))))))
  | _ -> failwith "DT: impossible branch"
))

# 1544 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_ctorPairTargets = (fun (dtb_u_u786 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u787 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u787 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u788, dtb_u_u789) -> (match dtb_u_u788 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u790; B_dData_dPair.f_Pair_second = dtb_u_u791 } -> (let dtb_u_u792 = (if ((dtb_u_u791).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((Loader_dModules.v_isDataOrRecordCtorTarget dtb_u_u786) (dtb_u_u791).Loader_dModules.f_ExportEntry_target)) in (if dtb_u_u792 then (B_dData_dList.C_List__x58__x58_ ((dtb_u_u791).Loader_dModules.f_ExportEntry_target, ((v_ctorPairTargets dtb_u_u786) dtb_u_u789))) else ((v_ctorPairTargets dtb_u_u786) dtb_u_u789)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveGlobal = (fun (dtb_u_u793 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u794 : string) (dtb_u_u795 : string) (dtb_u_u796 : Loader_dModules.t_Namespaces) (dtb_u_u797 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u798 : string B_dData_dList.t_List) (dtb_u_u799 : string) -> (if ((B_dData_dList.v_memName dtb_u_u799) dtb_u_u798) then (Base_dDiag.C_Check_OkC (dtb_u_u799)) else (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u799) (dtb_u_u796).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u795) dtb_u_u799))) else (match (((v_localCtorTargets dtb_u_u795) dtb_u_u796) dtb_u_u799) with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u800, dtb_u_u801) -> ((Base_dCommon.v_bind (((((v_ctorCandidates dtb_u_u793) dtb_u_u795) dtb_u_u796) dtb_u_u797) dtb_u_u799)) (fun (dtb_u_u802 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver dtb_u_u799) dtb_u_u802)))))
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u799) (dtb_u_u796).Loader_dModules.f_Namespaces_nsCtorSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u795) dtb_u_u799))) else (if (Base_dSource.v_containsDot dtb_u_u799) then ((((v_resolveQualified dtb_u_u793) dtb_u_u794) dtb_u_u797) dtb_u_u799) else (if (v_isBuiltinName dtb_u_u799) then (Base_dDiag.C_Check_OkC (dtb_u_u799)) else (if (v_isDtPreludeName dtb_u_u799) then (Base_dDiag.C_Check_OkC (dtb_u_u799)) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValueIn (dtb_u_u796).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u796).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u799)) (fun (dtb_u_u803 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u803 with
  | B_dData_dList.C_List_Nil -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u799) (dtb_u_u796).Loader_dModules.f_Namespaces_nsTypeSet) then (Base_dDiag.C_Check_OkC (((Loader_dModules.v_mangle dtb_u_u795) dtb_u_u799))) else ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingTypeIn (dtb_u_u796).Loader_dModules.f_Namespaces_nsModuleTbl) (dtb_u_u796).Loader_dModules.f_Namespaces_nsOpenNames) dtb_u_u799)) (fun (dtb_u_u804 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u804 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage ((Base_dSource.v_suggest dtb_u_u799) ((B_dData_dList.v_append (dtb_u_u796).Loader_dModules.f_Namespaces_nsValues) ((B_dData_dList.v_append (dtb_u_u796).Loader_dModules.f_Namespaces_nsCtors) ((B_dData_dList.v_append (dtb_u_u796).Loader_dModules.f_Namespaces_nsTypes) dtb_u_u798)))))) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_appendMessage (v_traitImportHint dtb_u_u799))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (dtb_u_u799))) dtb_u_u799)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u794) "name") dtb_u_u799) dtb_u_u804)) (fun (dtb_u_u805 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf dtb_u_u805)).Loader_dModules.f_ExportEntry_target))))
))))
  | _ -> (match ((v_ctorPairTargets dtb_u_u793) dtb_u_u803) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickValueOrOver dtb_u_u799) dtb_u_u803)))
  | dtb_u_u806 -> (match ((v_valuePairTargets dtb_u_u793) dtb_u_u803) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (((v_pickCtorOrOver dtb_u_u799) (B_dData_dList.v_nubNames dtb_u_u806))))
  | _ -> (Base_dDiag.C_Check_OkC ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsOverValue (dtb_u_u799, (B_dData_dList.v_nubNames ((B_dData_dList.v_map v_pairExportTarget) dtb_u_u803)))))))
)
)
)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 541 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDottedExpr = (fun (dtb_u_u807 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u808 : string) (dtb_u_u809 : string) (dtb_u_u810 : Loader_dModules.t_Namespaces) (dtb_u_u811 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u812 : string B_dData_dList.t_List) (dtb_u_u813 : string) (dtb_u_u814 : Frontend_dAst.t_NodeRef) -> (match (Base_dSource.v_splitOnDot dtb_u_u813) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.v_icInternal "empty dotted name")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u815, dtb_u_u816) -> (if ((B_dData_dList.v_memName dtb_u_u815) dtb_u_u812) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb_u_u815, dtb_u_u814))) dtb_u_u816) dtb_u_u814))) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u814))) ((((((v_resolveQualifiedPath dtb_u_u807) dtb_u_u808) dtb_u_u811) (Base_dSource.v_splitOnDot dtb_u_u813)) (B_dData_dList.v_length (Base_dSource.v_splitOnDot dtb_u_u813))) dtb_u_u814))) (fun (dtb_u_u817 : Frontend_dAst.t_Expr B_dData_dMaybe.t_Maybe) -> (match dtb_u_u817 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u818) -> (Base_dDiag.C_Check_OkC (dtb_u_u818))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u815) (dtb_u_u810).Loader_dModules.f_Namespaces_nsValueSet) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (((Loader_dModules.v_mangle dtb_u_u809) dtb_u_u815), dtb_u_u814))) dtb_u_u816) dtb_u_u814))) else (if (v_isBuiltinName dtb_u_u815) then (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb_u_u815, dtb_u_u814))) dtb_u_u816) dtb_u_u814))) else (if (v_startsUpperName dtb_u_u815) then (match ((((((v_resolveCtorDotted dtb_u_u807) dtb_u_u808) dtb_u_u809) dtb_u_u810) dtb_u_u811) dtb_u_u813) with
  | Base_dDiag.C_Check_OkC (dtb_u_u819) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u819, dtb_u_u814))))
  | Base_dDiag.C_Check_ErrC (dtb_u_u820) -> (match (((((v_dottedFieldSelector dtb_u_u809) dtb_u_u810) dtb_u_u815) dtb_u_u816) dtb_u_u814) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u821) -> (Base_dDiag.C_Check_OkC (dtb_u_u821))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u814))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb_u_u815))) dtb_u_u815))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u814))) (((((((v_resolveGlobal dtb_u_u807) dtb_u_u808) dtb_u_u809) dtb_u_u810) dtb_u_u811) dtb_u_u812) dtb_u_u815))) (fun (dtb_u_u822 : string) -> (Base_dDiag.C_Check_OkC ((((v_foldFieldChain (Frontend_dAst.C_Expr_EVar (dtb_u_u822, dtb_u_u814))) dtb_u_u816) dtb_u_u814))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 1098 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDoBind = (fun (dtb_u_u823 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u824 : string) (dtb_u_u825 : string) (dtb_u_u826 : Loader_dModules.t_Namespaces) (dtb_u_u827 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u828 : string B_dData_dList.t_List) -> (match (((((((v_resolveGlobal dtb_u_u823) dtb_u_u824) dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u828) ">>=") with
  | Base_dDiag.C_Check_OkC (dtb_u_u829) -> (Base_dDiag.C_Check_OkC (dtb_u_u829))
  | Base_dDiag.C_Check_ErrC (dtb_u_u830) -> (((((((v_resolveGlobal dtb_u_u823) dtb_u_u824) dtb_u_u825) dtb_u_u826) dtb_u_u827) dtb_u_u828) "bind")
  | _ -> failwith "DT: impossible branch"
))

# 806 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveAlt = (fun (dtb_u_u831 : int) (dtb_u_u832 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u833 : string) (dtb_u_u834 : string) (dtb_u_u835 : Loader_dModules.t_Namespaces) (dtb_u_u836 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u837 : string B_dData_dList.t_List) (dtb_u_u838 : Frontend_dAst.t_Alt) -> (if (dtb_u_u831 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) dtb_u_u832) dtb_u_u833) dtb_u_u834) dtb_u_u835) dtb_u_u836) (dtb_u_u838).Frontend_dAst.f_Alt_altPat)) (fun (dtb_u_u839 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u839 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u840; B_dData_dPair.f_Pair_second = dtb_u_u841 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u831 - 1)) dtb_u_u832) dtb_u_u833) dtb_u_u834) dtb_u_u835) dtb_u_u836) ((B_dData_dList.v_append dtb_u_u841) dtb_u_u837)) (dtb_u_u838).Frontend_dAst.f_Alt_altBody)) (fun (dtb_u_u842 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_Alt_altPat = dtb_u_u840; Frontend_dAst.f_Alt_altBody = dtb_u_u842; Frontend_dAst.f_Alt_altRef = (dtb_u_u838).Frontend_dAst.f_Alt_altRef }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 818 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveBindingSig = (fun (dtb_u_u843 : int) (dtb_u_u844 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u845 : string) (dtb_u_u846 : string) (dtb_u_u847 : Loader_dModules.t_Namespaces) (dtb_u_u848 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u849 : string B_dData_dList.t_List) (dtb_u_u850 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> (match dtb_u_u850 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u851) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u843 - 1)) dtb_u_u844) dtb_u_u845) dtb_u_u846) dtb_u_u847) dtb_u_u848) dtb_u_u849) (dtb_u_u851).Frontend_dAst.f_BindingSig_sigType)) (fun (dtb_u_u852 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Frontend_dAst.f_BindingSig_sigType = dtb_u_u852; Frontend_dAst.f_BindingSig_sigRef = (dtb_u_u851).Frontend_dAst.f_BindingSig_sigRef }))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))
# 826 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveBindingValue = (fun (dtb_u_u853 : int) (dtb_u_u854 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u855 : string) (dtb_u_u856 : string) (dtb_u_u857 : Loader_dModules.t_Namespaces) (dtb_u_u858 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u859 : string B_dData_dList.t_List) (dtb_u_u860 : Frontend_dAst.t_BindingValue) -> (match dtb_u_u860 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u861) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u862 : Frontend_dAst.t_LocalClause) -> ((((((((v_resolveLocalClause (dtb_u_u853 - 1)) dtb_u_u854) dtb_u_u855) dtb_u_u856) dtb_u_u857) dtb_u_u858) dtb_u_u859) dtb_u_u862))) dtb_u_u861)) (fun (dtb_u_u863 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BClauses (dtb_u_u863))))))
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u864) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u853 - 1)) dtb_u_u854) dtb_u_u855) dtb_u_u856) dtb_u_u857) dtb_u_u858) dtb_u_u859) dtb_u_u864)) (fun (dtb_u_u865 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_BindingValue_BVal (dtb_u_u865))))))
  | _ -> failwith "DT: impossible branch"
))
# 837 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLocalClause = (fun (dtb_u_u866 : int) (dtb_u_u867 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u868 : string) (dtb_u_u869 : string) (dtb_u_u870 : Loader_dModules.t_Namespaces) (dtb_u_u871 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u872 : string B_dData_dList.t_List) (dtb_u_u873 : Frontend_dAst.t_LocalClause) -> (if (dtb_u_u866 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind (((((((v_resolveLocalPats (dtb_u_u866 - 1)) dtb_u_u867) dtb_u_u868) dtb_u_u869) dtb_u_u870) dtb_u_u871) (dtb_u_u873).Frontend_dAst.f_LocalClause_lcPats)) (fun (dtb_u_u874 : (Frontend_dAst.t_Pat B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u874 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u875; B_dData_dPair.f_Pair_second = dtb_u_u876 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u866 - 1)) dtb_u_u867) dtb_u_u868) dtb_u_u869) dtb_u_u870) dtb_u_u871) ((B_dData_dList.v_append dtb_u_u876) dtb_u_u872)) (dtb_u_u873).Frontend_dAst.f_LocalClause_lcBody)) (fun (dtb_u_u877 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ Frontend_dAst.f_LocalClause_lcPats = dtb_u_u875; Frontend_dAst.f_LocalClause_lcBody = dtb_u_u877; Frontend_dAst.f_LocalClause_lcRef = (dtb_u_u873).Frontend_dAst.f_LocalClause_lcRef; Frontend_dAst.f_LocalClause_lcHead = (dtb_u_u873).Frontend_dAst.f_LocalClause_lcHead }))))
  | _ -> failwith "DT: impossible branch"
)))))
# 866 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLet = (fun (dtb_u_u878 : int) (dtb_u_u879 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u880 : string) (dtb_u_u881 : string) (dtb_u_u882 : Loader_dModules.t_Namespaces) (dtb_u_u883 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u884 : string B_dData_dList.t_List) (dtb_u_u885 : bool) (dtb_u_u886 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u887 : Frontend_dAst.t_Expr) -> (if (dtb_u_u878 <= 0) then (Base_dDiag.v_icFuel "resolver") else (if dtb_u_u885 then (((((((((v_resolveRecLet (dtb_u_u878 - 1)) dtb_u_u879) dtb_u_u880) dtb_u_u881) dtb_u_u882) dtb_u_u883) dtb_u_u884) dtb_u_u886) dtb_u_u887) else (((((((((v_resolveLetSeq (dtb_u_u878 - 1)) dtb_u_u879) dtb_u_u880) dtb_u_u881) dtb_u_u882) dtb_u_u883) dtb_u_u884) dtb_u_u886) dtb_u_u887))))
# 875 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveLetSeq = (fun (dtb_u_u888 : int) (dtb_u_u889 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u890 : string) (dtb_u_u891 : string) (dtb_u_u892 : Loader_dModules.t_Namespaces) (dtb_u_u893 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u894 : string B_dData_dList.t_List) (dtb_u_u895 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u896 : Frontend_dAst.t_Expr) -> (if (dtb_u_u888 <= 0) then (Base_dDiag.v_icFuel "resolver") else (match dtb_u_u895 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u888 - 1)) dtb_u_u889) dtb_u_u890) dtb_u_u891) dtb_u_u892) dtb_u_u893) dtb_u_u894) dtb_u_u896)) (fun (dtb_u_u897 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u897 }))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u898, dtb_u_u899) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (dtb_u_u888 - 1)) dtb_u_u889) dtb_u_u890) dtb_u_u891) dtb_u_u892) dtb_u_u893) dtb_u_u894) (dtb_u_u898).Frontend_dAst.f_Binding_bindSig)) (fun (dtb_u_u900 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (dtb_u_u888 - 1)) dtb_u_u889) dtb_u_u890) dtb_u_u891) dtb_u_u892) dtb_u_u893) dtb_u_u894) (dtb_u_u898).Frontend_dAst.f_Binding_bindValue)) (fun (dtb_u_u901 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) dtb_u_u889) dtb_u_u890) dtb_u_u891) dtb_u_u892) dtb_u_u893) (dtb_u_u898).Frontend_dAst.f_Binding_bindPat)) (fun (dtb_u_u902 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u902 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u903; B_dData_dPair.f_Pair_second = dtb_u_u904 } -> ((Base_dCommon.v_bind (((((((((v_resolveLetSeq (dtb_u_u888 - 1)) dtb_u_u889) dtb_u_u890) dtb_u_u891) dtb_u_u892) dtb_u_u893) ((B_dData_dList.v_append dtb_u_u904) dtb_u_u894)) dtb_u_u899) dtb_u_u896)) (fun (dtb_u_u905 : (Frontend_dAst.t_Binding B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u905 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u906; B_dData_dPair.f_Pair_second = dtb_u_u907 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb_u_u903; Frontend_dAst.f_Binding_bindValue = dtb_u_u901; Frontend_dAst.f_Binding_bindSig = dtb_u_u900; Frontend_dAst.f_Binding_bindRef = (dtb_u_u898).Frontend_dAst.f_Binding_bindRef }, dtb_u_u906)); B_dData_dPair.f_Pair_second = dtb_u_u907 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 901 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecLet = (fun (dtb_u_u908 : int) (dtb_u_u909 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u910 : string) (dtb_u_u911 : string) (dtb_u_u912 : Loader_dModules.t_Namespaces) (dtb_u_u913 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u914 : string B_dData_dList.t_List) (dtb_u_u915 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u916 : Frontend_dAst.t_Expr) -> (if (dtb_u_u908 <= 0) then (Base_dDiag.v_icFuel "resolver") else (let dtb_u_u917 = ((((((v_collectRecBinds dtb_u_u909) dtb_u_u910) dtb_u_u911) dtb_u_u912) dtb_u_u913) dtb_u_u915) in (match dtb_u_u917 with
  | Base_dDiag.C_Check_OkC (dtb_u_u918) -> (match dtb_u_u918 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u919; B_dData_dPair.f_Pair_second = dtb_u_u920 } -> (let dtb_u_u921 = ((B_dData_dList.v_append dtb_u_u919) dtb_u_u914) in ((Base_dCommon.v_bind ((((((((v_resolveRecValues (dtb_u_u908 - 1)) dtb_u_u909) dtb_u_u910) dtb_u_u911) dtb_u_u912) dtb_u_u913) dtb_u_u921) dtb_u_u920)) (fun (dtb_u_u922 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u908 - 1)) dtb_u_u909) dtb_u_u910) dtb_u_u911) dtb_u_u912) dtb_u_u913) dtb_u_u921) dtb_u_u916)) (fun (dtb_u_u923 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u922; B_dData_dPair.f_Pair_second = dtb_u_u923 })))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u924) -> (Base_dDiag.C_Check_ErrC (dtb_u_u924))
  | _ -> failwith "DT: impossible branch"
))))
# 929 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveRecValues = (fun (dtb_u_u925 : int) (dtb_u_u926 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u927 : string) (dtb_u_u928 : string) (dtb_u_u929 : Loader_dModules.t_Namespaces) (dtb_u_u930 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u931 : string B_dData_dList.t_List) (dtb_u_u932 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (match dtb_u_u932 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u933, dtb_u_u934) -> (if (dtb_u_u925 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (dtb_u_u925 - 1)) dtb_u_u926) dtb_u_u927) dtb_u_u928) dtb_u_u929) dtb_u_u930) dtb_u_u931) (dtb_u_u933).Frontend_dAst.f_Binding_bindSig)) (fun (dtb_u_u935 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (dtb_u_u925 - 1)) dtb_u_u926) dtb_u_u927) dtb_u_u928) dtb_u_u929) dtb_u_u930) dtb_u_u931) (dtb_u_u933).Frontend_dAst.f_Binding_bindValue)) (fun (dtb_u_u936 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind ((((((((v_resolveRecValues (dtb_u_u925 - 1)) dtb_u_u926) dtb_u_u927) dtb_u_u928) dtb_u_u929) dtb_u_u930) dtb_u_u931) dtb_u_u934)) (fun (dtb_u_u937 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = (dtb_u_u933).Frontend_dAst.f_Binding_bindPat; Frontend_dAst.f_Binding_bindValue = dtb_u_u936; Frontend_dAst.f_Binding_bindSig = dtb_u_u935; Frontend_dAst.f_Binding_bindRef = (dtb_u_u933).Frontend_dAst.f_Binding_bindRef }, dtb_u_u937)))))))))))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u925 <= 0) then (Base_dDiag.v_icFuel "resolver") else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 1019 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExpr = (fun (dtb_u_u938 : int) (dtb_u_u939 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u940 : string) (dtb_u_u941 : string) (dtb_u_u942 : Loader_dModules.t_Namespaces) (dtb_u_u943 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u944 : string B_dData_dList.t_List) (dtb_u_u945 : Frontend_dAst.t_Expr) -> (if (dtb_u_u938 <= 0) then (Base_dDiag.v_icFuel "resolver") else (match (v_normalizeSyntaxNames dtb_u_u945) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u946) -> ((((((((v_resolveExpr (dtb_u_u938 - 1)) dtb_u_u939) dtb_u_u940) dtb_u_u941) dtb_u_u942) dtb_u_u943) dtb_u_u944) dtb_u_u946)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((v_resolveExprRaw dtb_u_u938) dtb_u_u939) dtb_u_u940) dtb_u_u941) dtb_u_u942) dtb_u_u943) dtb_u_u944) dtb_u_u945)
  | _ -> failwith "DT: impossible branch"
)))
# 1028 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveExprRaw = (fun (dtb_u_u947 : int) (dtb_u_u948 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u949 : string) (dtb_u_u950 : string) (dtb_u_u951 : Loader_dModules.t_Namespaces) (dtb_u_u952 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u953 : string B_dData_dList.t_List) (dtb_u_u954 : Frontend_dAst.t_Expr) -> (if (dtb_u_u947 <= 0) then (Base_dDiag.v_icFuel "resolver") else (match dtb_u_u954 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u955, dtb_u_u956) -> (if (Frontend_dReserved.v_isHoleName dtb_u_u955) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u955, dtb_u_u956)))) else (if (if ((B_dData_dString.v_startsWith "!") dtb_u_u955) then ((String.length dtb_u_u955) > 1) else false) then ((v_hiddenRef dtb_u_u955) dtb_u_u956) else (if (Frontend_dReserved.v_isMacroSyntaxName dtb_u_u955) then (Base_dDiag.v_icInternal ("unexpanded macro invocation " ^ dtb_u_u955)) else (if (Frontend_dReserved.v_isInternalSyntaxName dtb_u_u955) then (if (if (v_isParserSyntaxName dtb_u_u955) then true else (Frontend_dName.v_isCompilerModulePrefix dtb_u_u950)) then (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EVar (dtb_u_u955, dtb_u_u956)))) else ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u956))) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_UnknownVariable (dtb_u_u955))) dtb_u_u955))) else (if (Base_dSource.v_containsDot dtb_u_u955) then ((((((((v_resolveDottedExpr dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u955) dtb_u_u956) else ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u956))) (((((((v_resolveGlobal dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u955))) (fun (dtb_u_u957 : string) -> (((((v_checkDebugConstruct (dtb_u_u951).Loader_dModules.f_Namespaces_nsRelease) dtb_u_u956) dtb_u_u955) dtb_u_u957) dtb_u_u953))))))))
  | Frontend_dAst.C_Expr_EInt (dtb_u_u958, dtb_u_u959) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EInt (dtb_u_u958, dtb_u_u959))))
  | Frontend_dAst.C_Expr_EStr (dtb_u_u960, dtb_u_u961) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EStr (dtb_u_u960, dtb_u_u961))))
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u962, dtb_u_u963) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EFloat (dtb_u_u962, dtb_u_u963))))
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u964, dtb_u_u965) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u964)) (fun (dtb_u_u966 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_lowerTemplate dtb_u_u965) dtb_u_u966)))))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u967, dtb_u_u968, dtb_u_u969) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u969))) ((Base_dCommon.v_traverse (v_checkBinder dtb_u_u949)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u967)))) (fun (dtb_u_u970 : string B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u967)) dtb_u_u953)) dtb_u_u968)) (fun (dtb_u_u971 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELam (dtb_u_u967, dtb_u_u971, dtb_u_u969))))))))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u972, dtb_u_u973, dtb_u_u974) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u972)) (fun (dtb_u_u975 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u976 : Frontend_dAst.t_Expr) -> ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u976))) dtb_u_u973)) (fun (dtb_u_u977 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp (dtb_u_u975, dtb_u_u977, dtb_u_u974))))))))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u978, dtb_u_u979, dtb_u_u980, dtb_u_u981, dtb_u_u982, dtb_u_u983) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u981)) (fun (dtb_u_u984 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (dtb_u_u978, B_dData_dList.C_List_Nil))) dtb_u_u953)) dtb_u_u982)) (fun (dtb_u_u985 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EPi (dtb_u_u978, dtb_u_u979, dtb_u_u980, dtb_u_u984, dtb_u_u985, dtb_u_u983))))))))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u986, dtb_u_u987, dtb_u_u988, dtb_u_u989) -> ((Base_dCommon.v_bind ((((((((((v_resolveLet (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u988) dtb_u_u986) dtb_u_u987)) (fun (dtb_u_u990 : (Frontend_dAst.t_Binding B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u990 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u991; B_dData_dPair.f_Pair_second = dtb_u_u992 } -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb_u_u991, dtb_u_u992, dtb_u_u988, dtb_u_u989))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u993, dtb_u_u994, dtb_u_u995) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u993)) (fun (dtb_u_u996 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u997 : Frontend_dAst.t_Alt) -> ((((((((v_resolveAlt (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u997))) dtb_u_u994)) (fun (dtb_u_u998 : Frontend_dAst.t_Alt B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ECase (dtb_u_u996, dtb_u_u998, dtb_u_u995))))))))
  | Frontend_dAst.C_Expr_EIf (dtb_u_u999, dtb_u_u1000, dtb_u_u1001, dtb_u_u1002) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u999)) (fun (dtb_u_u1003 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1000)) (fun (dtb_u_u1004 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1001)) (fun (dtb_u_u1005 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EIf (dtb_u_u1003, dtb_u_u1004, dtb_u_u1005, dtb_u_u1002))))))))))
  | Frontend_dAst.C_Expr_EField (dtb_u_u1006, dtb_u_u1007, dtb_u_u1008) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1006)) (fun (dtb_u_u1009 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EField (dtb_u_u1009, dtb_u_u1007, dtb_u_u1008))))))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u1010, dtb_u_u1011, dtb_u_u1012) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1012))) ((((((v_resolveCtor dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u1010))) (fun (dtb_u_u1013 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u1014 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1014))) dtb_u_u1011)) (fun (dtb_u_u1015 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecord (dtb_u_u1013, dtb_u_u1015, dtb_u_u1012))))))))
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u1016, dtb_u_u1017, dtb_u_u1018) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1016)) (fun (dtb_u_u1019 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u1020 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((((((((v_resolveFieldValue (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1020))) dtb_u_u1017)) (fun (dtb_u_u1021 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u1019, dtb_u_u1021, dtb_u_u1018))))))))
  | Frontend_dAst.C_Expr_EDo (dtb_u_u1022, dtb_u_u1023) -> (((((((((v_resolveDo (dtb_u_u947 - 1)) dtb_u_u948) dtb_u_u949) dtb_u_u950) dtb_u_u951) dtb_u_u952) dtb_u_u953) dtb_u_u1022) (Frontend_dAst.v_nodeRefSpan dtb_u_u1023))
  | _ -> failwith "DT: impossible branch"
)))
# 1066 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveInterpParts = (fun (dtb_u_u1024 : int) (dtb_u_u1025 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1026 : string) (dtb_u_u1027 : string) (dtb_u_u1028 : Loader_dModules.t_Namespaces) (dtb_u_u1029 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1030 : string B_dData_dList.t_List) (dtb_u_u1031 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (if (dtb_u_u1024 <= 0) then (Base_dDiag.v_icFuel "resolver") else (let dtb_u_u1032 = dtb_u_u1031 in (match dtb_u_u1032 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1033, dtb_u_u1034) -> (match dtb_u_u1033 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u1035) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u1024 - 1)) dtb_u_u1025) dtb_u_u1026) dtb_u_u1027) dtb_u_u1028) dtb_u_u1029) dtb_u_u1030) dtb_u_u1035)) (fun (dtb_u_u1036 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (dtb_u_u1024 - 1)) dtb_u_u1025) dtb_u_u1026) dtb_u_u1027) dtb_u_u1028) dtb_u_u1029) dtb_u_u1030) dtb_u_u1034)) (fun (dtb_u_u1037 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPHole (dtb_u_u1036)), dtb_u_u1037))))))))
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u1038) -> ((Base_dCommon.v_bind ((((((((v_resolveInterpParts (dtb_u_u1024 - 1)) dtb_u_u1025) dtb_u_u1026) dtb_u_u1027) dtb_u_u1028) dtb_u_u1029) dtb_u_u1030) dtb_u_u1034)) (fun (dtb_u_u1039 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_InterpPart_IPText (dtb_u_u1038)), dtb_u_u1039))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))))
# 1085 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDo = (fun (dtb_u_u1040 : int) (dtb_u_u1041 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1042 : string) (dtb_u_u1043 : string) (dtb_u_u1044 : Loader_dModules.t_Namespaces) (dtb_u_u1045 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1046 : string B_dData_dList.t_List) (dtb_u_u1047 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u1048 : Base_dSource.t_Span) -> (if (dtb_u_u1040 <= 0) then (Base_dDiag.v_icFuel "resolver") else (let dtb_u_u1049 = dtb_u_u1047 in (match dtb_u_u1049 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1050, dtb_u_u1051) -> (match dtb_u_u1050 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u1052, dtb_u_u1053) -> (match dtb_u_u1051 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (dtb_u_u1040 - 1)) dtb_u_u1041) dtb_u_u1042) dtb_u_u1043) dtb_u_u1044) dtb_u_u1045) dtb_u_u1046) dtb_u_u1052)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind dtb_u_u1041) dtb_u_u1042) dtb_u_u1043) dtb_u_u1044) dtb_u_u1045) dtb_u_u1046)) (fun (dtb_u_u1054 : string) -> ((((((((((v_resolveDoChain (dtb_u_u1040 - 1)) dtb_u_u1041) dtb_u_u1042) dtb_u_u1043) dtb_u_u1044) dtb_u_u1045) dtb_u_u1046) dtb_u_u1054) dtb_u_u1047) dtb_u_u1048)))
)
  | _ -> ((Base_dCommon.v_bind ((((((v_resolveDoBind dtb_u_u1041) dtb_u_u1042) dtb_u_u1043) dtb_u_u1044) dtb_u_u1045) dtb_u_u1046)) (fun (dtb_u_u1055 : string) -> ((((((((((v_resolveDoChain (dtb_u_u1040 - 1)) dtb_u_u1041) dtb_u_u1042) dtb_u_u1043) dtb_u_u1044) dtb_u_u1045) dtb_u_u1046) dtb_u_u1055) dtb_u_u1047) dtb_u_u1048)))
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb_u_u1048) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))))
# 1114 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoChain = (fun (dtb_u_u1056 : int) (dtb_u_u1057 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1058 : string) (dtb_u_u1059 : string) (dtb_u_u1060 : Loader_dModules.t_Namespaces) (dtb_u_u1061 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1062 : string B_dData_dList.t_List) (dtb_u_u1063 : string) (dtb_u_u1064 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u1065 : Base_dSource.t_Span) -> (if (dtb_u_u1056 <= 0) then (Base_dDiag.v_icFuel "resolver") else (let dtb_u_u1066 = dtb_u_u1064 in (match dtb_u_u1066 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1067, dtb_u_u1068) -> (match dtb_u_u1067 with
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u1069, dtb_u_u1070, dtb_u_u1071) -> (match dtb_u_u1069 with
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1072) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1070)) (fun (dtb_u_u1073 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1063) dtb_u_u1068) dtb_u_u1065)) (fun (dtb_u_u1074 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoIgnore (dtb_u_u1063))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1073, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), dtb_u_u1074, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071))))))))))
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1075, dtb_u_u1076) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1070)) (fun (dtb_u_u1077 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1075, dtb_u_u1062))) dtb_u_u1063) dtb_u_u1068) dtb_u_u1065)) (fun (dtb_u_u1078 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoBind (dtb_u_u1063))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1077, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1075; B_dData_dPair.f_Pair_second = ((Base_dSource.v_spanAtName dtb_u_u1075) (Frontend_dAst.v_nodeRefSpan dtb_u_u1076)) }, B_dData_dList.C_List_Nil)), dtb_u_u1078, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071))))))))))
  | _ -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1069)) (fun (dtb_u_u1079 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1079 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1080; B_dData_dPair.f_Pair_second = dtb_u_u1081 } -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1070)) (fun (dtb_u_u1082 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) ((B_dData_dList.v_append dtb_u_u1081) dtb_u_u1062)) dtb_u_u1063) dtb_u_u1068) dtb_u_u1065)) (fun (dtb_u_u1083 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoBind (dtb_u_u1063))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1082, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = Frontend_dReserved.v_doPatternBinderName; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), (Frontend_dAst.C_Expr_ECase ((Frontend_dAst.C_Expr_EVar (Frontend_dReserved.v_doPatternBinderName, (Frontend_dAst.v_detachedNodeRef Base_dSource.v_spanEmpty))), (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Alt_altPat = dtb_u_u1080; Frontend_dAst.f_Alt_altBody = dtb_u_u1083; Frontend_dAst.f_Alt_altRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil)), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1071))))))))))
  | _ -> failwith "DT: impossible branch"
)))
)
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u1084, dtb_u_u1085) -> ((Base_dCommon.v_bind ((((((((v_resolveDoLet (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1084)) (fun (dtb_u_u1086 : (Frontend_dAst.t_Binding B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1086 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1087; B_dData_dPair.f_Pair_second = dtb_u_u1088 } -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) ((B_dData_dList.v_append dtb_u_u1088) dtb_u_u1062)) dtb_u_u1063) dtb_u_u1068) dtb_u_u1065)) (fun (dtb_u_u1089 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_ELet (dtb_u_u1087, dtb_u_u1089, false, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1085))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u1090, dtb_u_u1091) -> (match dtb_u_u1068 with
  | B_dData_dList.C_List_Nil -> ((((((((v_resolveExpr (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1090)
  | _ -> ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1090)) (fun (dtb_u_u1092 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((((((((((v_resolveDoChain (dtb_u_u1056 - 1)) dtb_u_u1057) dtb_u_u1058) dtb_u_u1059) dtb_u_u1060) dtb_u_u1061) dtb_u_u1062) dtb_u_u1063) dtb_u_u1068) dtb_u_u1065)) (fun (dtb_u_u1093 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Expr_EApp ((Frontend_dAst.C_Expr_EVar ((Frontend_dReserved.v_reservedText (Frontend_dReserved.C_Reserved_RsDoIgnore (dtb_u_u1063))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1091)))), (B_dData_dList.C_List__x58__x58_ (dtb_u_u1092, (B_dData_dList.C_List__x58__x58_ ((Frontend_dAst.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = "_"; B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), dtb_u_u1093, (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1091)))), B_dData_dList.C_List_Nil)))), (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_nodeRefSpan dtb_u_u1091))))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dFrontend.v_psErr0At dtb_u_u1065) Base_dDiagnostics_dFrontend.C_PsDiag_DoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))))
# 1143 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveDoLet = (fun (dtb_u_u1094 : int) (dtb_u_u1095 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1096 : string) (dtb_u_u1097 : string) (dtb_u_u1098 : Loader_dModules.t_Namespaces) (dtb_u_u1099 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1100 : string B_dData_dList.t_List) (dtb_u_u1101 : Frontend_dAst.t_Binding B_dData_dList.t_List) -> (if (dtb_u_u1094 <= 0) then (Base_dDiag.v_icFuel "resolver") else (match dtb_u_u1101 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1102, dtb_u_u1103) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingSig (dtb_u_u1094 - 1)) dtb_u_u1095) dtb_u_u1096) dtb_u_u1097) dtb_u_u1098) dtb_u_u1099) dtb_u_u1100) (dtb_u_u1102).Frontend_dAst.f_Binding_bindSig)) (fun (dtb_u_u1104 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind ((((((((v_resolveBindingValue (dtb_u_u1094 - 1)) dtb_u_u1095) dtb_u_u1096) dtb_u_u1097) dtb_u_u1098) dtb_u_u1099) dtb_u_u1100) (dtb_u_u1102).Frontend_dAst.f_Binding_bindValue)) (fun (dtb_u_u1105 : Frontend_dAst.t_BindingValue) -> ((Base_dCommon.v_bind (((((((v_resolvePattern v_resolveFuelBound) dtb_u_u1095) dtb_u_u1096) dtb_u_u1097) dtb_u_u1098) dtb_u_u1099) (dtb_u_u1102).Frontend_dAst.f_Binding_bindPat)) (fun (dtb_u_u1106 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1106 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1107; B_dData_dPair.f_Pair_second = dtb_u_u1108 } -> ((Base_dCommon.v_bind ((((((((v_resolveDoLet (dtb_u_u1094 - 1)) dtb_u_u1095) dtb_u_u1096) dtb_u_u1097) dtb_u_u1098) dtb_u_u1099) ((B_dData_dList.v_append dtb_u_u1108) dtb_u_u1100)) dtb_u_u1103)) (fun (dtb_u_u1109 : (Frontend_dAst.t_Binding B_dData_dList.t_List, string B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (match dtb_u_u1109 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1110; B_dData_dPair.f_Pair_second = dtb_u_u1111 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Binding_bindPat = dtb_u_u1107; Frontend_dAst.f_Binding_bindValue = dtb_u_u1105; Frontend_dAst.f_Binding_bindSig = dtb_u_u1104; Frontend_dAst.f_Binding_bindRef = (dtb_u_u1102).Frontend_dAst.f_Binding_bindRef }, dtb_u_u1110)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u1108) dtb_u_u1111) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 1168 "Vuna/Compiler/Loader/Resolve.vuna"
and v_resolveFieldValue = (fun (dtb_u_u1112 : int) (dtb_u_u1113 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1114 : string) (dtb_u_u1115 : string) (dtb_u_u1116 : Loader_dModules.t_Namespaces) (dtb_u_u1117 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1118 : string B_dData_dList.t_List) (dtb_u_u1119 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (match dtb_u_u1119 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1120; B_dData_dPair.f_Pair_second = dtb_u_u1121 } -> (if (dtb_u_u1112 <= 0) then (Base_dDiag.v_icFuel "resolver") else ((Base_dCommon.v_bind ((((((((v_resolveExpr (dtb_u_u1112 - 1)) dtb_u_u1113) dtb_u_u1114) dtb_u_u1115) dtb_u_u1116) dtb_u_u1117) dtb_u_u1118) dtb_u_u1121)) (fun (dtb_u_u1122 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1120; B_dData_dPair.f_Pair_second = dtb_u_u1122 })))))
  | _ -> failwith "DT: impossible branch"
))

# 1445 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveInstanceMethod = (fun (dtb_u_u1123 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1124 : string) (dtb_u_u1125 : string) (dtb_u_u1126 : Loader_dModules.t_Namespaces) (dtb_u_u1127 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1128 : Frontend_dAst.t_Decl) -> (match dtb_u_u1128 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u1129, dtb_u_u1130, dtb_u_u1131, dtb_u_u1132) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1132))) ((v_checkTopName dtb_u_u1124) dtb_u_u1129))) (fun (dtb_u_u1133 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) dtb_u_u1123) dtb_u_u1124) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127)) dtb_u_u1130)) (fun (dtb_u_u1134 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) dtb_u_u1123) dtb_u_u1124) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u1134)) dtb_u_u1131)) (fun (dtb_u_u1135 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb_u_u1129, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u1134), dtb_u_u1135, dtb_u_u1132))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u1136, dtb_u_u1137, dtb_u_u1138, dtb_u_u1139) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1139))) ((v_checkTopName dtb_u_u1124) dtb_u_u1136))) (fun (dtb_u_u1140 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u1141 : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr dtb_u_u1123) dtb_u_u1124) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) dtb_u_u1141))) dtb_u_u1137)) (fun (dtb_u_u1142 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u1123) dtb_u_u1124) dtb_u_u1125) dtb_u_u1126) dtb_u_u1127) dtb_u_u1138)) (fun (dtb_u_u1143 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb_u_u1136, dtb_u_u1142, dtb_u_u1143, dtb_u_u1139))))))))))
  | _ -> (Base_dDiag.v_icInternal "unexpected instance body declaration")
))

# 1396 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDecl = (fun (dtb_u_u1144 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1145 : string) (dtb_u_u1146 : string) (dtb_u_u1147 : Loader_dModules.t_Namespaces) (dtb_u_u1148 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1149 : Frontend_dAst.t_Decl) -> (match dtb_u_u1149 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u1150, dtb_u_u1151, dtb_u_u1152, dtb_u_u1153, dtb_u_u1154, dtb_u_u1155, dtb_u_u1156, dtb_u_u1157, dtb_u_u1158) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1158))) (((v_resolveTypeTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1150))) (fun (dtb_u_u1159 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1152)) (fun (dtb_u_u1160 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolveCtorSpec dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1150)) dtb_u_u1153)) (fun (dtb_u_u1161 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolveDataDeriving dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1150)) dtb_u_u1154)) (fun (dtb_u_u1162 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DData (dtb_u_u1159, dtb_u_u1151, dtb_u_u1160, dtb_u_u1161, dtb_u_u1162, dtb_u_u1155, dtb_u_u1156, dtb_u_u1157, dtb_u_u1158))))))))))))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u1163, dtb_u_u1164, dtb_u_u1165, dtb_u_u1166, dtb_u_u1167, dtb_u_u1168, dtb_u_u1169, dtb_u_u1170) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1170))) (((v_resolveTypeTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1163))) (fun (dtb_u_u1171 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveRecordField dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148)) dtb_u_u1165)) (fun (dtb_u_u1172 : Frontend_dAst.t_Field B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveRecordDeriving dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148)) dtb_u_u1166)) (fun (dtb_u_u1173 : string B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DRecord (dtb_u_u1171, dtb_u_u1164, dtb_u_u1172, dtb_u_u1173, dtb_u_u1167, dtb_u_u1168, dtb_u_u1169, dtb_u_u1170))))))))))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u1174, dtb_u_u1175, dtb_u_u1176, dtb_u_u1177, dtb_u_u1178) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1178))) (((v_resolveTypeTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1174))) (fun (dtb_u_u1179 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u1180 : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1180))) dtb_u_u1176)) (fun (dtb_u_u1181 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveTraitMethod dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148)) dtb_u_u1177)) (fun (dtb_u_u1182 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DTrait (dtb_u_u1179, dtb_u_u1175, dtb_u_u1181, dtb_u_u1182, dtb_u_u1178))))))))))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u1183, dtb_u_u1184, dtb_u_u1185, dtb_u_u1186) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u1187 : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1187))) dtb_u_u1183)) (fun (dtb_u_u1188 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1184)) (fun (dtb_u_u1189 : Frontend_dAst.t_Expr) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (((((v_resolveInstanceMethod dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148)) dtb_u_u1185)) (fun (dtb_u_u1190 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DInstance (dtb_u_u1188, dtb_u_u1189, dtb_u_u1190, dtb_u_u1186))))))))))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u1191, dtb_u_u1192, dtb_u_u1193, dtb_u_u1194) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1194))) (((v_resolveTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1191))) (fun (dtb_u_u1195 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (dtb_u_u1196 : Frontend_dAst.t_Expr) -> ((((((v_resolveConstraintExpr dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1196))) dtb_u_u1192)) (fun (dtb_u_u1197 : Frontend_dAst.t_Expr B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1193)) (fun (dtb_u_u1198 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DSig (dtb_u_u1195, dtb_u_u1197, dtb_u_u1198, dtb_u_u1194))))))))))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u1199, dtb_u_u1200, dtb_u_u1201) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1201))) (((v_resolveTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1199))) (fun (dtb_u_u1202 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1200)) (fun (dtb_u_u1203 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DAxiom (dtb_u_u1202, dtb_u_u1203, dtb_u_u1201))))))))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u1204, dtb_u_u1205, dtb_u_u1206, dtb_u_u1207) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1207))) (((v_resolveTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1204))) (fun (dtb_u_u1208 : string) -> ((Base_dCommon.v_bind (((((((v_resolveTypeExpr v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) dtb_u_u1206)) (fun (dtb_u_u1209 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DExtern (dtb_u_u1208, dtb_u_u1205, dtb_u_u1209, dtb_u_u1207))))))))
  | Frontend_dAst.C_Decl_DFun (dtb_u_u1210, dtb_u_u1211, dtb_u_u1212, dtb_u_u1213) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1213))) (((v_resolveTopName dtb_u_u1145) dtb_u_u1146) dtb_u_u1210))) (fun (dtb_u_u1214 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148)) dtb_u_u1211)) (fun (dtb_u_u1215 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) dtb_u_u1144) dtb_u_u1145) dtb_u_u1146) dtb_u_u1147) dtb_u_u1148) ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u1215)) dtb_u_u1212)) (fun (dtb_u_u1216 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb_u_u1214, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u1215), dtb_u_u1216, dtb_u_u1213))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1506 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveDeclWithImplicitScopes = (fun (dtb_u_u1217 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1218 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1219 : string) (dtb_u_u1220 : string) (dtb_u_u1221 : Loader_dModules.t_Namespaces) (dtb_u_u1222 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1223 : Frontend_dAst.t_Decl) -> (match dtb_u_u1223 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u1224, dtb_u_u1225, dtb_u_u1226, dtb_u_u1227) -> ((Base_dCommon.v_bind ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u1227))) (((v_resolveTopName dtb_u_u1219) dtb_u_u1220) dtb_u_u1224))) (fun (dtb_u_u1228 : string) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((((v_resolvePattern v_resolveFuelBound) dtb_u_u1218) dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1222)) dtb_u_u1225)) (fun (dtb_u_u1229 : (Frontend_dAst.t_Pat, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((((v_resolveExpr v_resolveFuelBound) dtb_u_u1218) dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1222) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb_u_u1229)) ((v_scopeNamesOf dtb_u_u1224) dtb_u_u1217))) dtb_u_u1226)) (fun (dtb_u_u1230 : Frontend_dAst.t_Expr) -> (Base_dDiag.C_Check_OkC ((Frontend_dAst.C_Decl_DFun (dtb_u_u1228, ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb_u_u1229), dtb_u_u1230, dtb_u_u1227))))))))))
  | _ -> ((((((v_resolveDecl dtb_u_u1218) dtb_u_u1219) dtb_u_u1220) dtb_u_u1221) dtb_u_u1222) dtb_u_u1223)
))

# 1551 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isStringDomainExpr = (fun (dtb_u_u1231 : Frontend_dAst.t_Expr) -> (match dtb_u_u1231 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1232, dtb_u_u1233) -> (if (dtb_u_u1232 = "String") then true else (if (dtb_u_u1232 = "Base.Data.String.String") then true else false))
  | _ -> false
))

# 1558 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isTypeDomainExpr = (fun (dtb_u_u1234 : Frontend_dAst.t_Expr) -> (match dtb_u_u1234 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1235, dtb_u_u1236) -> (if (dtb_u_u1235 = "Type") then true else false)
  | _ -> false
))

# 1562 "Vuna/Compiler/Loader/Resolve.vuna"
let v_isRowDomainExpr = (fun (dtb_u_u1237 : Frontend_dAst.t_Expr) -> (match dtb_u_u1237 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1238, dtb_u_u1239) -> (if (dtb_u_u1238 = "Row") then true else (if (dtb_u_u1238 = "Base.Effect.Core.Row") then true else false))
  | _ -> false
))

# 1481 "Vuna/Compiler/Loader/Resolve.vuna"
let[@tail_mod_cons] rec v_leadingImplicitNames = (fun (dtb_u_u1240 : Frontend_dAst.t_Expr) -> (match dtb_u_u1240 with
  | Frontend_dAst.C_Expr_EPi (dtb_u_u1241, dtb_u_u1242, dtb_u_u1243, dtb_u_u1244, dtb_u_u1245, dtb_u_u1246) -> (if dtb_u_u1242 then (if (dtb_u_u1241 = "_") then (v_leadingImplicitNames dtb_u_u1245) else (if (if (if (v_isStringDomainExpr dtb_u_u1244) then true else (v_isTypeDomainExpr dtb_u_u1244)) then true else (v_isRowDomainExpr dtb_u_u1244)) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u1241, (v_leadingImplicitNames dtb_u_u1245))) else (v_leadingImplicitNames dtb_u_u1245))) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
))

# 1469 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_implicitScopeTable = (fun (dtb_u_u1247 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u1247 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1248, dtb_u_u1249) -> (match dtb_u_u1248 with
  | Frontend_dAst.C_Decl_DSig (dtb_u_u1250, dtb_u_u1251, dtb_u_u1252, dtb_u_u1253) -> (let dtb_u_u1254 = (B_dData_dList.v_nubNames ((B_dData_dList.v_append (v_leadingImplicitNames dtb_u_u1252)) ((B_dData_dList.v_concatMap v_exprLowerNames) dtb_u_u1251))) in (match dtb_u_u1254 with
  | B_dData_dList.C_List_Nil -> (v_implicitScopeTable dtb_u_u1249)
  | _ -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u1250; B_dData_dPair.f_Pair_second = dtb_u_u1254 }, (v_implicitScopeTable dtb_u_u1249)))
))
  | _ -> (v_implicitScopeTable dtb_u_u1249)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1457 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveProgram = (fun (dtb_u_u1255 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1256 : string) (dtb_u_u1257 : string) (dtb_u_u1258 : Loader_dModules.t_Namespaces) (dtb_u_u1259 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1260 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u1261 = (v_implicitScopeTable dtb_u_u1260) in ((Base_dCommon.v_traverse ((((((v_resolveDeclWithImplicitScopes dtb_u_u1261) dtb_u_u1255) dtb_u_u1256) dtb_u_u1257) dtb_u_u1258) dtb_u_u1259)) dtb_u_u1260)))

# 1515 "Vuna/Compiler/Loader/Resolve.vuna"
let v_resolveEntry = (fun (dtb_u_u1262 : bool) (dtb_u_u1263 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1264 : string) (dtb_u_u1265 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1266 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((((((v_resolveProgram dtb_u_u1263) "<entry>") "") ((((v_namespacesOfWith dtb_u_u1262) dtb_u_u1263) dtb_u_u1266) dtb_u_u1265)) dtb_u_u1265) dtb_u_u1266))

# 1519 "Vuna/Compiler/Loader/Resolve.vuna"
let rec v_resolveModules = (fun (dtb_u_u1267 : bool) (dtb_u_u1268 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match dtb_u_u1268 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1269, dtb_u_u1270) -> (match dtb_u_u1269 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb_u_u1271; Loader_dModules.f_Module_modulePackageOf = dtb_u_u1272; Loader_dModules.f_Module_moduleImportsOf = dtb_u_u1273; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb_u_u1274; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u1275; Loader_dModules.f_Module_moduleExportsOf = dtb_u_u1276; Loader_dModules.f_Module_moduleFixitiesOf = dtb_u_u1277; Loader_dModules.f_Module_moduleReexportsOf = dtb_u_u1278; Loader_dModules.f_Module_moduleOpaqueOf = dtb_u_u1279; Loader_dModules.f_Module_moduleExportIndexOf = dtb_u_u1280; Loader_dModules.f_Module_moduleFixFactsOf = dtb_u_u1281 } -> (let dtb_u_u1282 = ((B_dData_dList.v_append dtb_u_u1273) dtb_u_u1274) in ((Base_dCommon.v_bind ((((((v_resolveProgram dtb_u_u1268) dtb_u_u1271) dtb_u_u1271) ((((v_namespacesOfWith dtb_u_u1267) dtb_u_u1268) dtb_u_u1275) dtb_u_u1282)) dtb_u_u1282) dtb_u_u1275)) (fun (dtb_u_u1283 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_resolveModules dtb_u_u1267) dtb_u_u1270)) (fun (dtb_u_u1284 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u1283) dtb_u_u1284))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
