open Vuna_runtime
# 59 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseWith = (fun (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match (((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.syntax") "vuna.phase") (fun (_u : int) -> (((Frontend_dParser.v_parseSourceRecoveringTokens path) mode) toks))) with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__0)))
  | Base_dDiag.C_Check_OkC (dtb__1) -> (let parsed = (B_dData_dPair.v_firstOf dtb__1) in (let errs = (B_dData_dPair.v_secondOf dtb__1) in (match errs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (parsed))
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb__3) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode = (fun (nFs : string) (nEnv : string) (nProcess : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) -> (match (((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.lex") "vuna.phase") (fun (_u : int) -> (Frontend_dLexer.v_lexSource src))) with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__4))))
  | Base_dDiag.C_Check_OkC (dtb__5) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_parseWith mode) path) dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath = (fun nFs nEnv nProcess -> ((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmStrict))

# 83 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeFixitiesGo = (fun (mc0 : (string, Frontend_dAst.t_FixityDecl) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (let key = (B_dData_dPair.v_firstOf dtb__6) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (((v_dedupeFixitiesGo dtb__7) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeFixitiesGo dtb__7) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__6), mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixityDeclKey = (fun (d : Frontend_dAst.t_FixityDecl) -> (let sp = (d).Frontend_dAst.f_FixityDecl_fixitySpan in (String.concat "" [(d).Frontend_dAst.f_FixityDecl_fixityOp; "|"; (bi_strFromInt (d).Frontend_dAst.f_FixityDecl_fixityLevel); "|"; (bi_strFromInt (d).Frontend_dAst.f_FixityDecl_fixityAssoc); "|"; (Base_dSource.v_spanFile sp); ":"; (bi_strFromInt (Base_dSource.v_spanStartLine sp)); ":"; (bi_strFromInt (Base_dSource.v_spanStartCol sp))])))

# 76 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeFixitiesOf = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (local : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (((v_dedupeFixitiesGo ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = (String.concat "" [(Loader_dModules.v_moduleNameOf m); "|"; (v_fixityDeclKey d)]); B_dData_dPair.f_Pair_second = d })) (Loader_dModules.v_moduleFixitiesOf m)))) modules)) ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = ("|entry|" ^ (v_fixityDeclKey d)); B_dData_dPair.f_Pair_second = d })) local))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 102 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isPrivateName = (fun (name : string) -> ((B_dData_dString.v_startsWith "_") name))

# 105 "Vuna/Compiler/Loader/Flatten.vuna"
let v_privateExportMsg = (fun (prefix : string) (sp : Base_dSource.t_Span) (name : string) -> ((((((Base_dDiag.v_diagAt sp) Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

# 117 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 132 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 142 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (if ((Frontend_dAst.v_ctorName dtb__50) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_ctorName dtb__50))) else ((v_findCtorNamed mc0) dtb__51))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findMethodNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__54; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__55; Frontend_dAst.f_TraitMethod_traitMethodSpan = dtb__56 } -> (if (dtb__54 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__54)) else ((v_findMethodNamed mc0) dtb__53))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 174 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__81; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__81); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownCtorEntries mc0) mc1) dtb__82)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownDataCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__83; Loader_dModules.f_ExportEntry_target = (((Loader_dModules.v_ctorCanonical mc0) mc1) dtb__83); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownDataCtorEntries mc0) mc1) dtb__84)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownTypeEntries = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : string) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | Frontend_dAst.C_Decl_DData (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (dtb__87 = mc2) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__87; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__87); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownDataCtorEntries mc0) dtb__87) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) dtb__90)))))) else (((v_ownTypeEntries mc0) dtb__86) mc2))
  | Frontend_dAst.C_Decl_DRecord (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> (if (dtb__96 = mc2) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__96; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__96); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownCtorEntries mc0) dtb__96) (B_dData_dList.C_List__x58__x58_ (dtb__96, B_dData_dList.C_List_Nil))))))) else (((v_ownTypeEntries mc0) dtb__86) mc2))
  | Frontend_dAst.C_Decl_DTrait (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if (dtb__104 = mc2) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__104; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__104); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownCtorEntries mc0) dtb__104) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb__107)))))) else (((v_ownTypeEntries mc0) dtb__86) mc2))
  | _ -> (((v_ownTypeEntries mc0) dtb__86) mc2)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ctorEntriesOfType = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (if (if ((dtb__109).Loader_dModules.f_ExportEntry_kind = "ctor") then ((dtb__109).Loader_dModules.f_ExportEntry_parent = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__109, ((v_ctorEntriesOfType mc0) dtb__110))) else ((v_ctorEntriesOfType mc0) dtb__110))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 252 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_isRecordDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | Frontend_dAst.C_Decl_DRecord (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (if (dtb__113 = mc0) then true else ((v_isRecordDecl mc0) dtb__112))
  | _ -> ((v_isRecordDecl mc0) dtb__112)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isRecordTarget = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prefix : string) (target : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot target)) with
  | { B_dData_dPair.f_Pair_first = dtb__121; B_dData_dPair.f_Pair_second = dtb__122 } -> (let m = (Base_dSource.v_joinDots dtb__121) in (if (m = prefix) then ((v_isRecordDecl dtb__122) decls) else (let nd_uscrut9 = ((Loader_dModules.v_findModule modules) m) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (match dtb__123 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__124; Loader_dModules.f_Module_modulePackageOf = dtb__125; Loader_dModules.f_Module_moduleImportsOf = dtb__126; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__127; Loader_dModules.f_Module_moduleDeclsOf = dtb__128; Loader_dModules.f_Module_moduleExportsOf = dtb__129; Loader_dModules.f_Module_moduleFixitiesOf = dtb__130; Loader_dModules.f_Module_moduleReexportsOf = dtb__131; Loader_dModules.f_Module_moduleOpaqueOf = dtb__132; Loader_dModules.f_Module_moduleExportIndexOf = dtb__133 } -> ((v_isRecordDecl dtb__122) dtb__128)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Loader/Flatten.vuna"
let v_typeRefDominates = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : string) (mc3 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) (mc4 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (match dtb__134 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__135; Loader_dModules.f_ExportRef_refTarget = dtb__136; Loader_dModules.f_ExportRef_refParent = dtb__137 } -> (let nd_uscrut10 = mc4 in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (match dtb__138 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__139; Loader_dModules.f_ExportRef_refTarget = dtb__140; Loader_dModules.f_ExportRef_refParent = dtb__141 } -> (if (if (if (dtb__135 = "type") then (dtb__139 = "ctor") else false) then (dtb__136 = dtb__140) else false) then ((((v_isRecordTarget mc0) mc1) mc2) dtb__136) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Loader/Flatten.vuna"
let v_refEntryList = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (match dtb__142 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__143; Loader_dModules.f_ExportRef_refTarget = dtb__144; Loader_dModules.f_ExportRef_refParent = dtb__145 } -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = dtb__143; Loader_dModules.f_ExportEntry_public = mc0; Loader_dModules.f_ExportEntry_target = dtb__144; Loader_dModules.f_ExportEntry_parent = dtb__145 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedTypeRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = ((v_findOwnData name) decls) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = "" }))))))
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__147); Loader_dModules.f_ExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 304 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownCtorEntriesNamed = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match dtb__149 with
  | Frontend_dAst.C_Decl_DData (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> ((B_dData_dList.v_append (((v_ownDataCtorEntries mc0) dtb__151) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) ((B_dData_dList.v_filter (fun (c : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName c) = mc1))) dtb__154)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__150))
  | Frontend_dAst.C_Decl_DRecord (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> (if (dtb__160 = mc1) then ((B_dData_dList.v_append (((v_ownCtorEntries mc0) dtb__160) (B_dData_dList.C_List__x58__x58_ (dtb__160, B_dData_dList.C_List_Nil)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__150)) else (((v_ownCtorEntriesNamed mc0) mc1) dtb__150))
  | Frontend_dAst.C_Decl_DTrait (dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> ((B_dData_dList.v_append (((v_ownCtorEntries mc0) dtb__168) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) ((B_dData_dList.v_filter (fun (m : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName m) = mc1))) dtb__171)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__150))
  | _ -> (((v_ownCtorEntriesNamed mc0) mc1) dtb__150)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef2 = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = (((v_ownCtorEntriesNamed prefix) name) decls) in (match nd_uscrut5 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "name") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let e = (B_dData_dPair.v_secondOf p) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportRef_refTarget = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (e).Loader_dModules.f_ExportEntry_parent })))))))
)))
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | B_dData_dList.C_List__x58__x58_ (dtb__175, dtb__176) -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructorExport (name))) name)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "ctor"; Loader_dModules.f_ExportRef_refTarget = (dtb__173).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (dtb__173).Loader_dModules.f_ExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 277 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match ((v_findOwnFn name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__177) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "val"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__177); Loader_dModules.f_ExportRef_refParent = "" }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ownOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameExportEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (e).Loader_dModules.f_ExportEntry_parent })

# 355 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameTypeEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" })

# 371 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isEmptyEntries = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSelective = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (m : string) (base : string) (name : string) (sp : Base_dSource.t_Span) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let values = ((B_dData_dList.v_map (v_renameExportEntry base)) ((Loader_dModules.v_findExportValues es) base)) in (let types = ((B_dData_dList.v_map (v_renameTypeEntry base)) ((Loader_dModules.v_findExportTypes es) base)) in (let entries = ((B_dData_dList.v_append values) types) in (if (v_isEmptyEntries entries) then (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name) else (Base_dDiag.C_Check_OkC (entries)))))))))

# 425 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_hasImportOf = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (if ((Loader_dModules.v_importName dtb__180) = mc1) then true else ((v_hasImportOf dtb__181) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_namespaceImportsGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__182, dtb__183) -> (match dtb__182 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__184, dtb__185, dtb__186) -> (if (if ((v_hasImportOf mc0) dtb__184) then true else ((v_hasImportOf mc2) dtb__184)) then (((v_namespaceImportsGo mc0) dtb__183) mc2) else (((v_namespaceImportsGo mc0) dtb__183) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__184; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = dtb__185; Frontend_dAst.f_Import_importSpan = dtb__186 }, mc2))))
  | _ -> (((v_namespaceImportsGo mc0) dtb__183) mc2)
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceImportsOf = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> ((B_dData_dList.v_append imports) (B_dData_dList.v_reverse (((v_namespaceImportsGo imports) items) B_dData_dList.C_List_Nil))))

# 437 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_joinCommaNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (match dtb__188 with
  | B_dData_dList.C_List_Nil -> dtb__187
  | _ -> (String.concat "" [dtb__187; ", "; (v_joinCommaNames dtb__188)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveImportPrefix = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (prefix : string) -> (let nd_uscrut2 = ((Loader_dModules.v_qualifierCandidates imports) prefix) in (match nd_uscrut2 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (prefix))) prefix)
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (match dtb__190 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__189))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (prefix, (v_joinCommaNames nd_uscrut2)))) prefix) (v_joinCommaNames nd_uscrut2))
)
  | _ -> failwith "DT: impossible branch"
)))

# 323 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportBare = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> (match dtb__191 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ownOrImportedTypeRef modules) prefix) decls) imports) name)) (fun (tr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_ownOrImportedValueRef modules) prefix) decls) imports) name)) (fun (vr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match tr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (Base_dDiag.C_Check_OkC (((v_refEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((v_refEntryList name) tr)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__195) -> (if (((((v_typeRefDominates modules) decls) prefix) tr) vr) then (Base_dDiag.C_Check_OkC (((v_refEntryList name) tr))) else (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append ((v_refEntryList name) tr)) ((v_refEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> (let mprefix = (Base_dSource.v_joinDots dtb__191) in ((Base_dCommon.v_bind ((v_resolveImportPrefix imports) mprefix)) (fun (m : string) -> ((((((v_exportSelective modules) prefix) m) dtb__192) name) sp))))
)
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTypeAll = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 } -> (match dtb__196 with
  | B_dData_dList.C_List_Nil -> (match (((v_ownTypeEntries prefix) decls) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__198) -> (Base_dDiag.C_Check_OkC (dtb__198))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let m = (B_dData_dPair.v_firstOf p) in (let tgt = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target in ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = name; Loader_dModules.f_ExportEntry_target = tgt; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType tgt) es)))))))))))
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (let mprefix = (Base_dSource.v_joinDots dtb__196) in ((Base_dCommon.v_bind ((v_resolveImportPrefix imports) mprefix)) (fun (m : string) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportType es) dtb__197) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__197; Loader_dModules.f_ExportEntry_target = (dtb__199).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType (dtb__199).Loader_dModules.f_ExportEntry_target) es)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dRn.v_rnAt2 sp) (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (dtb__197, m))) dtb__197) m)
  | _ -> failwith "DT: impossible branch"
))))))
)
  | _ -> failwith "DT: impossible branch"
))

# 462 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceEntry = (fun (path : string) (target : string) -> { Loader_dModules.f_ExportEntry_kind = "module"; Loader_dModules.f_ExportEntry_public = path; Loader_dModules.f_ExportEntry_target = target; Loader_dModules.f_ExportEntry_parent = "" })

# 466 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_filterExportMembers = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__200, dtb__201) -> (if (if ((dtb__200).Loader_dModules.f_ExportEntry_kind = "ctor") then (B_dData_dBool.v_not ((B_dData_dList.v_memName (dtb__200).Loader_dModules.f_ExportEntry_public) mc0)) else false) then ((v_filterExportMembers mc0) dtb__201) else (B_dData_dList.C_List__x58__x58_ (dtb__200, ((v_filterExportMembers mc0) dtb__201))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 442 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportItemEntries = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem) -> (match mc4 with
  | Frontend_dAst.C_ExportItem_XBare (dtb__202, dtb__203) -> ((((((v_exportBare mc0) mc1) mc2) mc3) dtb__202) dtb__203)
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__204, dtb__205, dtb__206) -> ((Base_dCommon.v_bind ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__204) dtb__206)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_filterExportMembers dtb__205) es)))))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__207, dtb__208) -> ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__207) dtb__208)
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__209, dtb__210, dtb__211) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix mc3) dtb__209)) (fun (m : string) -> (match dtb__210 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_exportsOf mc0) m)
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (if (dtb__212 = dtb__209) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__209) m), B_dData_dList.C_List_Nil)))) else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__209) m), (B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__212) m), B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__213, dtb__214) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix mc3) dtb__213)) (fun (m : string) -> ((Loader_dModules.v_exportsOf mc0) m)))
  | _ -> failwith "DT: impossible branch"
))

# 477 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportEntryKey = (fun (e : Loader_dModules.t_ExportEntry) -> (String.concat "" [(e).Loader_dModules.f_ExportEntry_kind; "|"; (e).Loader_dModules.f_ExportEntry_public; "|"; (e).Loader_dModules.f_ExportEntry_target; "|"; (e).Loader_dModules.f_ExportEntry_parent]))

# 480 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeByFullKey = (fun (mc0 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (let key = (v_exportEntryKey dtb__215) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (((v_dedupeByFullKey dtb__216) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeByFullKey dtb__216) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ (dtb__215, mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeExportEntries = (fun (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (((v_dedupeByFullKey entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 498 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exportItemsAll = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> ((Base_dCommon.v_bind (((((v_exportItemEntries mc0) mc1) mc2) mc3) dtb__218)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) dtb__219)) (fun (tail : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append es) tail)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Loader/Flatten.vuna"
let v_explicitExports = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((v_dedupeExportEntries es)))))
))

# 505 "Vuna/Compiler/Loader/Flatten.vuna"
let v_validateModuleHeader = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__220) -> (match dtb__220 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__221; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__222; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__223; Frontend_dAst.f_ModDecl_modDeclExports = dtb__224; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__225; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__226; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__227 } -> (if (dtb__221 = mc0) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (((Base_dDiagnostics_dRn.v_rnAt1 dtb__227) (Base_dDiagnostics_dRn.C_RnErr_ModuleNameMismatch (dtb__221))) dtb__221))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_opaqueNamesOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__228, dtb__229) -> (match (dtb__228).Frontend_dAst.f_OpacitySpec_opacityKind with
  | Frontend_dAst.C_Opacity_OpacityOpaque -> (B_dData_dList.C_List__x58__x58_ (((Loader_dModules.v_mangle mc0) (Frontend_dAst.v_opacitySpecName dtb__228)), ((v_opaqueNamesOf mc0) dtb__229)))
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((v_opaqueNamesOf mc0) dtb__229)
  | Frontend_dAst.C_Opacity_OpacityAbstract -> (B_dData_dList.C_List__x58__x58_ ((":" ^ ((Loader_dModules.v_mangle mc0) (Frontend_dAst.v_opacitySpecName dtb__228))), ((v_opaqueNamesOf mc0) dtb__229)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 518 "Vuna/Compiler/Loader/Flatten.vuna"
let v_abstractOpaquePrefix = ":"

# 521 "Vuna/Compiler/Loader/Flatten.vuna"
let v_opaqueBaseName = (fun (name : string) -> (if ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name) then (((dtp_substring (bi_strLength v_abstractOpaquePrefix)) ((bi_strLength name) - (bi_strLength v_abstractOpaquePrefix))) name) else name))

# 531 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isAbstractOpaqueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name))

# 548 "Vuna/Compiler/Loader/Flatten.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 552 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSpecToItem = (fun (mc0 : Frontend_dAst.t_ExportSpec) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__232, dtb__233, dtb__234) -> (match dtb__233 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__235) -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb__232, dtb__235, dtb__234))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (dtb__232, dtb__234))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XBare (dtb__232, dtb__234))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__236, dtb__237) -> (Frontend_dAst.C_ExportItem_XBare (dtb__236, dtb__237))
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Loader/Flatten.vuna"
let v_computeExports = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (extraExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (extraReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (let newItems = ((B_dData_dList.v_append ((B_dData_dList.v_map v_exportSpecToItem) extraExports)) extraReexports) in (let explicit = (((((v_explicitExports modules) prefix) decls) imports) newItems) in (if (v_notEmpty newItems) then (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> explicit
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (match dtb__238 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__239; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__240; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__241; Frontend_dAst.f_ModDecl_modDeclExports = dtb__242; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__243; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__244; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__245 } -> (if dtb__240 then (((Base_dDiagnostics_dRn.v_rnAt1 dtb__245) (Base_dDiagnostics_dRn.C_RnErr_DuplicateExport ("module header"))) "module header") else explicit)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (match dtb__246 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__247; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__248; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__249; Frontend_dAst.f_ModDecl_modDeclExports = dtb__250; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__251; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__252; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__253 } -> (if dtb__248 then (((((v_explicitExports modules) prefix) decls) imports) dtb__249) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 558 "Vuna/Compiler/Loader/Flatten.vuna"
let v_showCycle = (fun (name : string) (stack : string B_dData_dList.t_List) -> (Base_dSource.v_joinArrows (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (name, stack)))))

# 583 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeDeps = (fun (mc0 : string) (mc1 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (match dtb__255 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = "Prelude"; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } }, B_dData_dList.C_List_Nil))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousPrelude ((Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))) (Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) "Prelude") importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((v_implicitPreludeDeps importerPkg) ((B_dData_dList.v_filter (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)) <> importerPkg))) allowed)))))))

# 566 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (currentName = "Prelude") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames imports)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (((v_implicitPreludeFrom nFs) roots) importerPkg))))

# 593 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withLayerCheck = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> ((Base_dCommon.v_bind ((Loader_dLayers.v_checkProjectLayers roots) project)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (project)))))

# 597 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (imp).Frontend_dAst.f_Import_importSpan) = "") then e else ((Base_dDiag.v_withFallbackSpan (imp).Frontend_dAst.f_Import_importSpan) e)))

# 624 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsTakeLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__256, ((v_nsTakeLocal (mc0 - 1)) dtb__257))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_pathPrefixOf = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs))) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (if (v_notEmpty (B_dData_dPair.v_firstOf collected)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs)); B_dData_dPair.f_Pair_second = n }))) else (((((v_pathPrefixOf nFs) roots) importerPkg) segs) (n - 1)))))))

# 628 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsDropLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259)) else ((v_nsDropLocal (mc0 - 1)) dtb__259))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_loadAll = (fun (nFs : string) (nEnv : string) (nProcess : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.v_icFuel "loader")) else (match imports with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (modules)))
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) dtb__260)) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__262) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__262)))
  | Base_dDiag.C_Check_OkC (dtb__263) -> (((((((((v_loadAll nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) dtb__263) stack) dtb__261)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 632 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadModule = (fun (nFs : string) (nEnv : string) (nProcess : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (let name = (Loader_dModules.v_importName imp) in (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.v_icFuel "loader")) else (match ((Loader_dModules.v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (if (((Loader_dModules.v_moduleVisibleTo roots) importerPkg) dtb__264) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC (modules))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (Loader_dModules.v_modulePackageOf dtb__264)))) name) (Loader_dModules.v_modulePackageOf dtb__264)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) stack) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ImportCycle (((v_showCycle name) stack)))) ((v_showCycle name) stack)))) else (if (Loader_dModules.v_validModuleName name) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Loader_dModules.v_findModuleFile nFs) roots) name) importerPkg) (imp).Frontend_dAst.f_Import_importSpan)) (fun foundR -> (match foundR with
  | Base_dDiag.C_Check_ErrC (dtb__265) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__266) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_pathPrefixOf nFs) roots) importerPkg) (Base_dSource.v_splitOnDot name)) ((B_dData_dList.v_length (Base_dSource.v_splitOnDot name)) - 1))) (fun prefixR -> (let nd_uscrut21 = prefixR in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__267) -> (match dtb__267 with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) { Frontend_dAst.f_Import_importName = dtb__268; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importSpan = (imp).Frontend_dAst.f_Import_importSpan })) (fun modsR -> (match modsR with
  | Base_dDiag.C_Check_ErrC (dtb__270) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__270)))
  | Base_dDiag.C_Check_OkC (dtb__271) -> (match ((Loader_dModules.v_findModule dtb__271) dtb__268) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (match (((Loader_dModules.v_walkNamespaceIndex dtb__271) dtb__268) ((v_nsDropLocal dtb__269) (Base_dSource.v_splitOnDot name))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (((((((((v_loadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) dtb__271) stack) { Frontend_dAst.f_Import_importName = dtb__273; Frontend_dAst.f_Import_importIsQualified = true; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importSpan = (imp).Frontend_dAst.f_Import_importSpan })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__274) -> (let path = (B_dData_dPair.v_firstOf dtb__274) in (let root = (B_dData_dPair.v_secondOf dtb__274) in (let _u = (if (dtp_debug_on 0) then (dtp_debug_line ("parse-module=" ^ name)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_parseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> (let nd_uscrut22 = parsed in (match nd_uscrut22 with
  | Base_dDiag.C_Check_OkC (dtb__275) -> (match dtb__275 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__276; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__277; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__278; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__279; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__280; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__281; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__282 } -> (let imports1 = dtb__277 in (let providers = B_dData_dList.C_List_Nil in (let modules1 = modules in (let imports = ((v_namespaceImportsOf imports1) dtb__281) in (match ((v_validateModuleHeader name) dtb__276) with
  | Base_dDiag.C_Check_ErrC (dtb__283) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__283)))
  | Base_dDiag.C_Check_OkC (dtb__284) -> (match ((Loader_dModules.v_validateImports name) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__285) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__285)))
  | Base_dDiag.C_Check_OkC (dtb__286) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_implicitPrelude nFs) roots) (Frontend_dPackages_dPkg.v_rootName root)) name) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__287) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__287)))
  | Base_dDiag.C_Check_OkC (dtb__288) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) (fuel - 1)) roots) (Frontend_dPackages_dPkg.v_rootName root)) modules1) (B_dData_dList.C_List__x58__x58_ (name, stack))) ((B_dData_dList.v_append imports) dtb__288))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__289) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__289)))
  | Base_dDiag.C_Check_OkC (dtb__290) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__290) imports) in (match (((((((v_computeExports dtb__290) name) dtb__276) imports2) dtb__279) dtb__280) dtb__281) with
  | Base_dDiag.C_Check_ErrC (dtb__291) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__291)))
  | Base_dDiag.C_Check_OkC (dtb__292) -> (let visible = dtb__278 in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = name; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_rootName root); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__288; Loader_dModules.f_Module_moduleDeclsOf = dtb__279; Loader_dModules.f_Module_moduleExportsOf = dtb__292; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append providers) ((B_dData_dList.v_append ((Loader_dModules.v_reexportedImportNamesOfHeader imports2) dtb__276)) ((Loader_dModules.v_reexportedImportNames imports2) dtb__281))); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf name) dtb__282); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__292) }, dtb__290))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__293) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__293)))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_InvalidModuleName (name))) name)))))
  | _ -> failwith "DT: impossible branch"
))))

# 722 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_parseFileWithPath nFs) nEnv) nProcess) entry) text)) (fun parsed -> (let nd_uscrut13 = parsed in (match nd_uscrut13 with
  | Base_dDiag.C_Check_OkC (dtb__294) -> (match dtb__294 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__295; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__296; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__297; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__298; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__299; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__300; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__301 } -> (let nd_uscrut23 = dtb__295 in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let imports1 = dtb__296 in (let preloaded1 = preloaded in (match ((Loader_dModules.v_validateImports "<entry>") imports1) with
  | Base_dDiag.C_Check_ErrC (dtb__302) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__302)))
  | Base_dDiag.C_Check_OkC (dtb__303) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports1)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__304) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__304)))
  | Base_dDiag.C_Check_OkC (dtb__305) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports1) dtb__305))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__306) -> (Base_dDiag.C_Check_ErrC (dtb__306))
  | Base_dDiag.C_Check_OkC (dtb__307) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__307) imports1) in ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__298; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__305; Loader_dModules.f_Project_projectModules = dtb__307; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = dtb__297 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> (match dtb__308 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__309; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__310; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__311; Frontend_dAst.f_ModDecl_modDeclExports = dtb__312; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__313; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__314; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__315 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan dtb__315)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntryFile (entry))) entry)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__316) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__316)))
  | _ -> failwith "DT: impossible branch"
)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_EntryFileNotFound (entry))) entry))))))

# 715 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((((((v_loadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) B_dData_dList.C_List_Nil))

# 764 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (let entryImports = ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_Import_importName = n; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 } })) names) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) entryImports)) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__317) -> (Base_dDiag.C_Check_ErrC (dtb__317))
  | Base_dDiag.C_Check_OkC (dtb__318) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb__318; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil })
  | _ -> failwith "DT: impossible branch"
))))))

# 761 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((((((v_loadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) B_dData_dList.C_List_Nil))

# 783 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSourceWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (let nd_uscrut12 = parsed in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__319) -> (match dtb__319 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__320; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__321; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__322; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__323; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__324; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__325; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__326 } -> (let nd_uscrut22 = dtb__320 in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let imports1 = dtb__321 in (let preloaded1 = preloaded in (match ((Loader_dModules.v_validateImports "<entry>") imports1) with
  | Base_dDiag.C_Check_ErrC (dtb__327) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__327)))
  | Base_dDiag.C_Check_OkC (dtb__328) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports1)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__329) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__329)))
  | Base_dDiag.C_Check_OkC (dtb__330) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports1) dtb__330))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__331) -> (Base_dDiag.C_Check_ErrC (dtb__331))
  | Base_dDiag.C_Check_OkC (dtb__332) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__332) imports1) in ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__323; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__330; Loader_dModules.f_Project_projectModules = dtb__332; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = dtb__322 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__333) -> (match dtb__333 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__334; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__335; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__336; Frontend_dAst.f_ModDecl_modDeclExports = dtb__337; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__338; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__339; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__340 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntrySource (label))) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__341) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__341)))
  | _ -> failwith "DT: impossible branch"
)))))

# 779 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((((v_loadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) B_dData_dList.C_List_Nil))

# 824 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSourceWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (let nd_uscrut12 = parsed in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__342) -> (match dtb__342 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__343; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__344; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__345; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__346; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__347; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__348; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__349 } -> (let nd_uscrut22 = dtb__343 in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (match dtb__350 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__351; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__352; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__353; Frontend_dAst.f_ModDecl_modDeclExports = dtb__354; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__355; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__356; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__357 } -> (let imports1 = dtb__344 in (let providers = B_dData_dList.C_List_Nil in (let preloaded1 = preloaded in (let imports = ((v_namespaceImportsOf imports1) dtb__348) in (match ((Loader_dModules.v_validateImports dtb__351) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__358) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__358)))
  | Base_dDiag.C_Check_OkC (dtb__359) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__351) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__360) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__360)))
  | Base_dDiag.C_Check_OkC (dtb__361) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__361))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__362) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__362)))
  | Base_dDiag.C_Check_OkC (dtb__363) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__363) imports) in (match (((((((v_computeExports dtb__363) dtb__351) dtb__343) imports2) dtb__346) dtb__347) dtb__348) with
  | Base_dDiag.C_Check_ErrC (dtb__364) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__364)))
  | Base_dDiag.C_Check_OkC (dtb__365) -> (let visible = dtb__345 in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__361; Loader_dModules.f_Project_projectModules = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__351; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__361; Loader_dModules.f_Module_moduleDeclsOf = dtb__346; Loader_dModules.f_Module_moduleExportsOf = dtb__365; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append providers) ((Loader_dModules.v_reexportedImportNames imports2) ((B_dData_dList.v_append dtb__353) dtb__348))); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb__351) dtb__349); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__365) }, dtb__363)); Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil })))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((v_loadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__366) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__366)))
  | _ -> failwith "DT: impossible branch"
)))))

# 820 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((((v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) B_dData_dList.C_List_Nil))

# 870 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules0 : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (let nd_uscrut12 = parsed in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__367) -> (match dtb__367 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__368; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__369; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__370; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__371; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__372; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__373; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__374 } -> (let imports1 = dtb__369 in (let modules1 = modules0 in (let imports = ((v_namespaceImportsOf imports1) dtb__373) in (let nd_uscrut25 = dtb__368 in (match nd_uscrut25 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__375) -> (match dtb__375 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__376; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__377; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__378; Frontend_dAst.f_ModDecl_modDeclExports = dtb__379; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__380; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__381; Frontend_dAst.f_ModDecl_modDeclSpan = dtb__382 } -> (match ((Loader_dModules.v_validateImports dtb__376) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__383) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__383)))
  | Base_dDiag.C_Check_OkC (dtb__384) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__376) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__385) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__385)))
  | Base_dDiag.C_Check_OkC (dtb__386) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) modules1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__386))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__387) -> (Base_dDiag.C_Check_ErrC (dtb__387))
  | Base_dDiag.C_Check_OkC (dtb__388) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb__388) dtb__370) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports label) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__389) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__389)))
  | Base_dDiag.C_Check_OkC (dtb__390) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__391) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__391)))
  | Base_dDiag.C_Check_OkC (dtb__392) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) modules1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__392))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__393) -> (Base_dDiag.C_Check_ErrC (dtb__393))
  | Base_dDiag.C_Check_OkC (dtb__394) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__394; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb__394) dtb__370) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__395) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dDiag.C_Check_ErrC (dtb__395)))
  | _ -> failwith "DT: impossible branch"
)))))

# 916 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_fixitiesForSourceIn nFs) nEnv) nProcess) ctx) B_dData_dList.C_List_Nil) label) source)) (fun pairR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pairR with
  | Base_dDiag.C_Check_ErrC (dtb__396) -> (Base_dDiag.C_Check_ErrC (dtb__396))
  | Base_dDiag.C_Check_OkC (dtb__397) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb__397)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1016 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_fixityOpsOf = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__398, dtb__399) -> (B_dData_dList.C_List__x58__x58_ ((dtb__398).Frontend_dAst.f_FixityDecl_fixityOp, (v_fixityOpsOf dtb__399)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameSuffixIn = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__400, dtb__401) -> (if (if (dtb__400 = mc0) then true else ((B_dData_dString.v_endsWith ("." ^ mc0)) dtb__400)) then true else ((v_anyNameSuffixIn mc0) dtb__401))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1028 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyOpDeclared = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__402, dtb__403) -> (if ((v_anyNameSuffixIn dtb__402) mc1) then true else ((v_anyOpDeclared dtb__403) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1053 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_traitMethodNames = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__404, dtb__405) -> (B_dData_dList.C_List__x58__x58_ ((dtb__404).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb__405)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Loader/Flatten.vuna"
let v_definedNamesOfDecl = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__406, dtb__407, dtb__408, dtb__409) -> (B_dData_dList.C_List__x58__x58_ (dtb__406, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb__410, dtb__411, dtb__412, dtb__413) -> (B_dData_dList.C_List__x58__x58_ (dtb__410, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__414, dtb__415, dtb__416) -> (B_dData_dList.C_List__x58__x58_ (dtb__414, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__417, dtb__418, dtb__419, dtb__420) -> (B_dData_dList.C_List__x58__x58_ (dtb__417, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb__421, dtb__422, dtb__423, dtb__424) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DTrait (dtb__425, dtb__426, dtb__427, dtb__428, dtb__429) -> (B_dData_dList.C_List__x58__x58_ (dtb__425, (v_traitMethodNames dtb__428)))
  | Frontend_dAst.C_Decl_DRecord (dtb__430, dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437) -> (B_dData_dList.C_List__x58__x58_ (dtb__430, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DData (dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446) -> (B_dData_dList.C_List__x58__x58_ (dtb__438, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_definedNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__447, dtb__448) -> ((B_dData_dList.v_append (v_definedNamesOfDecl dtb__447)) (v_definedNamesOf dtb__448))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesDeclaredFixity = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__449) -> ((v_anyOpDeclared (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__449))) (v_definedNamesOf decls))
  | _ -> failwith "DT: impossible branch"
))

# 1057 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__450, dtb__451) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__450) mc0) then true else ((v_anyNameIn mc0) dtb__451))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1010 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesUsedFixity = (fun (sourceNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__452) -> ((v_anyNameIn sourceNames) (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__452)))
  | _ -> failwith "DT: impossible branch"
))

# 1069 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyInstanceDecl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__453, dtb__454) -> (match dtb__453 with
  | Frontend_dAst.C_Decl_DInstance (dtb__455, dtb__456, dtb__457, dtb__458) -> true
  | _ -> (v_anyInstanceDecl dtb__454)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1063 "Vuna/Compiler/Loader/Flatten.vuna"
let v_moduleDeclaresInstance = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__459) -> (v_anyInstanceDecl (Loader_dModules.v_moduleDeclsOf dtb__459))
  | _ -> failwith "DT: impossible branch"
))

# 1087 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importStartsLine = (fun (imp : Frontend_dAst.t_Import) -> ((Base_dSource.v_spanStartCol (imp).Frontend_dAst.f_Import_importSpan) = (if (imp).Frontend_dAst.f_Import_importIsQualified then 18 else 8)))

# 1090 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyImportOnLine = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Import) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__460, dtb__461) -> (if ((Base_dSource.v_spanStartOffset (dtb__460).Frontend_dAst.f_Import_importSpan) = (Base_dSource.v_spanStartOffset (mc1).Frontend_dAst.f_Import_importSpan)) then ((v_anyImportOnLine dtb__461) mc1) else (if ((Base_dSource.v_spanStartLine (dtb__460).Frontend_dAst.f_Import_importSpan) = (Base_dSource.v_spanStartLine (mc1).Frontend_dAst.f_Import_importSpan)) then true else ((v_anyImportOnLine dtb__461) mc1)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1100 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyDeclOnLine = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__462, dtb__463) -> (if ((Base_dSource.v_spanStartLine (Frontend_dAst.v_declSpan dtb__462)) = mc1) then true else ((v_anyDeclOnLine dtb__463) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1082 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importOwnsLine = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (if (if (v_importStartsLine imp) then (B_dData_dBool.v_not ((v_anyImportOnLine imports) imp)) else false) then (B_dData_dBool.v_not ((v_anyDeclOnLine decls) (Base_dSource.v_spanStartLine (imp).Frontend_dAst.f_Import_importSpan))) else false))

# 1106 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalSpan = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = (Base_dSource.v_spanFile sp); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = ((Base_dSource.v_spanStartLine sp) + 1); Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = ((Base_dSource.v_spanStartOffset sp) - ((Base_dSource.v_spanStartCol sp) - 1)); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_spanStartOffset sp) - ((Base_dSource.v_spanStartCol sp) - 1)) })

# 1076 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalEdits = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (if (((v_importOwnsLine imports) decls) imp) then (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = (v_importRemovalSpan (imp).Frontend_dAst.f_Import_importSpan); Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))

# 997 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportDiag = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (let d = (((Base_dDiagnostics_dWarning.v_warnDiagAt (imp).Frontend_dAst.f_Import_importSpan) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedImport ((imp).Frontend_dAst.f_Import_importName))) (B_dData_dVec.C_Vec_VCons ((imp).Frontend_dAst.f_Import_importName, B_dData_dVec.C_Vec_Nil))) in (match (((v_importRemovalEdits imports) decls) imp) with
  | B_dData_dList.C_List_Nil -> d
  | dtb__464 -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = ("remove unused import " ^ (imp).Frontend_dAst.f_Import_importName); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = dtb__464 }) d)
)))

# 1126 "Vuna/Compiler/Loader/Flatten.vuna"
let v_expandGlobalName = (fun (n : string) -> (if (Frontend_dAst.v_isOverCtorName n) then (Frontend_dAst.v_overCtorTargets n) else (match (Frontend_dAst.v_doSyntaxCanonical n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__465) -> (B_dData_dList.C_List__x58__x58_ (dtb__465, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 1136 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTargetOf = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 1140 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyTargetIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__466, dtb__467) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) dtb__466) mc0) then true else ((v_anyTargetIn mc0) dtb__467))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 985 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_unusedImportWarningsGo = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__468, dtb__469) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) (Loader_dModules.v_importName dtb__468))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let used = (if (if (if (if ((B_dData_dList.v_memName (Loader_dModules.v_importName dtb__468)) mc5) then true else ((v_anyTargetIn mc1) ((B_dData_dList.v_map v_exportTargetOf) es))) then true else (((v_importProvidesUsedFixity mc2) mc0) dtb__468)) then true else (((v_importProvidesDeclaredFixity mc4) mc0) dtb__468)) then true else ((v_moduleDeclaresInstance mc0) dtb__468)) in ((Base_dCommon.v_bind (((((((v_unusedImportWarningsGo mc0) mc1) mc2) mc3) mc4) mc5) dtb__469)) (fun (more : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if used then more else (B_dData_dList.C_List__x58__x58_ ((((v_unusedImportDiag mc3) mc4) dtb__468), more))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1173 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_patRefNames = (fun (mc0 : Frontend_dAst.t_Pat) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__470, dtb__471, dtb__472) -> (B_dData_dList.C_List__x58__x58_ (dtb__470, ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair) -> (v_patRefNames (B_dData_dPair.v_secondOf f)))) dtb__471)))
  | Frontend_dAst.C_Pat_PStr (dtb__473, dtb__474) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PInt (dtb__475, dtb__476) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PCon (dtb__477, dtb__478, dtb__479) -> (B_dData_dList.C_List__x58__x58_ (dtb__477, ((B_dData_dList.v_concatMap v_patRefNames) dtb__478)))
  | Frontend_dAst.C_Pat_PWild (dtb__480) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Pat_PAs (dtb__481, dtb__482, dtb__483) -> (v_patRefNames dtb__482)
  | Frontend_dAst.C_Pat_PVar (dtb__484, dtb__485) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1183 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exprRefNames = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInterp (dtb__486, dtb__487, dtb__488) -> ((B_dData_dList.v_concatMap v_interpPartRefNames) dtb__487)
  | Frontend_dAst.C_Expr_EAnn (dtb__489, dtb__490, dtb__491) -> ((B_dData_dList.v_append (v_exprRefNames dtb__489)) (v_exprRefNames dtb__490))
  | Frontend_dAst.C_Expr_ESectR (dtb__492, dtb__493, dtb__494) -> (B_dData_dList.C_List__x58__x58_ (dtb__493, (v_exprRefNames dtb__492)))
  | Frontend_dAst.C_Expr_ESectL (dtb__495, dtb__496, dtb__497) -> (B_dData_dList.C_List__x58__x58_ (dtb__495, (v_exprRefNames dtb__496)))
  | Frontend_dAst.C_Expr_ESectOp (dtb__498, dtb__499) -> (B_dData_dList.C_List__x58__x58_ (dtb__498, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Expr_EBacktick (dtb__500, dtb__501, dtb__502, dtb__503) -> (B_dData_dList.C_List__x58__x58_ (dtb__500, ((B_dData_dList.v_append (v_exprRefNames dtb__501)) (v_exprRefNames dtb__502))))
  | Frontend_dAst.C_Expr_EParen (dtb__504, dtb__505) -> (v_exprRefNames dtb__504)
  | Frontend_dAst.C_Expr_EInfix (dtb__506, dtb__507, dtb__508, dtb__509) -> (B_dData_dList.C_List__x58__x58_ (dtb__506, ((B_dData_dList.v_append (v_exprRefNames dtb__507)) (v_exprRefNames dtb__508))))
  | Frontend_dAst.C_Expr_EDo (dtb__510, dtb__511) -> ((B_dData_dList.v_concatMap v_doStmtRefNames) dtb__510)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__512, dtb__513, dtb__514) -> ((B_dData_dList.v_append (v_exprRefNames dtb__512)) ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (v_exprRefNames (B_dData_dPair.v_secondOf f)))) dtb__513))
  | Frontend_dAst.C_Expr_ERecord (dtb__515, dtb__516, dtb__517) -> (B_dData_dList.C_List__x58__x58_ (dtb__515, ((B_dData_dList.v_concatMap (fun (f : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> (v_exprRefNames (B_dData_dPair.v_secondOf f)))) dtb__516)))
  | Frontend_dAst.C_Expr_EField (dtb__518, dtb__519, dtb__520) -> (v_exprRefNames dtb__518)
  | Frontend_dAst.C_Expr_EIf (dtb__521, dtb__522, dtb__523, dtb__524) -> ((B_dData_dList.v_append (v_exprRefNames dtb__521)) ((B_dData_dList.v_append (v_exprRefNames dtb__522)) (v_exprRefNames dtb__523)))
  | Frontend_dAst.C_Expr_ECase (dtb__525, dtb__526, dtb__527) -> ((B_dData_dList.v_append (v_exprRefNames dtb__525)) ((B_dData_dList.v_concatMap v_bindRefNames) dtb__526))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__528, dtb__529) -> ((B_dData_dList.v_concatMap v_clauseRefNames) dtb__528)
  | Frontend_dAst.C_Expr_ELet (dtb__530, dtb__531, dtb__532, dtb__533) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_bindRefNames) dtb__530)) (v_exprRefNames dtb__531))
  | Frontend_dAst.C_Expr_EPi (dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> ((B_dData_dList.v_append (v_exprRefNames dtb__537)) (v_exprRefNames dtb__538))
  | Frontend_dAst.C_Expr_EApp (dtb__540, dtb__541, dtb__542) -> ((B_dData_dList.v_append (v_exprRefNames dtb__540)) ((B_dData_dList.v_concatMap v_exprRefNames) dtb__541))
  | Frontend_dAst.C_Expr_ELam (dtb__543, dtb__544, dtb__545) -> (v_exprRefNames dtb__544)
  | Frontend_dAst.C_Expr_EFloat (dtb__546, dtb__547) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EStr (dtb__548, dtb__549) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EInt (dtb__550, dtb__551) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Expr_EVar (dtb__552, dtb__553) -> (B_dData_dList.C_List__x58__x58_ (dtb__552, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 1211 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNames = (fun (p : (Frontend_dAst.t_Pat, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append (v_patRefNames (B_dData_dPair.v_firstOf p))) (v_exprRefNames (B_dData_dPair.v_secondOf p))))
# 1215 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNames = (fun (p : (Frontend_dAst.t_Pat B_dData_dList.t_List, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_patRefNames) (B_dData_dPair.v_firstOf p))) (v_exprRefNames (B_dData_dPair.v_secondOf p))))
# 1219 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNames = (fun (mc0 : Frontend_dAst.t_DoStmt) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DExpr (dtb__554, dtb__555) -> (v_exprRefNames dtb__554)
  | Frontend_dAst.C_DoStmt_DBind (dtb__556, dtb__557, dtb__558) -> ((B_dData_dList.v_append (v_patRefNames dtb__556)) (v_exprRefNames dtb__557))
  | _ -> failwith "DT: impossible branch"
))
# 1224 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNames = (fun (mc0 : Frontend_dAst.t_InterpPart) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__559) -> (v_exprRefNames dtb__559)
  | Frontend_dAst.C_InterpPart_IPText (dtb__560) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1161 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ctorRefNames = (fun (c : Frontend_dAst.t_Ctor) -> (v_exprRefNames (c).Frontend_dAst.f_Ctor_ctorType))

# 1165 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fieldRefNames = (fun (f : Frontend_dAst.t_Field) -> (v_exprRefNames (f).Frontend_dAst.f_Field_fieldType))

# 1169 "Vuna/Compiler/Loader/Flatten.vuna"
let v_traitMethodRefNames = (fun (m : Frontend_dAst.t_TraitMethod) -> (v_exprRefNames (m).Frontend_dAst.f_TraitMethod_traitMethodType))

# 1146 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_declRefNames = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__561, dtb__562, dtb__563, dtb__564) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_patRefNames) dtb__562)) (v_exprRefNames dtb__563))
  | Frontend_dAst.C_Decl_DExtern (dtb__565, dtb__566, dtb__567, dtb__568) -> (v_exprRefNames dtb__567)
  | Frontend_dAst.C_Decl_DAxiom (dtb__569, dtb__570, dtb__571) -> (v_exprRefNames dtb__570)
  | Frontend_dAst.C_Decl_DSig (dtb__572, dtb__573, dtb__574, dtb__575) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__573)) (v_exprRefNames dtb__574))
  | Frontend_dAst.C_Decl_DInstance (dtb__576, dtb__577, dtb__578, dtb__579) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__576)) ((B_dData_dList.v_append (v_exprRefNames dtb__577)) ((B_dData_dList.v_concatMap v_declRefNames) dtb__578)))
  | Frontend_dAst.C_Decl_DTrait (dtb__580, dtb__581, dtb__582, dtb__583, dtb__584) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__582)) ((B_dData_dList.v_concatMap v_traitMethodRefNames) dtb__583))
  | Frontend_dAst.C_Decl_DRecord (dtb__585, dtb__586, dtb__587, dtb__588, dtb__589, dtb__590, dtb__591, dtb__592) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_fieldRefNames) dtb__587)) dtb__588)
  | Frontend_dAst.C_Decl_DData (dtb__593, dtb__594, dtb__595, dtb__596, dtb__597, dtb__598, dtb__599, dtb__600, dtb__601) -> ((B_dData_dList.v_append (v_exprRefNames dtb__595)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_ctorRefNames) dtb__596)) dtb__597))
  | _ -> failwith "DT: impossible branch"
))

# 979 "Vuna/Compiler/Loader/Flatten.vuna"
let v_interpReferencedInSource = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let names = ((B_dData_dList.v_concatMap v_declRefNames) decls) in (if ((B_dData_dList.v_memName "interp") names) then true else ((B_dData_dList.v_memName Base_dIntrinsics.v_interpMethodName) names))))

# 1119 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declGlobalNames = (fun (d : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_concatMap v_expandGlobalName) (v_declRefNames d)))

# 960 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportWarnings = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (sourceDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (reexports : string B_dData_dList.t_List) -> (let names0 = ((B_dData_dList.v_concatMap v_declGlobalNames) decls) in (let names = (if (v_interpReferencedInSource sourceDecls) then names0 else ((B_dData_dList.v_filter (fun (n : string) -> (n <> Base_dIntrinsics.v_interpMethodName))) names0)) in (let nameSet = (B_dContainer_dHashMap.v_ofNames names) in (let sourceNames = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_concatMap v_declRefNames) sourceDecls)) in (((((((v_unusedImportWarningsGo modules) nameSet) sourceNames) imports) decls) reexports) imports))))))

# 944 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_resolveModulesKeep = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc3 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__602, dtb__603) -> (match dtb__602 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__604; Loader_dModules.f_Module_modulePackageOf = dtb__605; Loader_dModules.f_Module_moduleImportsOf = dtb__606; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__607; Loader_dModules.f_Module_moduleDeclsOf = dtb__608; Loader_dModules.f_Module_moduleExportsOf = dtb__609; Loader_dModules.f_Module_moduleFixitiesOf = dtb__610; Loader_dModules.f_Module_moduleReexportsOf = dtb__611; Loader_dModules.f_Module_moduleOpaqueOf = dtb__612; Loader_dModules.f_Module_moduleExportIndexOf = dtb__613 } -> (if ((B_dData_dList.v_memName dtb__604) mc1) then ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__603)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__604; Loader_dModules.f_Module_modulePackageOf = dtb__605; Loader_dModules.f_Module_moduleImportsOf = dtb__606; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__607; Loader_dModules.f_Module_moduleDeclsOf = dtb__608; Loader_dModules.f_Module_moduleExportsOf = dtb__609; Loader_dModules.f_Module_moduleFixitiesOf = dtb__610; Loader_dModules.f_Module_moduleReexportsOf = dtb__611; Loader_dModules.f_Module_moduleOpaqueOf = dtb__612; Loader_dModules.f_Module_moduleExportIndexOf = dtb__613 }, (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p2) })))) else ((Base_dCommon.v_bind ((Loader_dFixity.v_reorderProgram (Loader_dFixity.v_tableOf mc2)) dtb__608)) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Loader_dExpand.v_expandDecls decls2)) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((((Loader_dResolve.v_resolveProgram (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__604; Loader_dModules.f_Module_modulePackageOf = dtb__605; Loader_dModules.f_Module_moduleImportsOf = dtb__606; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__607; Loader_dModules.f_Module_moduleDeclsOf = decls3; Loader_dModules.f_Module_moduleExportsOf = dtb__609; Loader_dModules.f_Module_moduleFixitiesOf = dtb__610; Loader_dModules.f_Module_moduleReexportsOf = dtb__611; Loader_dModules.f_Module_moduleOpaqueOf = dtb__612; Loader_dModules.f_Module_moduleExportIndexOf = dtb__613 }, dtb__603))) dtb__604) dtb__604) ((Loader_dResolve.v_namespacesOfWith mc0) decls3)) ((B_dData_dList.v_append dtb__606) dtb__607)) decls3)) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_unusedImportWarnings (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__604; Loader_dModules.f_Module_modulePackageOf = dtb__605; Loader_dModules.f_Module_moduleImportsOf = dtb__606; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__607; Loader_dModules.f_Module_moduleDeclsOf = decls3; Loader_dModules.f_Module_moduleExportsOf = dtb__609; Loader_dModules.f_Module_moduleFixitiesOf = dtb__610; Loader_dModules.f_Module_moduleReexportsOf = dtb__611; Loader_dModules.f_Module_moduleOpaqueOf = dtb__612; Loader_dModules.f_Module_moduleExportIndexOf = dtb__613 }, dtb__603))) dtb__606) d1) decls3) dtb__611)) (fun (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__603)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__604; Loader_dModules.f_Module_modulePackageOf = dtb__605; Loader_dModules.f_Module_moduleImportsOf = dtb__606; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__607; Loader_dModules.f_Module_moduleDeclsOf = d1; Loader_dModules.f_Module_moduleExportsOf = dtb__609; Loader_dModules.f_Module_moduleFixitiesOf = dtb__610; Loader_dModules.f_Module_moduleReexportsOf = dtb__611; Loader_dModules.f_Module_moduleOpaqueOf = dtb__612; Loader_dModules.f_Module_moduleExportIndexOf = dtb__613 }, (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append warns) (B_dData_dPair.v_secondOf p2)) })))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 936 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectKeeping = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Loader_dModules.t_Project) -> (match mc2 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__614; Loader_dModules.f_Project_projectEntryImports = dtb__615; Loader_dModules.f_Project_projectImplicitImports = dtb__616; Loader_dModules.f_Project_projectModules = dtb__617; Loader_dModules.f_Project_projectEntryPkg = dtb__618; Loader_dModules.f_Project_projectEntryFixities = dtb__619 } -> (let projectFixities = ((v_dedupeFixitiesOf dtb__617) dtb__619) in ((Base_dCommon.v_bind (Loader_dFixity.v_checkUniqueFixities projectFixities)) (fun (fixes : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Loader_dFixity.v_reorderProgram (Loader_dFixity.v_tableOf fixes)) dtb__614)) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Loader_dExpand.v_expandDecls decls2)) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((Loader_dResolve.v_resolveEntry mc0) dtb__617) dtb__618) ((B_dData_dList.v_append dtb__615) dtb__616)) decls3)) (fun (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_unusedImportWarnings dtb__617) dtb__615) entryDecls) decls3) B_dData_dList.C_List_Nil)) (fun (entryWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) fixes) dtb__617)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append entryWarns) (B_dData_dPair.v_secondOf p2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = entryDecls; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p2) } })))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 928 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProject = (fun (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping false) B_dData_dList.C_List_Nil) project))

# 932 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectWith = (fun (release : bool) (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping release) B_dData_dList.C_List_Nil) project))
