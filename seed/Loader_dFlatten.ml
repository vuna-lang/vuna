open Vuna_runtime
# 62 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseWith = (fun (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match (((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.syntax") "vuna.phase") (fun (_u : int) -> (((Frontend_dParser.v_parseSourceRecoveringTokens path) mode) toks))) with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__0)))
  | Base_dDiag.C_Check_OkC (dtb__1) -> (let parsed = (B_dData_dPair.v_firstOf dtb__1) in (let errs = (B_dData_dPair.v_secondOf dtb__1) in (match errs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (parsed))
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb__3) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode = (fun (nFs : string) (nEnv : string) (nProcess : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) -> (match (((B_dData_dObs_dSpan.v_obsSpan "vuna.parse.lex") "vuna.phase") (fun (_u : int) -> (Frontend_dLexer.v_lexSource src))) with
  | Base_dDiag.C_Check_ErrC (dtb__4) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__4))))
  | Base_dDiag.C_Check_OkC (dtb__5) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_parseWith mode) path) dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath = (fun nFs nEnv nProcess -> ((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmStrict))

# 86 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeFixitiesGo = (fun (mc0 : (string, Frontend_dAst.t_FixityDecl) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (let key = (B_dData_dPair.v_firstOf dtb__6) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (((v_dedupeFixitiesGo dtb__7) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeFixitiesGo dtb__7) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__6), mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixityDeclKey = (fun (d : Frontend_dAst.t_FixityDecl) -> (let sp = (Frontend_dAst.v_fixitySpan d) in (String.concat "" [(d).Frontend_dAst.f_FixityDecl_fixityOp; "|"; (bi_strFromInt (d).Frontend_dAst.f_FixityDecl_fixityLevel); "|"; (bi_strFromInt (d).Frontend_dAst.f_FixityDecl_fixityAssoc); "|"; (Base_dSource.v_spanFile sp); ":"; (bi_strFromInt (Base_dSource.v_spanStartLine sp)); ":"; (bi_strFromInt (Base_dSource.v_spanStartCol sp))])))

# 79 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeFixitiesOf = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (local : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (((v_dedupeFixitiesGo ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = (String.concat "" [(Loader_dModules.v_moduleNameOf m); "|"; (v_fixityDeclKey d)]); B_dData_dPair.f_Pair_second = d })) (Loader_dModules.v_moduleFixitiesOf m)))) modules)) ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = ("|entry|" ^ (v_fixityDeclKey d)); B_dData_dPair.f_Pair_second = d })) local))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 105 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isPrivateName = (fun (name : string) -> ((B_dData_dString.v_startsWith "_") name))

# 108 "Vuna/Compiler/Loader/Flatten.vuna"
let v_privateExportMsg = (fun (prefix : string) (sp : Base_dSource.t_Span) (name : string) -> ((((((Base_dDiag.v_diagAt sp) Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

# 120 "Vuna/Compiler/Loader/Flatten.vuna"
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
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__54; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__55; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__56 } -> (if (dtb__54 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__54)) else ((v_findMethodNamed mc0) dtb__53))
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
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__184, dtb__185, dtb__186) -> (if (if ((v_hasImportOf mc0) dtb__184) then true else ((v_hasImportOf mc2) dtb__184)) then (((v_namespaceImportsGo mc0) dtb__183) mc2) else (((v_namespaceImportsGo mc0) dtb__183) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__184; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = dtb__185; Frontend_dAst.f_Import_importRef = dtb__186 }, mc2))))
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
  | Frontend_dAst.C_ExportItem_XBare (dtb__202, dtb__203) -> ((((((v_exportBare mc0) mc1) mc2) mc3) dtb__202) (Frontend_dAst.v_nodeRefSpan dtb__203))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__204, dtb__205, dtb__206) -> ((Base_dCommon.v_bind ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__204) (Frontend_dAst.v_nodeRefSpan dtb__206))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_filterExportMembers dtb__205) es)))))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__207, dtb__208) -> ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__207) (Frontend_dAst.v_nodeRefSpan dtb__208))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__215, dtb__216) -> (let key = (v_exportEntryKey dtb__215) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (((v_dedupeByFullKey dtb__216) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeByFullKey dtb__216) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ (dtb__215, mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeExportEntries = (fun (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (((v_dedupeByFullKey entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

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
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__221; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__222; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__223; Frontend_dAst.f_ModDecl_modDeclExports = dtb__224; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__225; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__226; Frontend_dAst.f_ModDecl_modDeclRef = dtb__227 } -> (if (dtb__221 = mc0) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__227)) (Base_dDiagnostics_dRn.C_RnErr_ModuleNameMismatch (dtb__221))) dtb__221))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 521 "Vuna/Compiler/Loader/Flatten.vuna"
let v_abstractOpaquePrefix = ":"

# 524 "Vuna/Compiler/Loader/Flatten.vuna"
let v_opaqueBaseName = (fun (name : string) -> (if ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name) then (((dtp_substring (bi_strLength v_abstractOpaquePrefix)) ((bi_strLength name) - (bi_strLength v_abstractOpaquePrefix))) name) else name))

# 534 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isAbstractOpaqueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name))

# 551 "Vuna/Compiler/Loader/Flatten.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 555 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSpecToItem = (fun (mc0 : Frontend_dAst.t_ExportSpec) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__232, dtb__233, dtb__234) -> (match dtb__233 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__235) -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb__232, dtb__235, (Frontend_dAst.v_detachedNodeRef dtb__234)))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (dtb__232, (Frontend_dAst.v_detachedNodeRef dtb__234)))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XBare (dtb__232, (Frontend_dAst.v_detachedNodeRef dtb__234)))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__236, dtb__237) -> (Frontend_dAst.C_ExportItem_XBare (dtb__236, (Frontend_dAst.v_detachedNodeRef dtb__237)))
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Loader/Flatten.vuna"
let v_computeExports = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (extraExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (extraReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (let newItems = ((B_dData_dList.v_append ((B_dData_dList.v_map v_exportSpecToItem) extraExports)) extraReexports) in (let explicit = (((((v_explicitExports modules) prefix) decls) imports) newItems) in (if (v_notEmpty newItems) then (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> explicit
  | B_dData_dMaybe.C_Maybe_Just (dtb__238) -> (match dtb__238 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__239; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__240; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__241; Frontend_dAst.f_ModDecl_modDeclExports = dtb__242; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__243; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__244; Frontend_dAst.f_ModDecl_modDeclRef = dtb__245 } -> (if dtb__240 then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__245)) (Base_dDiagnostics_dRn.C_RnErr_DuplicateExport ("module header"))) "module header") else explicit)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__246) -> (match dtb__246 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__247; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__248; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__249; Frontend_dAst.f_ModDecl_modDeclExports = dtb__250; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__251; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__252; Frontend_dAst.f_ModDecl_modDeclRef = dtb__253 } -> (if dtb__248 then (((((v_explicitExports modules) prefix) decls) imports) dtb__249) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 561 "Vuna/Compiler/Loader/Flatten.vuna"
let v_showCycle = (fun (name : string) (stack : string B_dData_dList.t_List) -> (Base_dSource.v_joinArrows (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (name, stack)))))

# 586 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeDeps = (fun (mc0 : string) (mc1 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> (match dtb__255 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = "Prelude"; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousPrelude ((Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))) (Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 578 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) "Prelude") importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_implicitPreludeDeps importerPkg) ((B_dData_dList.v_filter (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)) <> importerPkg))) allowed)))))))

# 569 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (currentName = "Prelude") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames imports)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))) else (((v_implicitPreludeFrom nFs) roots) importerPkg))))

# 596 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withLayerCheck = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> ((Base_dCommon.v_bind ((Loader_dLayers.v_checkProjectLayers roots) project)) (fun (_u : int) -> (Base_dDiag.C_Check_OkC (project)))))

# 600 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan imp)) = "") then e else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan imp)) e)))

# 627 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsTakeLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__256, dtb__257) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__256, ((v_nsTakeLocal (mc0 - 1)) dtb__257))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 618 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_pathPrefixOf = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dMaybe.C_Maybe_Nothing) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs))) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (if (v_notEmpty (B_dData_dPair.v_firstOf collected)) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs)); B_dData_dPair.f_Pair_second = n }))) else (((((v_pathPrefixOf nFs) roots) importerPkg) segs) (n - 1)))))))

# 631 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsDropLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__258, dtb__259)) else ((v_nsDropLocal (mc0 - 1)) dtb__259))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_loadAll = (fun (nFs : string) (nEnv : string) (nProcess : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "loader")) else (match imports with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (modules)))
  | B_dData_dList.C_List__x58__x58_ (dtb__260, dtb__261) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) dtb__260)) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__262) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__262)))
  | Base_dDiag.C_Check_OkC (dtb__263) -> (((((((((v_loadAll nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) dtb__263) stack) dtb__261)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 635 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadModule = (fun (nFs : string) (nEnv : string) (nProcess : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (let name = (Loader_dModules.v_importName imp) in (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_icFuel "loader")) else (match ((Loader_dModules.v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (if (((Loader_dModules.v_moduleVisibleTo roots) importerPkg) dtb__264) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (modules))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (Loader_dModules.v_modulePackageOf dtb__264)))) name) (Loader_dModules.v_modulePackageOf dtb__264)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) stack) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ImportCycle (((v_showCycle name) stack)))) ((v_showCycle name) stack)))) else (if (Loader_dModules.v_validModuleName name) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Loader_dModules.v_findModuleFile nFs) roots) name) importerPkg) (Frontend_dAst.v_importSpan imp))) (fun foundR -> (match foundR with
  | Base_dDiag.C_Check_ErrC (dtb__265) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__266) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_pathPrefixOf nFs) roots) importerPkg) (Base_dSource.v_splitOnDot name)) ((B_dData_dList.v_length (Base_dSource.v_splitOnDot name)) - 1))) (fun prefixR -> (let nd_uscrut21 = prefixR in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__267) -> (match dtb__267 with
  | { B_dData_dPair.f_Pair_first = dtb__268; B_dData_dPair.f_Pair_second = dtb__269 } -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) { Frontend_dAst.f_Import_importName = dtb__268; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })) (fun modsR -> (match modsR with
  | Base_dDiag.C_Check_ErrC (dtb__270) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__270)))
  | Base_dDiag.C_Check_OkC (dtb__271) -> (match ((Loader_dModules.v_findModule dtb__271) dtb__268) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (match (((Loader_dModules.v_walkNamespaceIndex dtb__271) dtb__268) ((v_nsDropLocal dtb__269) (Base_dSource.v_splitOnDot name))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (((((((((v_loadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) dtb__271) stack) { Frontend_dAst.f_Import_importName = dtb__273; Frontend_dAst.f_Import_importIsQualified = true; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__265)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__274) -> (let path = (B_dData_dPair.v_firstOf dtb__274) in (let root = (B_dData_dPair.v_secondOf dtb__274) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Loader.Flatten") then (((dtp_log_emit 3) "Vuna.Compiler.Loader.Flatten") ("parse-module=" ^ name)) else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_parseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> (let nd_uscrut22 = parsed in (match nd_uscrut22 with
  | Base_dDiag.C_Check_OkC (dtb__275) -> (match dtb__275 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__276; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__277; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__278; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__279; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__280; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__281; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__282 } -> (let imports1 = dtb__277 in (let providers = B_dData_dList.C_List_Nil in (let modules1 = modules in (let imports = ((v_namespaceImportsOf imports1) dtb__281) in (match ((v_validateModuleHeader name) dtb__276) with
  | Base_dDiag.C_Check_ErrC (dtb__283) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__283)))
  | Base_dDiag.C_Check_OkC (dtb__284) -> (match ((Loader_dModules.v_validateImports name) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__285) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__285)))
  | Base_dDiag.C_Check_OkC (dtb__286) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) roots) (Frontend_dPackages_dPkg.v_rootName root)) name) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__287) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__287)))
  | Base_dDiag.C_Check_OkC (dtb__288) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) (fuel - 1)) roots) (Frontend_dPackages_dPkg.v_rootName root)) modules1) (B_dData_dList.C_List__x58__x58_ (name, stack))) ((B_dData_dList.v_append imports) dtb__288))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__289) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__289)))
  | Base_dDiag.C_Check_OkC (dtb__290) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__290) imports) in (match (((((((v_computeExports dtb__290) name) dtb__276) imports2) dtb__279) dtb__280) dtb__281) with
  | Base_dDiag.C_Check_ErrC (dtb__291) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__291)))
  | Base_dDiag.C_Check_OkC (dtb__292) -> (let visible = dtb__278 in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = name; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_rootName root); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__288; Loader_dModules.f_Module_moduleDeclsOf = dtb__279; Loader_dModules.f_Module_moduleExportsOf = dtb__292; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append providers) ((B_dData_dList.v_append ((Loader_dModules.v_reexportedImportNamesOfHeader imports2) dtb__276)) ((Loader_dModules.v_reexportedImportNames imports2) dtb__281))); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf name) dtb__282); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__292) }, dtb__290))))))
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
  | Base_dDiag.C_Check_ErrC (dtb__293) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__293)))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | _ -> failwith "DT: impossible branch"
))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_InvalidModuleName (name))) name)))))
  | _ -> failwith "DT: impossible branch"
))))

# 723 "Vuna/Compiler/Loader/Flatten.vuna"
let v_entryScopeOf = (fun (pkg : string) (path : string) -> (let name = (((B_dData_dList.v_foldl (fun (acc : string) (seg : string) -> seg)) path) ((B_dData_dString.v_split "/") path)) in (if ((B_dData_dString.v_endsWith ".vuna") name) then (((B_dData_dString.v_substring 0) ((B_dData_dNat.v_minus (B_dData_dString.v_byteLength name)) 5)) name) else (if (name = "") then pkg else name))))

# 735 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun text -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_parseFileWithPath nFs) nEnv) nProcess) entry) text)) (fun parsed -> (let nd_uscrut13 = parsed in (match nd_uscrut13 with
  | Base_dDiag.C_Check_OkC (dtb__294) -> (match dtb__294 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__295; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__296; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__297; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__298; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__299; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__300; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__301 } -> (let nd_uscrut23 = dtb__295 in (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let imports1 = dtb__296 in (let preloaded1 = preloaded in (match ((Loader_dModules.v_validateImports "<entry>") imports1) with
  | Base_dDiag.C_Check_ErrC (dtb__302) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__302)))
  | Base_dDiag.C_Check_OkC (dtb__303) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports1)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__304) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__304)))
  | Base_dDiag.C_Check_OkC (dtb__305) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports1) dtb__305))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__306) -> (Base_dDiag.C_Check_ErrC (dtb__306))
  | Base_dDiag.C_Check_OkC (dtb__307) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__307) imports1) in ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__298; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__305; Loader_dModules.f_Project_projectModules = dtb__307; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = dtb__297; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) entry) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__308) -> (match dtb__308 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__309; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__310; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__311; Frontend_dAst.f_ModDecl_modDeclExports = dtb__312; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__313; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__314; Frontend_dAst.f_ModDecl_modDeclRef = dtb__315 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__315))) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntryFile (entry))) entry)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__316) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__316)))
  | _ -> failwith "DT: impossible branch"
)))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_EntryFileNotFound (entry))) entry))))))

# 718 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((((((v_loadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) B_dData_dList.C_List_Nil))

# 777 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (let entryImports = ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_Import_importName = n; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) names) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) entryImports)) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__317) -> (Base_dDiag.C_Check_ErrC (dtb__317))
  | Base_dDiag.C_Check_OkC (dtb__318) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb__318; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) })
  | _ -> failwith "DT: impossible branch"
))))))

# 774 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((((((v_loadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) B_dData_dList.C_List_Nil))

# 796 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSourceWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (let nd_uscrut12 = parsed in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__319) -> (match dtb__319 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__320; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__321; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__322; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__323; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__324; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__325; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__326 } -> (let nd_uscrut22 = dtb__320 in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let imports1 = dtb__321 in (let preloaded1 = preloaded in (match ((Loader_dModules.v_validateImports "<entry>") imports1) with
  | Base_dDiag.C_Check_ErrC (dtb__327) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__327)))
  | Base_dDiag.C_Check_OkC (dtb__328) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports1)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__329) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__329)))
  | Base_dDiag.C_Check_OkC (dtb__330) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports1) dtb__330))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__331) -> (Base_dDiag.C_Check_ErrC (dtb__331))
  | Base_dDiag.C_Check_OkC (dtb__332) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__332) imports1) in ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__323; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__330; Loader_dModules.f_Project_projectModules = dtb__332; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = dtb__322; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) label) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__333) -> (match dtb__333 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__334; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__335; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__336; Frontend_dAst.f_ModDecl_modDeclExports = dtb__337; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__338; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__339; Frontend_dAst.f_ModDecl_modDeclRef = dtb__340 } -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntrySource (label))) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__341) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__341)))
  | _ -> failwith "DT: impossible branch"
)))))

# 792 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((((v_loadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) B_dData_dList.C_List_Nil))

# 837 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSourceWithPreloaded = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (let nd_uscrut12 = parsed in (match nd_uscrut12 with
  | Base_dDiag.C_Check_OkC (dtb__342) -> (match dtb__342 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__343; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__344; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__345; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__346; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__347; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__348; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__349 } -> (let nd_uscrut22 = dtb__343 in (match nd_uscrut22 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__350) -> (match dtb__350 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__351; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__352; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__353; Frontend_dAst.f_ModDecl_modDeclExports = dtb__354; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__355; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__356; Frontend_dAst.f_ModDecl_modDeclRef = dtb__357 } -> (let imports1 = dtb__344 in (let providers = B_dData_dList.C_List_Nil in (let preloaded1 = preloaded in (let imports = ((v_namespaceImportsOf imports1) dtb__348) in (match ((Loader_dModules.v_validateImports dtb__351) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__358) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__358)))
  | Base_dDiag.C_Check_OkC (dtb__359) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__351) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__360) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__360)))
  | Base_dDiag.C_Check_OkC (dtb__361) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__361))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__362) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__362)))
  | Base_dDiag.C_Check_OkC (dtb__363) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__363) imports) in (match (((((((v_computeExports dtb__363) dtb__351) dtb__343) imports2) dtb__346) dtb__347) dtb__348) with
  | Base_dDiag.C_Check_ErrC (dtb__364) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__364)))
  | Base_dDiag.C_Check_OkC (dtb__365) -> (let visible = dtb__345 in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__361; Loader_dModules.f_Project_projectModules = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__351; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__361; Loader_dModules.f_Module_moduleDeclsOf = dtb__346; Loader_dModules.f_Module_moduleExportsOf = dtb__365; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append providers) ((Loader_dModules.v_reexportedImportNames imports2) ((B_dData_dList.v_append dtb__353) dtb__348))); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb__351) dtb__349); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__365) }, dtb__363)); Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx) })))
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
  | Base_dDiag.C_Check_ErrC (dtb__366) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__366)))
  | _ -> failwith "DT: impossible branch"
)))))

# 833 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((((v_loadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) B_dData_dList.C_List_Nil))

# 895 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesFromParsed = (fun (nFs : string) (nEnv : string) (nProcess : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : Frontend_dAst.t_SourceFile) -> (match mc3 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__367; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__368; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__369; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__370; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__371; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__372; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__373 } -> (let imports1 = dtb__368 in (let modules1 = mc1 in (let imports = ((v_namespaceImportsOf imports1) dtb__372) in (let nd_uscrut21 = dtb__367 in (match nd_uscrut21 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (match dtb__374 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__375; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__376; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__377; Frontend_dAst.f_ModDecl_modDeclExports = dtb__378; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__379; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__380; Frontend_dAst.f_ModDecl_modDeclRef = dtb__381 } -> (match ((Loader_dModules.v_validateImports dtb__375) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__382) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__382)))
  | Base_dDiag.C_Check_OkC (dtb__383) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) dtb__375) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__384) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__384)))
  | Base_dDiag.C_Check_OkC (dtb__385) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) modules1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__385))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__386) -> (Base_dDiag.C_Check_ErrC (dtb__386))
  | Base_dDiag.C_Check_OkC (dtb__387) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__387; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb__387) dtb__369) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports mc2) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__388) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__388)))
  | Base_dDiag.C_Check_OkC (dtb__389) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) "") imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__390) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__390)))
  | Base_dDiag.C_Check_OkC (dtb__391) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((v_loadAll nFs) nEnv) nProcess) 1048576) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) modules1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__391))) (fun modulesR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__392) -> (Base_dDiag.C_Check_ErrC (dtb__392))
  | Base_dDiag.C_Check_OkC (dtb__393) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__393; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb__393) dtb__369) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 883 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules0 : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((v_parseFileWithPathMode nFs) nEnv) nProcess) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__394) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__394)))
  | Base_dDiag.C_Check_OkC (dtb__395) -> (((((((v_fixitiesFromParsed nFs) nEnv) nProcess) ctx) modules0) label) dtb__395)
  | _ -> failwith "DT: impossible branch"
))))

# 936 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_fixitiesForSourceIn nFs) nEnv) nProcess) ctx) B_dData_dList.C_List_Nil) label) source)) (fun pairR -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match pairR with
  | Base_dDiag.C_Check_ErrC (dtb__396) -> (Base_dDiag.C_Check_ErrC (dtb__396))
  | Base_dDiag.C_Check_OkC (dtb__397) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb__397)))
  | _ -> failwith "DT: impossible branch"
)))))

# 1065 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_fixityOpsOf = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__398, dtb__399) -> (B_dData_dList.C_List__x58__x58_ ((dtb__398).Frontend_dAst.f_FixityDecl_fixityOp, (v_fixityOpsOf dtb__399)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Loader/Flatten.vuna"
let v_visibleFixityOps = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__400) -> (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__400))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) imports))

# 1082 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameSuffixIn = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__401, dtb__402) -> (if (if (dtb__401 = mc0) then true else ((B_dData_dString.v_endsWith ("." ^ mc0)) dtb__401)) then true else ((v_anyNameSuffixIn mc0) dtb__402))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1077 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyOpDeclared = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__403, dtb__404) -> (if ((v_anyNameSuffixIn dtb__403) mc1) then true else ((v_anyOpDeclared dtb__404) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1102 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_traitMethodNames = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__405, dtb__406) -> (B_dData_dList.C_List__x58__x58_ ((dtb__405).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb__406)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1092 "Vuna/Compiler/Loader/Flatten.vuna"
let v_definedNamesOfDecl = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__407, dtb__408, dtb__409, dtb__410) -> (B_dData_dList.C_List__x58__x58_ (dtb__407, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb__411, dtb__412, dtb__413, dtb__414) -> (B_dData_dList.C_List__x58__x58_ (dtb__411, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__415, dtb__416, dtb__417) -> (B_dData_dList.C_List__x58__x58_ (dtb__415, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__418, dtb__419, dtb__420, dtb__421) -> (B_dData_dList.C_List__x58__x58_ (dtb__418, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb__422, dtb__423, dtb__424, dtb__425) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DTrait (dtb__426, dtb__427, dtb__428, dtb__429, dtb__430) -> (B_dData_dList.C_List__x58__x58_ (dtb__426, (v_traitMethodNames dtb__429)))
  | Frontend_dAst.C_Decl_DRecord (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436, dtb__437, dtb__438) -> (B_dData_dList.C_List__x58__x58_ (dtb__431, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DData (dtb__439, dtb__440, dtb__441, dtb__442, dtb__443, dtb__444, dtb__445, dtb__446, dtb__447) -> (B_dData_dList.C_List__x58__x58_ (dtb__439, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1088 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_definedNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__448, dtb__449) -> ((B_dData_dList.v_append (v_definedNamesOfDecl dtb__448)) (v_definedNamesOf dtb__449))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1071 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesDeclaredFixity = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__450) -> ((v_anyOpDeclared (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__450))) (v_definedNamesOf decls))
  | _ -> failwith "DT: impossible branch"
))

# 1106 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__451, dtb__452) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__451) mc0) then true else ((v_anyNameIn mc0) dtb__452))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1059 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesUsedFixity = (fun (sourceNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__453) -> ((v_anyNameIn sourceNames) (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__453)))
  | _ -> failwith "DT: impossible branch"
))

# 1118 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyInstanceDecl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__454, dtb__455) -> (match dtb__454 with
  | Frontend_dAst.C_Decl_DInstance (dtb__456, dtb__457, dtb__458, dtb__459) -> true
  | _ -> (v_anyInstanceDecl dtb__455)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1112 "Vuna/Compiler/Loader/Flatten.vuna"
let v_moduleDeclaresInstance = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Loader_dModules.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__460) -> (v_anyInstanceDecl (Loader_dModules.v_moduleDeclsOf dtb__460))
  | _ -> failwith "DT: impossible branch"
))

# 1139 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importStartsLine = (fun (imp : Frontend_dAst.t_Import) -> ((Base_dSource.v_spanStartCol (Frontend_dAst.v_importSpan imp)) = 1))

# 1142 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyImportOnLine = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Import) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__461, dtb__462) -> (if ((Base_dSource.v_spanStartOffset (Frontend_dAst.v_importSpan dtb__461)) = (Base_dSource.v_spanStartOffset (Frontend_dAst.v_importSpan mc1))) then ((v_anyImportOnLine dtb__462) mc1) else (if ((Base_dSource.v_spanStartLine (Frontend_dAst.v_importSpan dtb__461)) = (Base_dSource.v_spanStartLine (Frontend_dAst.v_importSpan mc1))) then true else ((v_anyImportOnLine dtb__462) mc1)))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1152 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyDeclOnLine = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__463, dtb__464) -> (if ((Base_dSource.v_spanStartLine (Frontend_dAst.v_declSpan dtb__463)) = mc1) then true else ((v_anyDeclOnLine dtb__464) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1133 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importOwnsLine = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (if (if (v_importStartsLine imp) then (B_dData_dBool.v_not ((v_anyImportOnLine imports) imp)) else false) then (B_dData_dBool.v_not ((v_anyDeclOnLine decls) (Base_dSource.v_spanStartLine (Frontend_dAst.v_importSpan imp)))) else false))

# 1158 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalSpan = (fun (sp : Base_dSource.t_Span) -> { Base_dSource.f_Span_spanFile = (Base_dSource.v_spanFile sp); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_spanStartLine sp); Base_dSource.f_Span_spanStartCol = 1; Base_dSource.f_Span_spanEndLine = ((Base_dSource.v_spanStartLine sp) + 1); Base_dSource.f_Span_spanEndCol = 1; Base_dSource.f_Span_spanStartOffset = ((Base_dSource.v_spanStartOffset sp) - ((Base_dSource.v_spanStartCol sp) - 1)); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_spanStartOffset sp) - ((Base_dSource.v_spanStartCol sp) - 1)) })

# 1125 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalEdits = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (if (((v_importOwnsLine imports) decls) imp) then (B_dData_dList.C_List__x58__x58_ ({ Base_dDiag.f_DiagEdit_editSpan = (v_importRemovalSpan (Frontend_dAst.v_importSpan imp)); Base_dDiag.f_DiagEdit_editNewText = "" }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))

# 1046 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportDiag = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (let d = (((Base_dDiagnostics_dWarning.v_warnDiagAt (Frontend_dAst.v_importSpan imp)) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedImport ((imp).Frontend_dAst.f_Import_importName))) (B_dData_dVec.C_Vec_VCons ((imp).Frontend_dAst.f_Import_importName, B_dData_dVec.C_Vec_Nil))) in (match (((v_importRemovalEdits imports) decls) imp) with
  | B_dData_dList.C_List_Nil -> d
  | dtb__465 -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = ("remove unused import " ^ (imp).Frontend_dAst.f_Import_importName); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = dtb__465 }) d)
)))

# 1178 "Vuna/Compiler/Loader/Flatten.vuna"
let v_expandGlobalName = (fun (n : string) -> (if (Frontend_dReserved.v_isOverCtorName n) then (Frontend_dReserved.v_overCtorTargets n) else (match (Frontend_dReserved.v_doSyntaxCanonical n) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__466) -> (B_dData_dList.C_List__x58__x58_ (dtb__466, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 1188 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTargetOf = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 1192 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyTargetIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__467, dtb__468) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__467) mc0) then true else ((v_anyTargetIn mc0) dtb__468))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1034 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_unusedImportWarningsGo = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc5 : string B_dData_dList.t_List) (mc6 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__469, dtb__470) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) (Loader_dModules.v_importName dtb__469))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let used = (if (if (if (if ((B_dData_dList.v_memName (Loader_dModules.v_importName dtb__469)) mc5) then true else ((v_anyTargetIn mc1) ((B_dData_dList.v_map v_exportTargetOf) es))) then true else (((v_importProvidesUsedFixity mc2) mc0) dtb__469)) then true else (((v_importProvidesDeclaredFixity mc4) mc0) dtb__469)) then true else ((v_moduleDeclaresInstance mc0) dtb__469)) in ((Base_dCommon.v_bind (((((((v_unusedImportWarningsGo mc0) mc1) mc2) mc3) mc4) mc5) dtb__470)) (fun (more : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if used then more else (B_dData_dList.C_List__x58__x58_ ((((v_unusedImportDiag mc3) mc4) dtb__469), more))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1228 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_patRefNamesGo = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__471, dtb__472, dtb__473) -> ((v_fieldPatsGo dtb__472) (B_dData_dList.C_List__x58__x58_ (dtb__471, mc1)))
  | Frontend_dAst.C_Pat_PStr (dtb__474, dtb__475) -> mc1
  | Frontend_dAst.C_Pat_PInt (dtb__476, dtb__477) -> mc1
  | Frontend_dAst.C_Pat_PCon (dtb__478, dtb__479, dtb__480) -> ((v_patRefNamesListGo dtb__479) (B_dData_dList.C_List__x58__x58_ (dtb__478, mc1)))
  | Frontend_dAst.C_Pat_PWild (dtb__481) -> mc1
  | Frontend_dAst.C_Pat_PAs (dtb__482, dtb__483, dtb__484) -> ((v_patRefNamesGo dtb__483) mc1)
  | Frontend_dAst.C_Pat_PVar (dtb__485, dtb__486) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1237 "Vuna/Compiler/Loader/Flatten.vuna"
and v_patRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__487, dtb__488) -> ((v_patRefNamesListGo dtb__488) ((v_patRefNamesGo dtb__487) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1241 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldPatsGo = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__489, dtb__490) -> ((v_fieldPatsGo dtb__490) ((v_patRefNamesGo (B_dData_dPair.v_secondOf dtb__489)) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1225 "Vuna/Compiler/Loader/Flatten.vuna"
let v_patRefNames = (fun (p : Frontend_dAst.t_Pat) -> ((v_patRefNamesGo p) B_dData_dList.C_List_Nil))

# 1252 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exprRefNamesGo = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInterp (dtb__491, dtb__492, dtb__493) -> ((v_interpPartRefNamesListGo dtb__492) mc1)
  | Frontend_dAst.C_Expr_EAnn (dtb__494, dtb__495, dtb__496) -> ((v_exprRefNamesGo dtb__494) ((v_exprRefNamesGo dtb__495) mc1))
  | Frontend_dAst.C_Expr_ESectR (dtb__497, dtb__498, dtb__499) -> (B_dData_dList.C_List__x58__x58_ (dtb__498, ((v_exprRefNamesGo dtb__497) mc1)))
  | Frontend_dAst.C_Expr_ESectL (dtb__500, dtb__501, dtb__502) -> (B_dData_dList.C_List__x58__x58_ (dtb__500, ((v_exprRefNamesGo dtb__501) mc1)))
  | Frontend_dAst.C_Expr_ESectOp (dtb__503, dtb__504) -> (B_dData_dList.C_List__x58__x58_ (dtb__503, mc1))
  | Frontend_dAst.C_Expr_EBacktick (dtb__505, dtb__506, dtb__507, dtb__508) -> ((v_exprRefNamesGo dtb__506) ((v_exprRefNamesGo dtb__507) (B_dData_dList.C_List__x58__x58_ (dtb__505, mc1))))
  | Frontend_dAst.C_Expr_EParen (dtb__509, dtb__510) -> ((v_exprRefNamesGo dtb__509) mc1)
  | Frontend_dAst.C_Expr_EInfix (dtb__511, dtb__512, dtb__513, dtb__514) -> ((v_exprRefNamesGo dtb__512) ((v_exprRefNamesGo dtb__513) (B_dData_dList.C_List__x58__x58_ (dtb__511, mc1))))
  | Frontend_dAst.C_Expr_EDo (dtb__515, dtb__516) -> ((v_doStmtRefNamesListGo dtb__515) mc1)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__517, dtb__518, dtb__519) -> ((v_exprRefNamesGo dtb__517) ((v_fieldExprsGo dtb__518) mc1))
  | Frontend_dAst.C_Expr_ERecord (dtb__520, dtb__521, dtb__522) -> ((v_fieldExprsGo dtb__521) (B_dData_dList.C_List__x58__x58_ (dtb__520, mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__523, dtb__524, dtb__525) -> ((v_exprRefNamesGo dtb__523) mc1)
  | Frontend_dAst.C_Expr_EIf (dtb__526, dtb__527, dtb__528, dtb__529) -> ((v_exprRefNamesGo dtb__526) ((v_exprRefNamesGo dtb__527) ((v_exprRefNamesGo dtb__528) mc1)))
  | Frontend_dAst.C_Expr_ECase (dtb__530, dtb__531, dtb__532) -> ((v_exprRefNamesGo dtb__530) ((v_altRefNamesListGo dtb__531) mc1))
  | Frontend_dAst.C_Expr_ELocalFun (dtb__533, dtb__534) -> ((v_clauseRefNamesListGo dtb__533) mc1)
  | Frontend_dAst.C_Expr_ELet (dtb__535, dtb__536, dtb__537, dtb__538) -> ((v_exprRefNamesGo dtb__536) ((v_bindRefNamesListGo dtb__535) mc1))
  | Frontend_dAst.C_Expr_EPi (dtb__539, dtb__540, dtb__541, dtb__542, dtb__543, dtb__544) -> ((v_exprRefNamesGo dtb__542) ((v_exprRefNamesGo dtb__543) mc1))
  | Frontend_dAst.C_Expr_EApp (dtb__545, dtb__546, dtb__547) -> ((v_exprRefNamesGo dtb__545) ((v_exprRefNamesListGo dtb__546) mc1))
  | Frontend_dAst.C_Expr_ELam (dtb__548, dtb__549, dtb__550) -> ((v_exprRefNamesGo dtb__549) mc1)
  | Frontend_dAst.C_Expr_EFloat (dtb__551, dtb__552) -> mc1
  | Frontend_dAst.C_Expr_EStr (dtb__553, dtb__554) -> mc1
  | Frontend_dAst.C_Expr_EInt (dtb__555, dtb__556) -> mc1
  | Frontend_dAst.C_Expr_EVar (dtb__557, dtb__558) -> (B_dData_dList.C_List__x58__x58_ (dtb__557, mc1))
  | _ -> failwith "DT: impossible branch"
))
# 1277 "Vuna/Compiler/Loader/Flatten.vuna"
and v_exprRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__559, dtb__560) -> ((v_exprRefNamesListGo dtb__560) ((v_exprRefNamesGo dtb__559) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1281 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldExprsGo = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__561, dtb__562) -> ((v_fieldExprsGo dtb__562) ((v_exprRefNamesGo (B_dData_dPair.v_secondOf dtb__561)) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1286 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesGo = (fun (b : Frontend_dAst.t_Binding) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesGo (b).Frontend_dAst.f_Binding_bindPat) ((v_exprRefNamesGo (b).Frontend_dAst.f_Binding_bindValue) ((v_bindingSigRefNames (b).Frontend_dAst.f_Binding_bindSig) acc))))
# 1291 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingSigRefNames = (fun (mc0 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__563) -> ((v_exprRefNamesGo (dtb__563).Frontend_dAst.f_BindingSig_sigType) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1295 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__564, dtb__565) -> ((v_bindRefNamesListGo dtb__565) ((v_bindRefNamesGo dtb__564) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1300 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesGo = (fun (alt : Frontend_dAst.t_Alt) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesGo (alt).Frontend_dAst.f_Alt_altPat) ((v_exprRefNamesGo (alt).Frontend_dAst.f_Alt_altBody) acc)))
# 1303 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__566, dtb__567) -> ((v_altRefNamesListGo dtb__567) ((v_altRefNamesGo dtb__566) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1308 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesGo = (fun (clause : Frontend_dAst.t_LocalClause) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesListGo (clause).Frontend_dAst.f_LocalClause_lcPats) ((v_exprRefNamesGo (clause).Frontend_dAst.f_LocalClause_lcBody) acc)))
# 1311 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesListGo = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__568, dtb__569) -> ((v_clauseRefNamesListGo dtb__569) ((v_clauseRefNamesGo dtb__568) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1316 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesGo = (fun (mc0 : Frontend_dAst.t_DoStmt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__570, dtb__571) -> ((v_bindRefNamesListGo dtb__570) mc1)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__572, dtb__573) -> ((v_exprRefNamesGo dtb__572) mc1)
  | Frontend_dAst.C_DoStmt_DBind (dtb__574, dtb__575, dtb__576) -> ((v_patRefNamesGo dtb__574) ((v_exprRefNamesGo dtb__575) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 1321 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesListGo = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__577, dtb__578) -> ((v_doStmtRefNamesListGo dtb__578) ((v_doStmtRefNamesGo dtb__577) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1326 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesGo = (fun (mc0 : Frontend_dAst.t_InterpPart) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__579) -> ((v_exprRefNamesGo dtb__579) mc1)
  | Frontend_dAst.C_InterpPart_IPText (dtb__580) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1330 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesListGo = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__581, dtb__582) -> ((v_interpPartRefNamesListGo dtb__582) ((v_interpPartRefNamesGo dtb__581) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1249 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exprRefNames = (fun (e : Frontend_dAst.t_Expr) -> ((v_exprRefNamesGo e) B_dData_dList.C_List_Nil))

# 1213 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ctorRefNames = (fun (c : Frontend_dAst.t_Ctor) -> (v_exprRefNames (c).Frontend_dAst.f_Ctor_ctorType))

# 1217 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fieldRefNames = (fun (f : Frontend_dAst.t_Field) -> (v_exprRefNames (f).Frontend_dAst.f_Field_fieldType))

# 1221 "Vuna/Compiler/Loader/Flatten.vuna"
let v_traitMethodRefNames = (fun (m : Frontend_dAst.t_TraitMethod) -> (v_exprRefNames (m).Frontend_dAst.f_TraitMethod_traitMethodType))

# 1198 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_declRefNames = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__583, dtb__584, dtb__585, dtb__586) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_patRefNames) dtb__584)) (v_exprRefNames dtb__585))
  | Frontend_dAst.C_Decl_DExtern (dtb__587, dtb__588, dtb__589, dtb__590) -> (v_exprRefNames dtb__589)
  | Frontend_dAst.C_Decl_DAxiom (dtb__591, dtb__592, dtb__593) -> (v_exprRefNames dtb__592)
  | Frontend_dAst.C_Decl_DSig (dtb__594, dtb__595, dtb__596, dtb__597) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__595)) (v_exprRefNames dtb__596))
  | Frontend_dAst.C_Decl_DInstance (dtb__598, dtb__599, dtb__600, dtb__601) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__598)) ((B_dData_dList.v_append (v_exprRefNames dtb__599)) ((B_dData_dList.v_concatMap v_declRefNames) dtb__600)))
  | Frontend_dAst.C_Decl_DTrait (dtb__602, dtb__603, dtb__604, dtb__605, dtb__606) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__604)) ((B_dData_dList.v_concatMap v_traitMethodRefNames) dtb__605))
  | Frontend_dAst.C_Decl_DRecord (dtb__607, dtb__608, dtb__609, dtb__610, dtb__611, dtb__612, dtb__613, dtb__614) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_fieldRefNames) dtb__609)) dtb__610)
  | Frontend_dAst.C_Decl_DData (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619, dtb__620, dtb__621, dtb__622, dtb__623) -> ((B_dData_dList.v_append (v_exprRefNames dtb__617)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_ctorRefNames) dtb__618)) dtb__619))
  | _ -> failwith "DT: impossible branch"
))

# 1171 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declGlobalNames = (fun (d : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_concatMap v_expandGlobalName) (v_declRefNames d)))

# 996 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportWarnings = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (sourceDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (reexports : string B_dData_dList.t_List) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.names") (fun (_u : int) -> (let sourceRefs = ((B_dData_dList.v_concatMap v_declRefNames) sourceDecls) in (let interpRef = (if ((B_dData_dList.v_memName "interp") sourceRefs) then true else ((B_dData_dList.v_memName Base_dIntrinsics.v_interpMethodName) sourceRefs)) in (let names0 = ((B_dData_dList.v_concatMap v_declGlobalNames) decls) in (let names = (if interpRef then names0 else ((B_dData_dList.v_filter (fun (n : string) -> (n <> Base_dIntrinsics.v_interpMethodName))) names0)) in (let nameSet = (B_dContainer_dHashMap.v_ofNames names) in (let fixitySet = (B_dContainer_dHashMap.v_ofNames ((v_visibleFixityOps modules) imports)) in ((Base_dObs.v_obsCheck "vuna.resolve.warn.sources") (fun (_u : int) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.imports") (fun (_u : int) -> (let sourceNames = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_filter (fun (n : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) fixitySet))) sourceRefs)) in (((((((v_unusedImportWarningsGo modules) nameSet) sourceNames) imports) decls) reexports) imports)))))))))))))))

# 982 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveModuleGo = (fun (release : bool) (m : Loader_dModules.t_Module) (rest : Loader_dModules.t_Module B_dData_dList.t_List) (declsR : Frontend_dAst.t_Decl B_dData_dList.t_List Base_dDiag.t_Check) -> ((Base_dCommon.v_bind declsR) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let modules2 = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = decls3; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf }, rest)) in (let ns = ((Base_dObs.v_obsPure "vuna.resolve.ns") (fun (_u : int) -> (((Loader_dResolve.v_namespacesOfWith release) modules2) decls3))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.module") (fun (_u : int) -> ((((((Loader_dResolve.v_resolveProgram modules2) (Loader_dModules.v_moduleNameOf m)) (Loader_dModules.v_moduleNameOf m)) ns) (Loader_dModules.v_moduleAllImportsOf m)) decls3)))) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings modules2) (m).Loader_dModules.f_Module_moduleImportsOf) d1) decls3) (Loader_dModules.v_moduleReexportsOf m))))) (fun (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = d1; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf }; B_dData_dPair.f_Pair_second = warns })))))))))))

# 968 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_resolveModulesKeep = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc3 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__624, dtb__625) -> (if ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__624)) mc1) then ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__625)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__624, (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p2) })))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram (Loader_dFixity.v_tableOf mc2)) (Loader_dModules.v_moduleDeclsOf dtb__624))))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModuleGo mc0) dtb__624) dtb__625) ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls (Loader_dModules.v_moduleNameOf dtb__624)) decls2))))) (fun (p : (Loader_dModules.t_Module, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__625)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dPair.v_secondOf p2)) })))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 960 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectKeeping = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Loader_dModules.t_Project) -> (match mc2 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__626; Loader_dModules.f_Project_projectEntryImports = dtb__627; Loader_dModules.f_Project_projectImplicitImports = dtb__628; Loader_dModules.f_Project_projectModules = dtb__629; Loader_dModules.f_Project_projectEntryPkg = dtb__630; Loader_dModules.f_Project_projectEntryFixities = dtb__631; Loader_dModules.f_Project_projectEntryName = dtb__632 } -> (let projectFixities = ((v_dedupeFixitiesOf dtb__629) dtb__631) in ((Base_dCommon.v_bind (Loader_dFixity.v_checkUniqueFixities projectFixities)) (fun (fixes : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram (Loader_dFixity.v_tableOf fixes)) dtb__626)))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls dtb__632) decls2)))) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.entry") (fun (_u : int) -> (((((Loader_dResolve.v_resolveEntry mc0) dtb__629) dtb__630) ((B_dData_dList.v_append dtb__627) dtb__628)) decls3)))) (fun (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings dtb__629) dtb__627) entryDecls) decls3) B_dData_dList.C_List_Nil)))) (fun (entryWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) fixes) dtb__629)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append entryWarns) (B_dData_dPair.v_secondOf p2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = entryDecls; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p2) } })))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProject = (fun (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping false) B_dData_dList.C_List_Nil) project))

# 952 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectWith = (fun (release : bool) (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping release) B_dData_dList.C_List_Nil) project))
