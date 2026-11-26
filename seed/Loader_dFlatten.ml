open Vuna_runtime
# 62 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseWith = (fun (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match ((Base_dObs.v_obsPure "vuna.parse.syntax") (fun (_u : int) -> ((((Frontend_dParser.v_parseSourceRecoveringTokens path) src) mode) toks))) with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__0)))
  | Base_dDiag.C_Check_OkC (dtb__1) -> (let parsed = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1)) in (let surface = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__1)) in (let errs = (B_dData_dPair.v_secondOf dtb__1) in (match errs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = parsed; B_dData_dPair.f_Pair_second = surface }))
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb__3) dtb__2)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode = (fun (nFs : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) -> (match ((Base_dObs.v_obsPure "vuna.parse.lex") (fun (_u : int) -> (Frontend_dLexer.v_lexSource src))) with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__4))))
  | Base_dDiag.C_Check_OkC (dtb__5) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_parseWith mode) path) src) dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath = (fun nFs -> ((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmStrict))

# 87 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeFixitiesGo = (fun (mc0 : (string, Frontend_dAst.t_FixityDecl) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (let key = (B_dData_dPair.v_firstOf dtb__6) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (((v_dedupeFixitiesGo dtb__7) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeFixitiesGo dtb__7) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__6), mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixityDeclKey = (fun (d : Frontend_dAst.t_FixityDecl) -> (let sp = (Frontend_dAst.v_fixitySpan d) in (String.concat "" [(d).Frontend_dAst.f_FixityDecl_fixityOp; "|"; (string_of_int (d).Frontend_dAst.f_FixityDecl_fixityLevel); "|"; (string_of_int (d).Frontend_dAst.f_FixityDecl_fixityAssoc); "|"; (Base_dSource.v_spanFile sp); ":"; (string_of_int (Base_dSource.v_spanStartLine sp)); ":"; (string_of_int (Base_dSource.v_spanStartCol sp))])))

# 80 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeFixitiesOf = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (local : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (((v_dedupeFixitiesGo ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = (String.concat "" [(Loader_dModules.v_moduleNameOf m); "|"; (v_fixityDeclKey d)]); B_dData_dPair.f_Pair_second = d })) (Loader_dModules.v_moduleFixitiesOf m)))) modules)) ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = ("|entry|" ^ (v_fixityDeclKey d)); B_dData_dPair.f_Pair_second = d })) local))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 106 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isPrivateName = (fun (name : string) -> ((B_dData_dString.v_startsWith "_") name))

# 109 "Vuna/Compiler/Loader/Flatten.vuna"
let v_privateExportMsg = (fun (prefix : string) (sp : Base_dSource.t_Span) (name : string) -> ((((((Base_dDiag.v_diagAt sp) Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

# 121 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnData = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__9 with
  | Frontend_dAst.C_Decl_DData (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> (if (dtb__11 = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__11; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map Frontend_dAst.v_ctorName) dtb__14) })) else ((v_findOwnData mc0) dtb__10))
  | Frontend_dAst.C_Decl_DRecord (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (if (dtb__20 = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__20, B_dData_dList.C_List_Nil)) })) else ((v_findOwnData mc0) dtb__10))
  | Frontend_dAst.C_Decl_DTrait (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (if (dtb__28 = mc0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb__31) })) else ((v_findOwnData mc0) dtb__10))
  | _ -> ((v_findOwnData mc0) dtb__10)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnFn = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | Frontend_dAst.C_Decl_DFun (dtb__35, dtb__36, dtb__37, dtb__38) -> (if (dtb__35 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else ((v_findOwnFn mc0) dtb__34))
  | Frontend_dAst.C_Decl_DSig (dtb__39, dtb__40, dtb__41, dtb__42) -> (if (dtb__39 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else ((v_findOwnFn mc0) dtb__34))
  | Frontend_dAst.C_Decl_DAxiom (dtb__43, dtb__44, dtb__45) -> (if (dtb__43 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else ((v_findOwnFn mc0) dtb__34))
  | Frontend_dAst.C_Decl_DExtern (dtb__46, dtb__47, dtb__48, dtb__49) -> (if (dtb__46 = mc0) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else ((v_findOwnFn mc0) dtb__34))
  | _ -> ((v_findOwnFn mc0) dtb__34)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (if ((Frontend_dAst.v_ctorName dtb__50) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_ctorName dtb__50))) else ((v_findCtorNamed mc0) dtb__51))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findMethodNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__54; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__55; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__56 } -> (if (dtb__54 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__54)) else ((v_findMethodNamed mc0) dtb__53))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnCtorNames = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | Frontend_dAst.C_Decl_DData (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (c : Frontend_dAst.t_Ctor) -> { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_ctorName c) })) ((B_dData_dList.v_filter (fun (c : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName c) = mc0))) dtb__62))) ((v_findOwnCtorNames mc0) dtb__58))
  | Frontend_dAst.C_Decl_DRecord (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> (if (dtb__68 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__68 }, ((v_findOwnCtorNames mc0) dtb__58))) else ((v_findOwnCtorNames mc0) dtb__58))
  | Frontend_dAst.C_Decl_DTrait (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (m : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = dtb__76; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_traitMethodName m) })) ((B_dData_dList.v_filter (fun (m : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName m) = mc0))) dtb__79))) ((v_findOwnCtorNames mc0) dtb__58))
  | _ -> ((v_findOwnCtorNames mc0) dtb__58)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__81; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__81); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownCtorEntries mc0) mc1) dtb__82)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownDataCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__83; Loader_dModules.f_ExportEntry_target = (((Loader_dModules.v_ctorCanonical mc0) mc1) dtb__83); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownDataCtorEntries mc0) mc1) dtb__84)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownSelectorEntries = (fun (prefix : string) (all : Frontend_dAst.t_Decl B_dData_dList.t_List) (dname : string) -> ((B_dData_dList.v_map (fun (f : string) -> { Loader_dModules.f_ExportEntry_kind = "val"; Loader_dModules.f_ExportEntry_public = f; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle prefix) f); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle prefix) dname) })) ((Loader_dSelectors.v_selectedFieldNames all) dname)))

# 193 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownTypeEntries = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : string) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | Frontend_dAst.C_Decl_DData (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (dtb__87 = mc3) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__87; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc1) dtb__87); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownDataCtorEntries mc1) dtb__87) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) dtb__90)))))) else ((((v_ownTypeEntries mc0) mc1) dtb__86) mc3))
  | Frontend_dAst.C_Decl_DRecord (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> (if (dtb__96 = mc3) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__96; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc1) dtb__96); Loader_dModules.f_ExportEntry_parent = "" }, ((B_dData_dList.v_append (((v_ownCtorEntries mc1) dtb__96) (B_dData_dList.C_List__x58__x58_ (dtb__96, B_dData_dList.C_List_Nil)))) (((v_ownSelectorEntries mc1) mc0) dtb__96)))))) else ((((v_ownTypeEntries mc0) mc1) dtb__86) mc3))
  | Frontend_dAst.C_Decl_DTrait (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if (dtb__104 = mc3) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__104; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc1) dtb__104); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownCtorEntries mc1) dtb__104) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb__107)))))) else ((((v_ownTypeEntries mc0) mc1) dtb__86) mc3))
  | _ -> ((((v_ownTypeEntries mc0) mc1) dtb__86) mc3)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ctorEntriesOfType = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (if (if ((dtb__109).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((dtb__109).Loader_dModules.f_ExportEntry_kind = "val")) then ((dtb__109).Loader_dModules.f_ExportEntry_parent = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__109, ((v_ctorEntriesOfType mc0) dtb__110))) else ((v_ctorEntriesOfType mc0) dtb__110))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 261 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_isRecordDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | Frontend_dAst.C_Decl_DRecord (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (if (dtb__113 = mc0) then true else ((v_isRecordDecl mc0) dtb__112))
  | _ -> ((v_isRecordDecl mc0) dtb__112)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isRecordTarget = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prefix : string) (target : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot target)) with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> (let m = (Base_dSource.v_joinDots dtb__121) in (if (m = prefix) then ((v_isRecordDecl dtb__122) decls) else (let nd_uscrut9 = ((Loader_dModules.v_findModule modules) m) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (match dtb__123 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__124; Loader_dModules.f_Module_modulePackageOf = dtb__125; Loader_dModules.f_Module_moduleImportsOf = dtb__126; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__127; Loader_dModules.f_Module_moduleDeclsOf = dtb__128; Loader_dModules.f_Module_moduleExportsOf = dtb__129; Loader_dModules.f_Module_moduleFixitiesOf = dtb__130; Loader_dModules.f_Module_moduleReexportsOf = dtb__131; Loader_dModules.f_Module_moduleOpaqueOf = dtb__132; Loader_dModules.f_Module_moduleExportIndexOf = dtb__133; Loader_dModules.f_Module_moduleFixFactsOf = dtb__134 } -> ((v_isRecordDecl dtb__122) dtb__128)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 237 "Vuna/Compiler/Loader/Flatten.vuna"
let v_typeRefDominates = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : string) (mc3 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) (mc4 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (match dtb__135 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__136; Loader_dModules.f_ExportRef_refTarget = dtb__137; Loader_dModules.f_ExportRef_refParent = dtb__138 } -> (let nd_uscrut10 = mc4 in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (match dtb__139 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__140; Loader_dModules.f_ExportRef_refTarget = dtb__141; Loader_dModules.f_ExportRef_refParent = dtb__142 } -> (if (if (if (dtb__136 = "type") then (dtb__140 = "ctor") else false) then (dtb__137 = dtb__141) else false) then ((((v_isRecordTarget mc0) mc1) mc2) dtb__137) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Loader/Flatten.vuna"
let v_refEntryList = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (match dtb__143 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__144; Loader_dModules.f_ExportRef_refTarget = dtb__145; Loader_dModules.f_ExportRef_refParent = dtb__146 } -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = dtb__144; Loader_dModules.f_ExportEntry_public = mc0; Loader_dModules.f_ExportEntry_target = dtb__145; Loader_dModules.f_ExportEntry_parent = dtb__146 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedTypeRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = ((v_findOwnData name) decls) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = "" }))))))
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (match dtb__147 with
  | { B_dData_dPair.f_Pair_first = dtb__148; B_dData_dPair.f_Pair_second = dtb__149 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__148); Loader_dModules.f_ExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 313 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownCtorEntriesNamed = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (match dtb__150 with
  | Frontend_dAst.C_Decl_DData (dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> ((B_dData_dList.v_append (((v_ownDataCtorEntries mc0) dtb__152) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) ((B_dData_dList.v_filter (fun (c : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName c) = mc1))) dtb__155)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__151))
  | Frontend_dAst.C_Decl_DRecord (dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> (if (dtb__161 = mc1) then ((B_dData_dList.v_append (((v_ownCtorEntries mc0) dtb__161) (B_dData_dList.C_List__x58__x58_ (dtb__161, B_dData_dList.C_List_Nil)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__151)) else (((v_ownCtorEntriesNamed mc0) mc1) dtb__151))
  | Frontend_dAst.C_Decl_DTrait (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173) -> ((B_dData_dList.v_append (((v_ownCtorEntries mc0) dtb__169) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) ((B_dData_dList.v_filter (fun (m : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName m) = mc1))) dtb__172)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__151))
  | _ -> (((v_ownCtorEntriesNamed mc0) mc1) dtb__151)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 293 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef2 = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = (((v_ownCtorEntriesNamed prefix) name) decls) in (match nd_uscrut5 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "name") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let e = (B_dData_dPair.v_secondOf p) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportRef_refTarget = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (e).Loader_dModules.f_ExportEntry_parent })))))))
)))
  | B_dData_dList.C_List__x58__x58_ (dtb__174, dtb__175) -> (match dtb__175 with
  | B_dData_dList.C_List__x58__x58_ (dtb__176, dtb__177) -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructorExport (name))) name)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "ctor"; Loader_dModules.f_ExportRef_refTarget = (dtb__174).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (dtb__174).Loader_dModules.f_ExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 286 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match ((v_findOwnFn name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "val"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__178); Loader_dModules.f_ExportRef_refParent = "" }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ownOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Loader/Flatten.vuna"
let v_bareEntries = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prefix : string) (name : string) (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((B_dData_dList.v_append entries) (((v_ownSelectorEntries prefix) decls) name)))

# 365 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameExportEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (e).Loader_dModules.f_ExportEntry_parent })

# 369 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameTypeEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" })

# 385 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isEmptyEntries = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__179, dtb__180) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSelective = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (m : string) (base : string) (name : string) (sp : Base_dSource.t_Span) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let values = ((B_dData_dList.v_map (v_renameExportEntry base)) ((Loader_dModules.v_findExportValues es) base)) in (let types = ((B_dData_dList.v_map (v_renameTypeEntry base)) ((Loader_dModules.v_findExportTypes es) base)) in (let entries = ((B_dData_dList.v_append values) types) in (if (v_isEmptyEntries entries) then (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name) else (Base_dDiag.C_Check_OkC (entries)))))))))

# 439 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_hasImportOf = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> (if ((Frontend_dAst.v_importName dtb__181) = mc1) then true else ((v_hasImportOf dtb__182) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_namespaceImportsGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__183, dtb__184) -> (match dtb__183 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__185, dtb__186, dtb__187) -> (if (if ((v_hasImportOf mc0) dtb__185) then true else ((v_hasImportOf mc2) dtb__185)) then (((v_namespaceImportsGo mc0) dtb__184) mc2) else (((v_namespaceImportsGo mc0) dtb__184) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__185; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = dtb__186; Frontend_dAst.f_Import_importRef = dtb__187 }, mc2))))
  | _ -> (((v_namespaceImportsGo mc0) dtb__184) mc2)
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 427 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceImportsOf = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> ((B_dData_dList.v_append imports) (B_dData_dList.v_reverse (((v_namespaceImportsGo imports) items) B_dData_dList.C_List_Nil))))

# 451 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_joinCommaNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match dtb__189 with
  | B_dData_dList.C_List_Nil -> dtb__188
  | _ -> (String.concat "" [dtb__188; ", "; (v_joinCommaNames dtb__189)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveImportPrefix = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (prefix : string) -> (let nd_uscrut2 = ((Loader_dModules.v_qualifierCandidates imports) prefix) in (match nd_uscrut2 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (prefix))) prefix)
  | B_dData_dList.C_List__x58__x58_ (dtb__190, dtb__191) -> (match dtb__191 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__190))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (prefix, (v_joinCommaNames nd_uscrut2)))) prefix) (v_joinCommaNames nd_uscrut2))
)
  | _ -> failwith "DT: impossible branch"
)))

# 337 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportBare = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__192; B_dData_dPair.f_Pair_second = dtb__193 } -> (match dtb__192 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ownOrImportedTypeRef modules) prefix) decls) imports) name)) (fun (tr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_ownOrImportedValueRef modules) prefix) decls) imports) name)) (fun (vr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match tr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (Base_dDiag.C_Check_OkC (((v_refEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((((v_bareEntries decls) prefix) name) ((v_refEntryList name) tr))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (if (((((v_typeRefDominates modules) decls) prefix) tr) vr) then (Base_dDiag.C_Check_OkC (((((v_bareEntries decls) prefix) name) ((v_refEntryList name) tr)))) else (Base_dDiag.C_Check_OkC (((((v_bareEntries decls) prefix) name) ((B_dData_dList.v_append ((v_refEntryList name) tr)) ((v_refEntryList name) vr))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> (let mprefix = (Base_dSource.v_joinDots dtb__192) in ((Base_dCommon.v_bind ((v_resolveImportPrefix imports) mprefix)) (fun (m : string) -> ((((((v_exportSelective modules) prefix) m) dtb__193) name) sp))))
)
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTypeAll = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> (match dtb__197 with
  | B_dData_dList.C_List_Nil -> (match ((((v_ownTypeEntries decls) prefix) decls) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (Base_dDiag.C_Check_OkC (dtb__199))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let m = (B_dData_dPair.v_firstOf p) in (let tgt = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target in ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = name; Loader_dModules.f_ExportEntry_target = tgt; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType tgt) es)))))))))))
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (let mprefix = (Base_dSource.v_joinDots dtb__197) in ((Base_dCommon.v_bind ((v_resolveImportPrefix imports) mprefix)) (fun (m : string) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportType es) dtb__198) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__198; Loader_dModules.f_ExportEntry_target = (dtb__200).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType (dtb__200).Loader_dModules.f_ExportEntry_target) es)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dRn.v_rnAt2 sp) (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (dtb__198, m))) dtb__198) m)
  | _ -> failwith "DT: impossible branch"
))))))
)
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceEntry = (fun (path : string) (target : string) -> { Loader_dModules.f_ExportEntry_kind = "module"; Loader_dModules.f_ExportEntry_public = path; Loader_dModules.f_ExportEntry_target = target; Loader_dModules.f_ExportEntry_parent = "" })

# 480 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_filterExportMembers = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> (if (if ((dtb__201).Loader_dModules.f_ExportEntry_kind = "ctor") then (B_dData_dBool.v_not ((B_dData_dList.v_memName (dtb__201).Loader_dModules.f_ExportEntry_public) mc0)) else false) then ((v_filterExportMembers mc0) dtb__202) else (B_dData_dList.C_List__x58__x58_ (dtb__201, ((v_filterExportMembers mc0) dtb__202))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportItemEntries = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem) -> (match mc4 with
  | Frontend_dAst.C_ExportItem_XBare (dtb__203, dtb__204) -> ((((((v_exportBare mc0) mc1) mc2) mc3) dtb__203) (Frontend_dAst.v_nodeRefSpan dtb__204))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__205, dtb__206, dtb__207) -> ((Base_dCommon.v_bind ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__205) (Frontend_dAst.v_nodeRefSpan dtb__207))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_filterExportMembers dtb__206) es)))))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__208, dtb__209) -> ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__208) (Frontend_dAst.v_nodeRefSpan dtb__209))
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__210, dtb__211, dtb__212) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix mc3) dtb__210)) (fun (m : string) -> (match dtb__211 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_exportsOf mc0) m)
  | B_dData_dMaybe.C_Maybe_Just (dtb__213) -> (if (dtb__213 = dtb__210) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__210) m), B_dData_dList.C_List_Nil)))) else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__210) m), (B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__213) m), B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__214, dtb__215) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix mc3) dtb__214)) (fun (m : string) -> ((Loader_dModules.v_exportsOf mc0) m)))
  | _ -> failwith "DT: impossible branch"
))

# 491 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportEntryKey = (fun (e : Loader_dModules.t_ExportEntry) -> (String.concat "" [(e).Loader_dModules.f_ExportEntry_kind; "|"; (e).Loader_dModules.f_ExportEntry_public; "|"; (e).Loader_dModules.f_ExportEntry_target; "|"; (e).Loader_dModules.f_ExportEntry_parent]))

# 494 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeByFullKey = (fun (mc0 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (let key = (v_exportEntryKey dtb__216) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> (((v_dedupeByFullKey dtb__217) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeByFullKey dtb__217) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ (dtb__216, mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 488 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeExportEntries = (fun (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (((v_dedupeByFullKey entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 512 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exportItemsAll = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__219, dtb__220) -> ((Base_dCommon.v_bind (((((v_exportItemEntries mc0) mc1) mc2) mc3) dtb__219)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) dtb__220)) (fun (tail : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append es) tail)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 503 "Vuna/Compiler/Loader/Flatten.vuna"
let v_explicitExports = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((v_dedupeExportEntries es)))))
))

# 519 "Vuna/Compiler/Loader/Flatten.vuna"
let v_validateModuleHeader = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__221) -> (match dtb__221 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__222; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__223; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__224; Frontend_dAst.f_ModDecl_modDeclExports = dtb__225; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__226; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__227; Frontend_dAst.f_ModDecl_modDeclRef = dtb__228 } -> (if (dtb__222 = mc0) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__228)) (Base_dDiagnostics_dRn.C_RnErr_ModuleNameMismatch (dtb__222))) dtb__222))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 527 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_opaqueNamesOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__229, dtb__230) -> (match (dtb__229).Frontend_dAst.f_OpacitySpec_opacityKind with
  | Frontend_dAst.C_Opacity_OpacityOpaque -> (B_dData_dList.C_List__x58__x58_ (((Loader_dModules.v_mangle mc0) (Frontend_dAst.v_opacitySpecName dtb__229)), ((v_opaqueNamesOf mc0) dtb__230)))
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((v_opaqueNamesOf mc0) dtb__230)
  | Frontend_dAst.C_Opacity_OpacityAbstract -> (B_dData_dList.C_List__x58__x58_ ((":" ^ ((Loader_dModules.v_mangle mc0) (Frontend_dAst.v_opacitySpecName dtb__229))), ((v_opaqueNamesOf mc0) dtb__230)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 535 "Vuna/Compiler/Loader/Flatten.vuna"
let v_abstractOpaquePrefix = ":"

# 538 "Vuna/Compiler/Loader/Flatten.vuna"
let v_opaqueBaseName = (fun (name : string) -> (if ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name) then (((dtp_substring (String.length v_abstractOpaquePrefix)) ((String.length name) - (String.length v_abstractOpaquePrefix))) name) else name))

# 548 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isAbstractOpaqueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name))

# 552 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withSelectors = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Loader_dSelectors.v_selectorDecls decls)) (fun (gen : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append decls) gen))))))

# 570 "Vuna/Compiler/Loader/Flatten.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__231, dtb__232) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSpecToItem = (fun (mc0 : Frontend_dAst.t_ExportSpec) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__233, dtb__234, dtb__235) -> (match dtb__234 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__236) -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb__233, dtb__236, (Frontend_dAst.v_detachedNodeRef dtb__235)))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (dtb__233, (Frontend_dAst.v_detachedNodeRef dtb__235)))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XBare (dtb__233, (Frontend_dAst.v_detachedNodeRef dtb__235)))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__237, dtb__238) -> (Frontend_dAst.C_ExportItem_XBare (dtb__237, (Frontend_dAst.v_detachedNodeRef dtb__238)))
  | _ -> failwith "DT: impossible branch"
))

# 556 "Vuna/Compiler/Loader/Flatten.vuna"
let v_computeExports = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (extraExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (extraReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (let newItems = ((B_dData_dList.v_append ((B_dData_dList.v_map v_exportSpecToItem) extraExports)) extraReexports) in (let explicit = (((((v_explicitExports modules) prefix) decls) imports) newItems) in (if (v_notEmpty newItems) then (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> explicit
  | B_dData_dMaybe.C_Maybe_Just (dtb__239) -> (match dtb__239 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__240; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__241; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__242; Frontend_dAst.f_ModDecl_modDeclExports = dtb__243; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__244; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__245; Frontend_dAst.f_ModDecl_modDeclRef = dtb__246 } -> (if dtb__241 then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__246)) (Base_dDiagnostics_dRn.C_RnErr_DuplicateExport ("module header"))) "module header") else explicit)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match dtb__247 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__248; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__249; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__250; Frontend_dAst.f_ModDecl_modDeclExports = dtb__251; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__252; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__253; Frontend_dAst.f_ModDecl_modDeclRef = dtb__254 } -> (if dtb__249 then (((((v_explicitExports modules) prefix) decls) imports) dtb__250) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 580 "Vuna/Compiler/Loader/Flatten.vuna"
let v_showCycle = (fun (name : string) (stack : string B_dData_dList.t_List) -> (Base_dSource.v_joinArrows (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (name, stack)))))

# 600 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_implicitPreludeEnabled = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__255, dtb__256) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__255) = mc1) then (dtb__255).Frontend_dPackages_dPkg.f_Root_rootImplicitPrelude else ((v_implicitPreludeEnabled dtb__256) mc1))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 613 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeDeps = (fun (mc0 : string) (mc1 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__257, dtb__258) -> (match dtb__258 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = "Prelude"; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousPrelude ((Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))) (Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 605 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) "Prelude") importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_implicitPreludeDeps importerPkg) ((B_dData_dList.v_filter (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)) <> importerPkg))) allowed)))))))

# 589 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (B_dData_dBool.v_not ((v_implicitPreludeEnabled roots) importerPkg)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if (currentName = "Prelude") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames imports)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (((v_implicitPreludeFrom nFs) roots) importerPkg)))))

# 623 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withLayerCheck = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> ((Base_dCommon.v_bind ((Loader_dLayers.v_checkProjectLayers roots) project)) (fun (_u : B_dData_dUnit.t_Unit) -> (Base_dDiag.C_Check_OkC (project)))))

# 627 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan imp)) = "") then e else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan imp)) e)))

# 632 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loaderFuel = 1048576

# 658 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_nsTakeLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__259, ((v_nsTakeLocal (mc0 - 1)) dtb__260))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 649 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_pathPrefixOf = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs))) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (if (v_notEmpty (B_dData_dPair.v_firstOf collected)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs)); B_dData_dPair.f_Pair_second = n }))) else (((((v_pathPrefixOf nFs) roots) importerPkg) segs) (n - 1)))))))

# 662 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsDropLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__261, dtb__262)) else ((v_nsDropLocal (mc0 - 1)) dtb__262))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_loadAll = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "loader")) else (match imports with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (modules)))
  | B_dData_dList.C_List__x58__x58_ (dtb__263, dtb__264) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) modules) stack) dtb__263)) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__265) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | Base_dDiag.C_Check_OkC (dtb__266) -> (((((((v_loadAll nFs) (fuel - 1)) roots) importerPkg) dtb__266) stack) dtb__264)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 666 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadModule = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (let name = (Frontend_dAst.v_importName imp) in (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "loader")) else (match ((Loader_dModules.v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__267) -> (if (((Loader_dModules.v_moduleVisibleTo roots) importerPkg) dtb__267) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (modules))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (Loader_dModules.v_modulePackageOf dtb__267)))) name) (Loader_dModules.v_modulePackageOf dtb__267)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) stack) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ImportCycle (((v_showCycle name) stack)))) ((v_showCycle name) stack)))) else (if (Loader_dModules.v_validModuleName name) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dModules.v_findModuleFile nFs) roots) name) importerPkg) (Frontend_dAst.v_importSpan imp))) (fun foundR -> (match foundR with
  | Base_dDiag.C_Check_ErrC (dtb__268) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__268)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__269) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_pathPrefixOf nFs) roots) importerPkg) (Base_dSource.v_splitOnDot name)) ((B_dData_dList.v_length (Base_dSource.v_splitOnDot name)) - 1))) (fun prefixR -> (let nd_uscrut17 = prefixR in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (match dtb__270 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) modules) stack) { Frontend_dAst.f_Import_importName = dtb__271; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })) (fun modsR -> (match modsR with
  | Base_dDiag.C_Check_ErrC (dtb__273) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__273)))
  | Base_dDiag.C_Check_OkC (dtb__274) -> (match ((Loader_dModules.v_findModule dtb__274) dtb__271) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__268)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__275) -> (match (((Loader_dModules.v_walkNamespaceIndex dtb__274) dtb__271) ((v_nsDropLocal dtb__272) (Base_dSource.v_splitOnDot name))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__268)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__276) -> (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) dtb__274) stack) { Frontend_dAst.f_Import_importName = dtb__276; Frontend_dAst.f_Import_importIsQualified = true; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__268)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__277) -> (let path = (B_dData_dPair.v_firstOf dtb__277) in (let root = (B_dData_dPair.v_secondOf dtb__277) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Loader.Flatten") then (((dtp_log_emit 3) "Vuna.Compiler.Loader.Flatten") ("parse-module=" ^ name)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_parseFileWithPath nFs) path) text)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__278) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__278)))
  | Base_dDiag.C_Check_OkC (dtb__279) -> (let sf = (B_dData_dPair.v_firstOf dtb__279) in (let surface = (B_dData_dPair.v_secondOf dtb__279) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports0 = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let imports = ((v_namespaceImportsOf imports0) reexports) in (match ((v_validateModuleHeader name) hdr) with
  | Base_dDiag.C_Check_ErrC (dtb__280) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__280)))
  | Base_dDiag.C_Check_OkC (dtb__281) -> (match ((Loader_dModules.v_validateImports name) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__282) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__282)))
  | Base_dDiag.C_Check_OkC (dtb__283) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) roots) (Frontend_dPackages_dPkg.v_rootName root)) name) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__284) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__284)))
  | Base_dDiag.C_Check_OkC (dtb__285) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadAll nFs) (fuel - 1)) roots) (Frontend_dPackages_dPkg.v_rootName root)) modules) (B_dData_dList.C_List__x58__x58_ (name, stack))) ((B_dData_dList.v_append imports) dtb__285))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__286) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__286)))
  | Base_dDiag.C_Check_OkC (dtb__287) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__287) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__288) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__288)))
  | Base_dDiag.C_Check_OkC (dtb__289) -> (match (((((((v_computeExports dtb__287) name) hdr) imports2) decls) exports) reexports) with
  | Base_dDiag.C_Check_ErrC (dtb__290) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__290)))
  | Base_dDiag.C_Check_OkC (dtb__291) -> (let visible = fixities in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = name; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_rootName root); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__285; Loader_dModules.f_Module_moduleDeclsOf = dtb__289; Loader_dModules.f_Module_moduleExportsOf = dtb__291; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append ((Loader_dModules.v_reexportedImportNamesOfHeader imports2) hdr)) ((Loader_dModules.v_reexportedImportNames imports2) reexports)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf name) opacity); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__291); Loader_dModules.f_Module_moduleFixFactsOf = surface }, dtb__287))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))))))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_InvalidModuleName (name))) name)))))
  | _ -> failwith "DT: impossible branch"
))))

# 765 "Vuna/Compiler/Loader/Flatten.vuna"
let v_entryScopeOf = (fun (pkg : string) (path : string) -> (let name = (((B_dData_dList.v_foldl (fun (acc : string) (seg : string) -> seg)) path) ((B_dData_dString.v_split "/") path)) in (if ((B_dData_dString.v_endsWith ".vuna") name) then (((B_dData_dString.v_substring 0) ((B_dData_dNat.v_minus (B_dData_dString.v_byteLength name)) 5)) name) else (if (name = "") then pkg else name))))

# 777 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_parseFileWithPath nFs) entry) text)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__292) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__292)))
  | Base_dDiag.C_Check_OkC (dtb__293) -> (let sf = (B_dData_dPair.v_firstOf dtb__293) in (let surface = (B_dData_dPair.v_secondOf dtb__293) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let nd_uscrut20 = hdr in (match nd_uscrut20 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") imports) with
  | Base_dDiag.C_Check_ErrC (dtb__294) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__294)))
  | Base_dDiag.C_Check_OkC (dtb__295) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__296) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__296)))
  | Base_dDiag.C_Check_OkC (dtb__297) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__297))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__298) -> (Base_dDiag.C_Check_ErrC (dtb__298))
  | Base_dDiag.C_Check_OkC (dtb__299) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__299) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__300) -> (Base_dDiag.C_Check_ErrC (dtb__300))
  | Base_dDiag.C_Check_OkC (dtb__301) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__301; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__297; Loader_dModules.f_Project_projectModules = dtb__299; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = fixities; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) entry); Loader_dModules.f_Project_projectEntryFacts = surface })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (match dtb__302 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__303; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__304; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__305; Frontend_dAst.f_ModDecl_modDeclExports = dtb__306; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__307; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__308; Frontend_dAst.f_ModDecl_modDeclRef = dtb__309 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__309))) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntryFile (entry))) entry)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_EntryFileNotFound (entry))) entry))))))

# 760 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((((v_loadProjectWithPreloaded nFs) ctx) entry) B_dData_dList.C_List_Nil))

# 828 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (let entryImports = ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_Import_importName = n; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) names) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) entryImports)) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__310) -> (Base_dDiag.C_Check_ErrC (dtb__310))
  | Base_dDiag.C_Check_OkC (dtb__311) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb__311; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })
  | _ -> failwith "DT: impossible branch"
))))))

# 825 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((((v_loadProjectModulesWithPreloaded nFs) ctx) names) B_dData_dList.C_List_Nil))

# 847 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSourceWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__312) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__312)))
  | Base_dDiag.C_Check_OkC (dtb__313) -> (let sf = (B_dData_dPair.v_firstOf dtb__313) in (let surface = (B_dData_dPair.v_secondOf dtb__313) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let nd_uscrut19 = hdr in (match nd_uscrut19 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") imports) with
  | Base_dDiag.C_Check_ErrC (dtb__314) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__314)))
  | Base_dDiag.C_Check_OkC (dtb__315) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__316) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__316)))
  | Base_dDiag.C_Check_OkC (dtb__317) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__317))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__318) -> (Base_dDiag.C_Check_ErrC (dtb__318))
  | Base_dDiag.C_Check_OkC (dtb__319) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__319) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__320) -> (Base_dDiag.C_Check_ErrC (dtb__320))
  | Base_dDiag.C_Check_OkC (dtb__321) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__321; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__317; Loader_dModules.f_Project_projectModules = dtb__319; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = fixities; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) label); Loader_dModules.f_Project_projectEntryFacts = surface })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__322) -> (match dtb__322 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__323; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__324; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__325; Frontend_dAst.f_ModDecl_modDeclExports = dtb__326; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__327; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__328; Frontend_dAst.f_ModDecl_modDeclRef = dtb__329 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntrySource (label))) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 843 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil))

# 897 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSourceWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__330) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__330)))
  | Base_dDiag.C_Check_OkC (dtb__331) -> (let sf = (B_dData_dPair.v_firstOf dtb__331) in (let surface = (B_dData_dPair.v_secondOf dtb__331) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports0 = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let nd_uscrut19 = hdr in (match nd_uscrut19 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__332) -> (match dtb__332 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__333; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__334; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__335; Frontend_dAst.f_ModDecl_modDeclExports = dtb__336; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__337; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__338; Frontend_dAst.f_ModDecl_modDeclRef = dtb__339 } -> (let imports = ((v_namespaceImportsOf imports0) reexports) in (match ((Loader_dModules.v_validateImports dtb__333) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__340) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__340)))
  | Base_dDiag.C_Check_OkC (dtb__341) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__333) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__342) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__342)))
  | Base_dDiag.C_Check_OkC (dtb__343) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__343))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__344) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__344)))
  | Base_dDiag.C_Check_OkC (dtb__345) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__345) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__346) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__346)))
  | Base_dDiag.C_Check_OkC (dtb__347) -> (match (((((((v_computeExports dtb__345) dtb__333) hdr) imports2) decls) exports) reexports) with
  | Base_dDiag.C_Check_ErrC (dtb__348) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__348)))
  | Base_dDiag.C_Check_OkC (dtb__349) -> (let visible = fixities in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__343; Loader_dModules.f_Project_projectModules = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__333; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__343; Loader_dModules.f_Module_moduleDeclsOf = dtb__347; Loader_dModules.f_Module_moduleExportsOf = dtb__349; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((Loader_dModules.v_reexportedImportNames imports2) ((B_dData_dList.v_append dtb__335) reexports)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb__333) opacity); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__349); Loader_dModules.f_Module_moduleFixFactsOf = surface }, dtb__345)); Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) preloaded)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 893 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((v_loadModuleSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil))

# 965 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesFromParsed = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : Frontend_dAst.t_SourceFile) -> (match mc3 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__350; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__351; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__352; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__353; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__354; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__355; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__356 } -> (let imports = ((v_namespaceImportsOf dtb__351) dtb__355) in (let headerNames = (let nd_uscrut15 = dtb__350 in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__363) -> (match dtb__363 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__364; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__365; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__366; Frontend_dAst.f_ModDecl_modDeclExports = dtb__367; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__368; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__369; Frontend_dAst.f_ModDecl_modDeclRef = dtb__370 } -> { B_dData_dPair.f_Pair_first = dtb__364; B_dData_dPair.f_Pair_second = dtb__364 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = "" }
  | _ -> failwith "DT: impossible branch"
)) in (let diagLabel = (B_dData_dPair.v_firstOf headerNames) in (let currentName = (B_dData_dPair.v_secondOf headerNames) in (match ((Loader_dModules.v_validateImports diagLabel) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__357) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__357)))
  | Base_dDiag.C_Check_OkC (dtb__358) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) currentName) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__359) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__359)))
  | Base_dDiag.C_Check_OkC (dtb__360) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) mc1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__360))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__361) -> (Base_dDiag.C_Check_ErrC (dtb__361))
  | Base_dDiag.C_Check_OkC (dtb__362) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__362; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb__362) dtb__352) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 953 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules0 : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__371) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__371)))
  | Base_dDiag.C_Check_OkC (dtb__372) -> (((((v_fixitiesFromParsed nFs) ctx) modules0) label) (B_dData_dPair.v_firstOf dtb__372))
  | _ -> failwith "DT: impossible branch"
))))

# 993 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_fixitiesForSourceIn nFs) ctx) B_dData_dList.C_List_Nil) label) source)) (fun pairR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pairR with
  | Base_dDiag.C_Check_ErrC (dtb__373) -> (Base_dDiag.C_Check_ErrC (dtb__373))
  | Base_dDiag.C_Check_OkC (dtb__374) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb__374)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1118 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_fixityOpsOf = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (B_dData_dList.C_List__x58__x58_ ((dtb__375).Frontend_dAst.f_FixityDecl_fixityOp, (v_fixityOpsOf dtb__376)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Loader/Flatten.vuna"
let v_visibleFixityOps = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__377) -> (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__377))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) imports))

# 1135 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameSuffixIn = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__378, dtb__379) -> (if (if (dtb__378 = mc0) then true else ((B_dData_dString.v_endsWith ("." ^ mc0)) dtb__378)) then true else ((v_anyNameSuffixIn mc0) dtb__379))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1130 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyOpDeclared = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__380, dtb__381) -> (if ((v_anyNameSuffixIn dtb__380) mc1) then true else ((v_anyOpDeclared dtb__381) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1155 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_traitMethodNames = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__382, dtb__383) -> (B_dData_dList.C_List__x58__x58_ ((dtb__382).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb__383)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1145 "Vuna/Compiler/Loader/Flatten.vuna"
let v_definedNamesOfDecl = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__384, dtb__385, dtb__386, dtb__387) -> (B_dData_dList.C_List__x58__x58_ (dtb__384, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb__388, dtb__389, dtb__390, dtb__391) -> (B_dData_dList.C_List__x58__x58_ (dtb__388, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__392, dtb__393, dtb__394) -> (B_dData_dList.C_List__x58__x58_ (dtb__392, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__395, dtb__396, dtb__397, dtb__398) -> (B_dData_dList.C_List__x58__x58_ (dtb__395, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb__399, dtb__400, dtb__401, dtb__402) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DTrait (dtb__403, dtb__404, dtb__405, dtb__406, dtb__407) -> (B_dData_dList.C_List__x58__x58_ (dtb__403, (v_traitMethodNames dtb__406)))
  | Frontend_dAst.C_Decl_DRecord (dtb__408, dtb__409, dtb__410, dtb__411, dtb__412, dtb__413, dtb__414, dtb__415) -> (B_dData_dList.C_List__x58__x58_ (dtb__408, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DData (dtb__416, dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> (B_dData_dList.C_List__x58__x58_ (dtb__416, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1141 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_definedNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__425, dtb__426) -> ((B_dData_dList.v_append (v_definedNamesOfDecl dtb__425)) (v_definedNamesOf dtb__426))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1124 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesDeclaredFixity = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__427) -> ((v_anyOpDeclared (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__427))) (v_definedNamesOf decls))
  | _ -> failwith "DT: impossible branch"
))

# 1159 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__428, dtb__429) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__428) mc0) then true else ((v_anyNameIn mc0) dtb__429))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1112 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesUsedFixity = (fun (sourceNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__430) -> ((v_anyNameIn sourceNames) (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__430)))
  | _ -> failwith "DT: impossible branch"
))

# 1171 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyInstanceDecl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__431, dtb__432) -> (match dtb__431 with
  | Frontend_dAst.C_Decl_DInstance (dtb__433, dtb__434, dtb__435, dtb__436) -> true
  | _ -> (v_anyInstanceDecl dtb__432)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1165 "Vuna/Compiler/Loader/Flatten.vuna"
let v_moduleDeclaresInstance = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__437) -> (v_anyInstanceDecl (Loader_dModules.v_moduleDeclsOf dtb__437))
  | _ -> failwith "DT: impossible branch"
))

# 1179 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalEdit = (fun (imp : Frontend_dAst.t_Import) -> { Base_dDiag.f_DiagEdit_editSpan = (Frontend_dAst.v_importSpan imp); Base_dDiag.f_DiagEdit_editNewText = "" })

# 1102 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportDiag = (fun (imp : Frontend_dAst.t_Import) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = ("remove unused import " ^ (imp).Frontend_dAst.f_Import_importName); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ((v_importRemovalEdit imp), B_dData_dList.C_List_Nil)) }) (((Base_dDiagnostics_dWarning.v_warnDiagAt (Frontend_dAst.v_importSpan imp)) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedImport ((imp).Frontend_dAst.f_Import_importName))) (B_dData_dVec.C_Vec__x58__x58_ ((imp).Frontend_dAst.f_Import_importName, B_dData_dVec.C_Vec_Nil)))))

# 1191 "Vuna/Compiler/Loader/Flatten.vuna"
let v_expandGlobalName = (fun (n : string) -> (let nd_uscrut1 = (Frontend_dReserved.v_classify n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__438) -> (match dtb__438 with
  | Frontend_dReserved.C_Reserved_RsFieldSel (dtb__439, dtb__440) -> (B_dData_dList.C_List__x58__x58_ (dtb__439, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsDoIgnore (dtb__441) -> (B_dData_dList.C_List__x58__x58_ (dtb__441, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsDoBind (dtb__442) -> (B_dData_dList.C_List__x58__x58_ (dtb__442, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__443, dtb__444) -> dtb__444
  | _ -> (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))
)))

# 1202 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTargetOf = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 1206 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyTargetIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__445, dtb__446) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__445) mc0) then true else ((v_anyTargetIn mc0) dtb__446))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1091 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_unusedImportWarningsGo = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) (Frontend_dAst.v_importName dtb__447))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let used = (if (if (if (if ((B_dData_dList.v_memName (Frontend_dAst.v_importName dtb__447)) mc4) then true else ((v_anyTargetIn mc1) ((B_dData_dList.v_map v_exportTargetOf) es))) then true else (((v_importProvidesUsedFixity mc2) mc0) dtb__447)) then true else (((v_importProvidesDeclaredFixity mc3) mc0) dtb__447)) then true else ((v_moduleDeclaresInstance mc0) dtb__447)) in ((Base_dCommon.v_bind ((((((v_unusedImportWarningsGo mc0) mc1) mc2) mc3) mc4) dtb__448)) (fun (more : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if used then more else (B_dData_dList.C_List__x58__x58_ ((v_unusedImportDiag dtb__447), more))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1242 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_patRefNamesGo = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__449, dtb__450, dtb__451) -> ((v_fieldPatsGo dtb__450) (B_dData_dList.C_List__x58__x58_ (dtb__449, mc1)))
  | Frontend_dAst.C_Pat_PStr (dtb__452, dtb__453) -> mc1
  | Frontend_dAst.C_Pat_PInt (dtb__454, dtb__455) -> mc1
  | Frontend_dAst.C_Pat_PCon (dtb__456, dtb__457, dtb__458) -> ((v_patRefNamesListGo dtb__457) (B_dData_dList.C_List__x58__x58_ (dtb__456, mc1)))
  | Frontend_dAst.C_Pat_PWild (dtb__459) -> mc1
  | Frontend_dAst.C_Pat_PAs (dtb__460, dtb__461, dtb__462) -> ((v_patRefNamesGo dtb__461) mc1)
  | Frontend_dAst.C_Pat_PVar (dtb__463, dtb__464) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1251 "Vuna/Compiler/Loader/Flatten.vuna"
and v_patRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__465, dtb__466) -> ((v_patRefNamesListGo dtb__466) ((v_patRefNamesGo dtb__465) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1255 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldPatsGo = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__467, dtb__468) -> ((v_fieldPatsGo dtb__468) ((v_patRefNamesGo (B_dData_dPair.v_secondOf dtb__467)) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1239 "Vuna/Compiler/Loader/Flatten.vuna"
let v_patRefNames = (fun (p : Frontend_dAst.t_Pat) -> ((v_patRefNamesGo p) B_dData_dList.C_List_Nil))

# 1266 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exprRefNamesGo = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInterp (dtb__469, dtb__470) -> ((v_interpPartRefNamesListGo dtb__469) mc1)
  | Frontend_dAst.C_Expr_EDo (dtb__471, dtb__472) -> ((v_doStmtRefNamesListGo dtb__471) mc1)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__473, dtb__474, dtb__475) -> ((v_exprRefNamesGo dtb__473) ((v_fieldExprsGo dtb__474) mc1))
  | Frontend_dAst.C_Expr_ERecord (dtb__476, dtb__477, dtb__478) -> ((v_fieldExprsGo dtb__477) (B_dData_dList.C_List__x58__x58_ (dtb__476, mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__479, dtb__480, dtb__481) -> ((v_exprRefNamesGo dtb__479) mc1)
  | Frontend_dAst.C_Expr_EIf (dtb__482, dtb__483, dtb__484, dtb__485) -> ((v_exprRefNamesGo dtb__482) ((v_exprRefNamesGo dtb__483) ((v_exprRefNamesGo dtb__484) mc1)))
  | Frontend_dAst.C_Expr_ECase (dtb__486, dtb__487, dtb__488) -> ((v_exprRefNamesGo dtb__486) ((v_altRefNamesListGo dtb__487) mc1))
  | Frontend_dAst.C_Expr_ELet (dtb__489, dtb__490, dtb__491, dtb__492) -> ((v_exprRefNamesGo dtb__490) ((v_bindRefNamesListGo dtb__489) mc1))
  | Frontend_dAst.C_Expr_EPi (dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498) -> ((v_exprRefNamesGo dtb__496) ((v_exprRefNamesGo dtb__497) mc1))
  | Frontend_dAst.C_Expr_EApp (dtb__499, dtb__500, dtb__501) -> ((v_exprRefNamesGo dtb__499) ((v_exprRefNamesListGo dtb__500) mc1))
  | Frontend_dAst.C_Expr_ELam (dtb__502, dtb__503, dtb__504) -> ((v_exprRefNamesGo dtb__503) mc1)
  | Frontend_dAst.C_Expr_EFloat (dtb__505, dtb__506) -> mc1
  | Frontend_dAst.C_Expr_EStr (dtb__507, dtb__508) -> mc1
  | Frontend_dAst.C_Expr_EInt (dtb__509, dtb__510) -> mc1
  | Frontend_dAst.C_Expr_EVar (dtb__511, dtb__512) -> (B_dData_dList.C_List__x58__x58_ (dtb__511, mc1))
  | _ -> failwith "DT: impossible branch"
))
# 1283 "Vuna/Compiler/Loader/Flatten.vuna"
and v_exprRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__513, dtb__514) -> ((v_exprRefNamesListGo dtb__514) ((v_exprRefNamesGo dtb__513) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1287 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldExprsGo = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__515, dtb__516) -> ((v_fieldExprsGo dtb__516) ((v_exprRefNamesGo (B_dData_dPair.v_secondOf dtb__515)) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1292 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesGo = (fun (b : Frontend_dAst.t_Binding) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesGo (b).Frontend_dAst.f_Binding_bindPat) ((v_bindingValueRefNames (b).Frontend_dAst.f_Binding_bindValue) ((v_bindingSigRefNames (b).Frontend_dAst.f_Binding_bindSig) acc))))
# 1297 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingValueRefNames = (fun (mc0 : Frontend_dAst.t_BindingValue) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__517) -> ((v_clauseRefNamesListGo dtb__517) mc1)
  | Frontend_dAst.C_BindingValue_BVal (dtb__518) -> ((v_exprRefNamesGo dtb__518) mc1)
  | _ -> failwith "DT: impossible branch"
))
# 1302 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingSigRefNames = (fun (mc0 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__519) -> ((v_exprRefNamesGo (dtb__519).Frontend_dAst.f_BindingSig_sigType) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1306 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__520, dtb__521) -> ((v_bindRefNamesListGo dtb__521) ((v_bindRefNamesGo dtb__520) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1311 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesGo = (fun (alt : Frontend_dAst.t_Alt) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesGo (alt).Frontend_dAst.f_Alt_altPat) ((v_exprRefNamesGo (alt).Frontend_dAst.f_Alt_altBody) acc)))
# 1314 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__522, dtb__523) -> ((v_altRefNamesListGo dtb__523) ((v_altRefNamesGo dtb__522) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1319 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesGo = (fun (clause : Frontend_dAst.t_LocalClause) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesListGo (clause).Frontend_dAst.f_LocalClause_lcPats) ((v_exprRefNamesGo (clause).Frontend_dAst.f_LocalClause_lcBody) acc)))
# 1322 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesListGo = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__524, dtb__525) -> ((v_clauseRefNamesListGo dtb__525) ((v_clauseRefNamesGo dtb__524) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1327 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesGo = (fun (mc0 : Frontend_dAst.t_DoStmt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__526, dtb__527) -> ((v_bindRefNamesListGo dtb__526) mc1)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__528, dtb__529) -> ((v_exprRefNamesGo dtb__528) mc1)
  | Frontend_dAst.C_DoStmt_DBind (dtb__530, dtb__531, dtb__532) -> ((v_patRefNamesGo dtb__530) ((v_exprRefNamesGo dtb__531) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 1332 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesListGo = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__533, dtb__534) -> ((v_doStmtRefNamesListGo dtb__534) ((v_doStmtRefNamesGo dtb__533) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1337 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesGo = (fun (mc0 : Frontend_dAst.t_InterpPart) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__535) -> ((v_exprRefNamesGo dtb__535) mc1)
  | Frontend_dAst.C_InterpPart_IPText (dtb__536) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1341 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesListGo = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__537, dtb__538) -> ((v_interpPartRefNamesListGo dtb__538) ((v_interpPartRefNamesGo dtb__537) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1263 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exprRefNames = (fun (e : Frontend_dAst.t_Expr) -> ((v_exprRefNamesGo e) B_dData_dList.C_List_Nil))

# 1227 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ctorRefNames = (fun (c : Frontend_dAst.t_Ctor) -> (v_exprRefNames (c).Frontend_dAst.f_Ctor_ctorType))

# 1231 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fieldRefNames = (fun (f : Frontend_dAst.t_Field) -> (v_exprRefNames (f).Frontend_dAst.f_Field_fieldType))

# 1235 "Vuna/Compiler/Loader/Flatten.vuna"
let v_traitMethodRefNames = (fun (m : Frontend_dAst.t_TraitMethod) -> (v_exprRefNames (m).Frontend_dAst.f_TraitMethod_traitMethodType))

# 1212 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_declRefNames = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__539, dtb__540, dtb__541, dtb__542) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_patRefNames) dtb__540)) (v_exprRefNames dtb__541))
  | Frontend_dAst.C_Decl_DExtern (dtb__543, dtb__544, dtb__545, dtb__546) -> (v_exprRefNames dtb__545)
  | Frontend_dAst.C_Decl_DAxiom (dtb__547, dtb__548, dtb__549) -> (v_exprRefNames dtb__548)
  | Frontend_dAst.C_Decl_DSig (dtb__550, dtb__551, dtb__552, dtb__553) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__551)) (v_exprRefNames dtb__552))
  | Frontend_dAst.C_Decl_DInstance (dtb__554, dtb__555, dtb__556, dtb__557) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__554)) ((B_dData_dList.v_append (v_exprRefNames dtb__555)) ((B_dData_dList.v_concatMap v_declRefNames) dtb__556)))
  | Frontend_dAst.C_Decl_DTrait (dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__560)) ((B_dData_dList.v_concatMap v_traitMethodRefNames) dtb__561))
  | Frontend_dAst.C_Decl_DRecord (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567, dtb__568, dtb__569, dtb__570) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_fieldRefNames) dtb__565)) dtb__566)
  | Frontend_dAst.C_Decl_DData (dtb__571, dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578, dtb__579) -> ((B_dData_dList.v_append (v_exprRefNames dtb__573)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_ctorRefNames) dtb__574)) dtb__575))
  | _ -> failwith "DT: impossible branch"
))

# 1184 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declGlobalNames = (fun (d : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_concatMap v_expandGlobalName) (v_declRefNames d)))

# 1053 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportWarnings = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (sourceDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (reexports : string B_dData_dList.t_List) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.names") (fun (_u : int) -> (let sourceRefs = ((B_dData_dList.v_concatMap v_declRefNames) sourceDecls) in (let interpRef = (if ((B_dData_dList.v_memName "interp") sourceRefs) then true else ((B_dData_dList.v_memName Base_dIntrinsics.v_interpMethodName) sourceRefs)) in (let names0 = ((B_dData_dList.v_concatMap v_declGlobalNames) decls) in (let names = (if interpRef then names0 else ((B_dData_dList.v_filter (fun (n : string) -> (n <> Base_dIntrinsics.v_interpMethodName))) names0)) in (let nameSet = (B_dContainer_dHashMap.v_ofNames names) in (let fixitySet = (B_dContainer_dHashMap.v_ofNames ((v_visibleFixityOps modules) imports)) in ((Base_dObs.v_obsCheck "vuna.resolve.warn.sources") (fun (_u : int) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.imports") (fun (_u : int) -> (let sourceNames = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_filter (fun (n : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) fixitySet))) sourceRefs)) in ((((((v_unusedImportWarningsGo modules) nameSet) sourceNames) decls) reexports) imports)))))))))))))))

# 1039 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveModuleGo = (fun (release : bool) (m : Loader_dModules.t_Module) (rest : Loader_dModules.t_Module B_dData_dList.t_List) (declsR : Frontend_dAst.t_Decl B_dData_dList.t_List Base_dDiag.t_Check) -> ((Base_dCommon.v_bind declsR) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let modules2 = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = decls3; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (m).Loader_dModules.f_Module_moduleFixFactsOf }, rest)) in (let ns = ((Base_dObs.v_obsPure "vuna.resolve.ns") (fun (_u : int) -> ((((Loader_dResolve.v_namespacesOfWith release) modules2) decls3) (Loader_dModules.v_moduleAllImportsOf m)))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.module") (fun (_u : int) -> ((((((Loader_dResolve.v_resolveProgram modules2) (Loader_dModules.v_moduleNameOf m)) (Loader_dModules.v_moduleNameOf m)) ns) (Loader_dModules.v_moduleAllImportsOf m)) decls3)))) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings modules2) (m).Loader_dModules.f_Module_moduleImportsOf) d1) decls3) (Loader_dModules.v_moduleReexportsOf m))))) (fun (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = d1; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (m).Loader_dModules.f_Module_moduleFixFactsOf }; B_dData_dPair.f_Pair_second = warns })))))))))))

# 1025 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_resolveModulesKeep = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc3 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__580, dtb__581) -> (if ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__580)) mc1) then ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__581)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__580, (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p2) })))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf (dtb__580).Loader_dModules.f_Module_moduleFixFactsOf) mc2)) (Loader_dModules.v_moduleDeclsOf dtb__580))))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModuleGo mc0) dtb__580) dtb__581) ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls (Loader_dModules.v_moduleNameOf dtb__580)) decls2))))) (fun (p : (Loader_dModules.t_Module, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__581)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dPair.v_secondOf p2)) })))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 1017 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectKeeping = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Loader_dModules.t_Project) -> (match mc2 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__582; Loader_dModules.f_Project_projectEntryImports = dtb__583; Loader_dModules.f_Project_projectImplicitImports = dtb__584; Loader_dModules.f_Project_projectModules = dtb__585; Loader_dModules.f_Project_projectEntryPkg = dtb__586; Loader_dModules.f_Project_projectEntryFixities = dtb__587; Loader_dModules.f_Project_projectEntryName = dtb__588; Loader_dModules.f_Project_projectEntryFacts = dtb__589 } -> (let projectFixities = ((v_dedupeFixitiesOf dtb__585) dtb__587) in ((Base_dCommon.v_bind (Loader_dFixity.v_checkUniqueFixities projectFixities)) (fun (fixes : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf dtb__589) fixes)) dtb__582)))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls dtb__588) decls2)))) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.entry") (fun (_u : int) -> (((((Loader_dResolve.v_resolveEntry mc0) dtb__585) dtb__586) ((B_dData_dList.v_append dtb__583) dtb__584)) decls3)))) (fun (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings dtb__585) dtb__583) entryDecls) decls3) B_dData_dList.C_List_Nil)))) (fun (entryWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) fixes) dtb__585)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append entryWarns) (B_dData_dPair.v_secondOf p2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = entryDecls; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p2) } })))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProject = (fun (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping false) B_dData_dList.C_List_Nil) project))

# 1009 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectWith = (fun (release : bool) (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping release) B_dData_dList.C_List_Nil) project))
