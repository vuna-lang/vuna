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
  | Base_dDiag.C_Check_ErrC (dtb__4) -> (let x = (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__4))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__5) -> (let x = ((((v_parseWith mode) path) src) dtb__5) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
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

# 154 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_kindEndsInType = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EVar (dtb__50, dtb__51) -> (if (dtb__50 = "Type") then true else false)
  | Frontend_dAst.C_Expr_EApp (dtb__52, dtb__53, dtb__54) -> (match dtb__52 with
  | Frontend_dAst.C_Expr_EVar (dtb__55, dtb__56) -> (if (dtb__55 = "->") then (match dtb__53 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (match dtb__58 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (match dtb__60 with
  | B_dData_dList.C_List_Nil -> (v_kindEndsInType dtb__59)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
) else false)
  | _ -> false
)
  | Frontend_dAst.C_Expr_EPi (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (v_kindEndsInType dtb__65)
  | _ -> false
))

# 146 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_typeKindAxiom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | Frontend_dAst.C_Decl_DAxiom (dtb__69, dtb__70, dtb__71) -> (if (dtb__69 = mc0) then (v_kindEndsInType dtb__70) else ((v_typeKindAxiom mc0) dtb__68))
  | _ -> ((v_typeKindAxiom mc0) dtb__68)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if ((Frontend_dAst.v_ctorName dtb__72) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_ctorName dtb__72))) else ((v_findCtorNamed mc0) dtb__73))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findMethodNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__76; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__77; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__78 } -> (if (dtb__76 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__76)) else ((v_findMethodNamed mc0) dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnCtorNames = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__79 with
  | Frontend_dAst.C_Decl_DData (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (c : Frontend_dAst.t_Ctor) -> { B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_ctorName c) })) ((B_dData_dList.v_filter (fun (c : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName c) = mc0))) dtb__84))) ((v_findOwnCtorNames mc0) dtb__80))
  | Frontend_dAst.C_Decl_DRecord (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (if (dtb__90 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__90; B_dData_dPair.f_Pair_second = dtb__90 }, ((v_findOwnCtorNames mc0) dtb__80))) else ((v_findOwnCtorNames mc0) dtb__80))
  | Frontend_dAst.C_Decl_DTrait (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (m : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_traitMethodName m) })) ((B_dData_dList.v_filter (fun (m : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName m) = mc0))) dtb__101))) ((v_findOwnCtorNames mc0) dtb__80))
  | _ -> ((v_findOwnCtorNames mc0) dtb__80)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__103; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__103); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownCtorEntries mc0) mc1) dtb__104)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownDataCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__105; Loader_dModules.f_ExportEntry_target = (((Loader_dModules.v_ctorCanonical mc0) mc1) dtb__105); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownDataCtorEntries mc0) mc1) dtb__106)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownSelectorEntries = (fun (prefix : string) (all : Frontend_dAst.t_Decl B_dData_dList.t_List) (dname : string) -> ((B_dData_dList.v_map (fun (f : string) -> { Loader_dModules.f_ExportEntry_kind = "val"; Loader_dModules.f_ExportEntry_public = f; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle prefix) f); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle prefix) dname) })) ((Loader_dSelectors.v_selectedFieldNames all) dname)))

# 210 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownTypeEntries = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : string) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | Frontend_dAst.C_Decl_DData (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116, dtb__117) -> (if (dtb__109 = mc3) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__109; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc1) dtb__109); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownDataCtorEntries mc1) dtb__109) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) dtb__112)))))) else ((((v_ownTypeEntries mc0) mc1) dtb__108) mc3))
  | Frontend_dAst.C_Decl_DRecord (dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (if (dtb__118 = mc3) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__118; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc1) dtb__118); Loader_dModules.f_ExportEntry_parent = "" }, ((B_dData_dList.v_append (((v_ownCtorEntries mc1) dtb__118) (B_dData_dList.C_List__x58__x58_ (dtb__118, B_dData_dList.C_List_Nil)))) (((v_ownSelectorEntries mc1) mc0) dtb__118)))))) else ((((v_ownTypeEntries mc0) mc1) dtb__108) mc3))
  | Frontend_dAst.C_Decl_DTrait (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> (if (dtb__126 = mc3) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__126; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc1) dtb__126); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownCtorEntries mc1) dtb__126) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb__129)))))) else ((((v_ownTypeEntries mc0) mc1) dtb__108) mc3))
  | _ -> ((((v_ownTypeEntries mc0) mc1) dtb__108) mc3)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ctorEntriesOfType = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (if (if (if ((dtb__131).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((dtb__131).Loader_dModules.f_ExportEntry_kind = "val")) then ((dtb__131).Loader_dModules.f_ExportEntry_parent = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__131, ((v_ctorEntriesOfType mc0) dtb__132))) else ((v_ctorEntriesOfType mc0) dtb__132))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_isRecordDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match dtb__133 with
  | Frontend_dAst.C_Decl_DRecord (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (if (dtb__135 = mc0) then true else ((v_isRecordDecl mc0) dtb__134))
  | _ -> ((v_isRecordDecl mc0) dtb__134)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isRecordTarget = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prefix : string) (target : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot target)) with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (let m = (Base_dSource.v_joinDots dtb__143) in (if (m = prefix) then ((v_isRecordDecl dtb__144) decls) else (let nd_uscrut9 = ((Loader_dModules.v_findModule modules) m) in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> (match dtb__145 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb__146; Loader_dModules.f_Module_modulePackageOf = dtb__147; Loader_dModules.f_Module_moduleImportsOf = dtb__148; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__149; Loader_dModules.f_Module_moduleDeclsOf = dtb__150; Loader_dModules.f_Module_moduleExportsOf = dtb__151; Loader_dModules.f_Module_moduleFixitiesOf = dtb__152; Loader_dModules.f_Module_moduleReexportsOf = dtb__153; Loader_dModules.f_Module_moduleOpaqueOf = dtb__154; Loader_dModules.f_Module_moduleExportIndexOf = dtb__155; Loader_dModules.f_Module_moduleFixFactsOf = dtb__156 } -> ((v_isRecordDecl dtb__144) dtb__150)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Loader/Flatten.vuna"
let v_typeRefDominates = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc2 : string) (mc3 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) (mc4 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (match dtb__157 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__158; Loader_dModules.f_ExportRef_refTarget = dtb__159; Loader_dModules.f_ExportRef_refParent = dtb__160 } -> (let nd_uscrut10 = mc4 in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (match dtb__161 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__162; Loader_dModules.f_ExportRef_refTarget = dtb__163; Loader_dModules.f_ExportRef_refParent = dtb__164 } -> (if (if (if (dtb__158 = "type") then (dtb__162 = "ctor") else false) then (dtb__159 = dtb__163) else false) then ((((v_isRecordTarget mc0) mc1) mc2) dtb__159) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Loader/Flatten.vuna"
let v_refEntryList = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (match dtb__165 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__166; Loader_dModules.f_ExportRef_refTarget = dtb__167; Loader_dModules.f_ExportRef_refParent = dtb__168 } -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = dtb__166; Loader_dModules.f_ExportEntry_public = mc0; Loader_dModules.f_ExportEntry_target = dtb__167; Loader_dModules.f_ExportEntry_parent = dtb__168 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedTypeRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = ((v_findOwnData name) decls) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = "" }))))))
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match dtb__169 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__170); Loader_dModules.f_ExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 332 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownCtorEntriesNamed = (fun (mc0 : string) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (match dtb__172 with
  | Frontend_dAst.C_Decl_DData (dtb__174, dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> ((B_dData_dList.v_append (((v_ownDataCtorEntries mc0) dtb__174) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) ((B_dData_dList.v_filter (fun (c : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName c) = mc1))) dtb__177)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__173))
  | Frontend_dAst.C_Decl_DRecord (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> (if (dtb__183 = mc1) then ((B_dData_dList.v_append (((v_ownCtorEntries mc0) dtb__183) (B_dData_dList.C_List__x58__x58_ (dtb__183, B_dData_dList.C_List_Nil)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__173)) else (((v_ownCtorEntriesNamed mc0) mc1) dtb__173))
  | Frontend_dAst.C_Decl_DTrait (dtb__191, dtb__192, dtb__193, dtb__194, dtb__195) -> ((B_dData_dList.v_append (((v_ownCtorEntries mc0) dtb__191) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) ((B_dData_dList.v_filter (fun (m : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName m) = mc1))) dtb__194)))) (((v_ownCtorEntriesNamed mc0) mc1) dtb__173))
  | _ -> (((v_ownCtorEntriesNamed mc0) mc1) dtb__173)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef2 = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = (((v_ownCtorEntriesNamed prefix) name) decls) in (match nd_uscrut5 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "name") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let e = (B_dData_dPair.v_secondOf p) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportRef_refTarget = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (e).Loader_dModules.f_ExportEntry_parent })))))))
)))
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructorExport (name))) name)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "ctor"; Loader_dModules.f_ExportRef_refTarget = (dtb__196).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (dtb__196).Loader_dModules.f_ExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 303 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match ((v_findOwnFn name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (if ((v_typeKindAxiom name) decls) then "type" else "val"); Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__200); Loader_dModules.f_ExportRef_refParent = "" }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ownOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Loader/Flatten.vuna"
let v_bareEntries = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prefix : string) (name : string) (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((B_dData_dList.v_append entries) (((v_ownSelectorEntries prefix) decls) name)))

# 384 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameExportEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (e).Loader_dModules.f_ExportEntry_parent })

# 388 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameTypeEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" })

# 404 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isEmptyEntries = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSelective = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (m : string) (base : string) (name : string) (sp : Base_dSource.t_Span) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let values = ((B_dData_dList.v_map (v_renameExportEntry base)) ((Loader_dModules.v_findExportValues es) base)) in (let types = ((B_dData_dList.v_map (v_renameTypeEntry base)) ((Loader_dModules.v_findExportTypes es) base)) in (let entries = ((B_dData_dList.v_append values) types) in (if (v_isEmptyEntries entries) then (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name) else (Base_dDiag.C_Check_OkC (entries)))))))))

# 458 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_hasImportOf = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if ((Frontend_dAst.v_importName dtb__203) = mc1) then true else ((v_hasImportOf dtb__204) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_namespaceImportsGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__207, dtb__208, dtb__209) -> (if (if ((v_hasImportOf mc0) dtb__207) then true else ((v_hasImportOf mc2) dtb__207)) then (((v_namespaceImportsGo mc0) dtb__206) mc2) else (((v_namespaceImportsGo mc0) dtb__206) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__207; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importRef = dtb__209 }, mc2))))
  | _ -> (((v_namespaceImportsGo mc0) dtb__206) mc2)
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceImportsOf = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> ((B_dData_dList.v_append imports) (B_dData_dList.v_reverse (((v_namespaceImportsGo imports) items) B_dData_dList.C_List_Nil))))

# 470 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_joinCommaNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (match dtb__211 with
  | B_dData_dList.C_List_Nil -> dtb__210
  | _ -> (String.concat "" [dtb__210; ", "; (v_joinCommaNames dtb__211)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveImportPrefix = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (prefix : string) -> (let nd_uscrut2 = ((Loader_dModules.v_qualifierCandidates imports) prefix) in (match nd_uscrut2 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (prefix))) prefix)
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__213 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__212))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (prefix, (v_joinCommaNames nd_uscrut2)))) prefix) (v_joinCommaNames nd_uscrut2))
)
  | _ -> failwith "DT: impossible branch"
)))

# 356 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportBare = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (match dtb__214 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ownOrImportedTypeRef modules) prefix) decls) imports) name)) (fun (tr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_ownOrImportedValueRef modules) prefix) decls) imports) name)) (fun (vr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match tr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name)
  | B_dData_dMaybe.C_Maybe_Just (dtb__216) -> (Base_dDiag.C_Check_OkC (((v_refEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((((v_bareEntries decls) prefix) name) ((v_refEntryList name) tr))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__218) -> (if (((((v_typeRefDominates modules) decls) prefix) tr) vr) then (Base_dDiag.C_Check_OkC (((((v_bareEntries decls) prefix) name) ((v_refEntryList name) tr)))) else (Base_dDiag.C_Check_OkC (((((v_bareEntries decls) prefix) name) ((B_dData_dList.v_append ((v_refEntryList name) tr)) ((v_refEntryList name) vr))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> (let mprefix = (Base_dSource.v_joinDots dtb__214) in ((Base_dCommon.v_bind ((v_resolveImportPrefix imports) mprefix)) (fun (m : string) -> ((((((v_exportSelective modules) prefix) m) dtb__215) name) sp))))
)
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTypeAll = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (match dtb__219 with
  | B_dData_dList.C_List_Nil -> (match ((((v_ownTypeEntries decls) prefix) decls) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__221) -> (Base_dDiag.C_Check_OkC (dtb__221))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let m = (B_dData_dPair.v_firstOf p) in (let tgt = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target in ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = name; Loader_dModules.f_ExportEntry_target = tgt; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType tgt) es)))))))))))
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (let mprefix = (Base_dSource.v_joinDots dtb__219) in ((Base_dCommon.v_bind ((v_resolveImportPrefix imports) mprefix)) (fun (m : string) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportType es) dtb__220) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__222) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb__220; Loader_dModules.f_ExportEntry_target = (dtb__222).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType (dtb__222).Loader_dModules.f_ExportEntry_target) es)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dRn.v_rnAt2 sp) (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (dtb__220, m))) dtb__220) m)
  | _ -> failwith "DT: impossible branch"
))))))
)
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceEntry = (fun (path : string) (target : string) -> { Loader_dModules.f_ExportEntry_kind = "module"; Loader_dModules.f_ExportEntry_public = path; Loader_dModules.f_ExportEntry_target = target; Loader_dModules.f_ExportEntry_parent = "" })

# 499 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_filterExportMembers = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (if (if ((dtb__223).Loader_dModules.f_ExportEntry_kind = "ctor") then (B_dData_dBool.v_not ((B_dData_dList.v_memName (dtb__223).Loader_dModules.f_ExportEntry_public) mc0)) else false) then ((v_filterExportMembers mc0) dtb__224) else (B_dData_dList.C_List__x58__x58_ (dtb__223, ((v_filterExportMembers mc0) dtb__224))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportItemEntries = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem) -> (match mc4 with
  | Frontend_dAst.C_ExportItem_XBare (dtb__225, dtb__226) -> ((((((v_exportBare mc0) mc1) mc2) mc3) dtb__225) (Frontend_dAst.v_nodeRefSpan dtb__226))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb__227, dtb__228, dtb__229) -> ((Base_dCommon.v_bind ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__227) (Frontend_dAst.v_nodeRefSpan dtb__229))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_filterExportMembers dtb__228) es)))))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb__230, dtb__231) -> ((((((v_exportTypeAll mc0) mc1) mc2) mc3) dtb__230) (Frontend_dAst.v_nodeRefSpan dtb__231))
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__232, dtb__233, dtb__234) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix mc3) dtb__232)) (fun (m : string) -> (match dtb__233 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_exportsOf mc0) m)
  | B_dData_dMaybe.C_Maybe_Just (dtb__235) -> (if (dtb__235 = dtb__232) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__232) m), B_dData_dList.C_List_Nil)))) else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__232) m), (B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb__235) m), B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_ExportItem_XModule (dtb__236, dtb__237) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix mc3) dtb__236)) (fun (m : string) -> ((Loader_dModules.v_exportsOf mc0) m)))
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportEntryKey = (fun (e : Loader_dModules.t_ExportEntry) -> (String.concat "" [(e).Loader_dModules.f_ExportEntry_kind; "|"; (e).Loader_dModules.f_ExportEntry_public; "|"; (e).Loader_dModules.f_ExportEntry_target; "|"; (e).Loader_dModules.f_ExportEntry_parent]))

# 513 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeByFullKey = (fun (mc0 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (let key = (v_exportEntryKey dtb__238) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (((v_dedupeByFullKey dtb__239) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeByFullKey dtb__239) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ (dtb__238, mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeExportEntries = (fun (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (((v_dedupeByFullKey entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 531 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exportItemsAll = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> ((Base_dCommon.v_bind (((((v_exportItemEntries mc0) mc1) mc2) mc3) dtb__241)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) dtb__242)) (fun (tail : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append es) tail)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Loader/Flatten.vuna"
let v_explicitExports = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((v_dedupeExportEntries es)))))
))

# 538 "Vuna/Compiler/Loader/Flatten.vuna"
let v_validateModuleHeader = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (match dtb__243 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__244; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__245; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__246; Frontend_dAst.f_ModDecl_modDeclExports = dtb__247; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__248; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__249; Frontend_dAst.f_ModDecl_modDeclRef = dtb__250 } -> (if (dtb__244 = mc0) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__250)) (Base_dDiagnostics_dRn.C_RnErr_ModuleNameMismatch (dtb__244))) dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_opaqueNamesOf = (fun (mc0 : string) (mc1 : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__251, dtb__252) -> (match (dtb__251).Frontend_dAst.f_OpacitySpec_opacityKind with
  | Frontend_dAst.C_Opacity_OpacityOpaque -> (B_dData_dList.C_List__x58__x58_ (((Loader_dModules.v_mangle mc0) (Frontend_dAst.v_opacitySpecName dtb__251)), ((v_opaqueNamesOf mc0) dtb__252)))
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((v_opaqueNamesOf mc0) dtb__252)
  | Frontend_dAst.C_Opacity_OpacityAbstract -> (B_dData_dList.C_List__x58__x58_ ((":" ^ ((Loader_dModules.v_mangle mc0) (Frontend_dAst.v_opacitySpecName dtb__251))), ((v_opaqueNamesOf mc0) dtb__252)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Loader/Flatten.vuna"
let v_abstractOpaquePrefix = ":"

# 557 "Vuna/Compiler/Loader/Flatten.vuna"
let v_opaqueBaseName = (fun (name : string) -> (if ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name) then (((dtp_substring (String.length v_abstractOpaquePrefix)) ((String.length name) - (String.length v_abstractOpaquePrefix))) name) else name))

# 567 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isAbstractOpaqueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name))

# 571 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withSelectors = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Loader_dSelectors.v_selectorDecls decls)) (fun (gen : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append decls) gen))))))

# 589 "Vuna/Compiler/Loader/Flatten.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSpecToItem = (fun (mc0 : Frontend_dAst.t_ExportSpec) -> (match mc0 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb__255, dtb__256, dtb__257) -> (match dtb__256 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb__258) -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb__255, dtb__258, (Frontend_dAst.v_detachedNodeRef dtb__257)))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (dtb__255, (Frontend_dAst.v_detachedNodeRef dtb__257)))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XBare (dtb__255, (Frontend_dAst.v_detachedNodeRef dtb__257)))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportSpec_ESValue (dtb__259, dtb__260) -> (Frontend_dAst.C_ExportItem_XBare (dtb__259, (Frontend_dAst.v_detachedNodeRef dtb__260)))
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Loader/Flatten.vuna"
let v_computeExports = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (hdr : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (extraExports : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (extraReexports : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (let newItems = ((B_dData_dList.v_append ((B_dData_dList.v_map v_exportSpecToItem) extraExports)) extraReexports) in (let explicit = (((((v_explicitExports modules) prefix) decls) imports) newItems) in (if (v_notEmpty newItems) then (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> explicit
  | B_dData_dMaybe.C_Maybe_Just (dtb__261) -> (match dtb__261 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__262; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__263; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__264; Frontend_dAst.f_ModDecl_modDeclExports = dtb__265; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__266; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__267; Frontend_dAst.f_ModDecl_modDeclRef = dtb__268 } -> (if dtb__263 then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__268)) (Base_dDiagnostics_dRn.C_RnErr_DuplicateExport ("module header"))) "module header") else explicit)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = hdr in (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__269) -> (match dtb__269 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__270; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__271; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__272; Frontend_dAst.f_ModDecl_modDeclExports = dtb__273; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__274; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__275; Frontend_dAst.f_ModDecl_modDeclRef = dtb__276 } -> (if dtb__271 then (((((v_explicitExports modules) prefix) decls) imports) dtb__272) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 599 "Vuna/Compiler/Loader/Flatten.vuna"
let v_showCycle = (fun (name : string) (stack : string B_dData_dList.t_List) -> (Base_dSource.v_joinArrows (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (name, stack)))))

# 619 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_implicitPreludeEnabled = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__277) = mc1) then (dtb__277).Frontend_dPackages_dPkg.f_Root_rootImplicitPrelude else ((v_implicitPreludeEnabled dtb__278) mc1))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 632 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeDeps = (fun (mc0 : string) (mc1 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__279, dtb__280) -> (match dtb__280 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = "Prelude"; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousPrelude ((Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))) (Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)))) mc1))))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__281 = Obj.obj (e) in (let dtb__282 = Obj.obj ((k (dtb__281 u))) in (dtb__282 u)))))) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) "Prelude") importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (let allowed = (B_dData_dPair.v_firstOf collected) in (let x = ((v_implicitPreludeDeps importerPkg) ((B_dData_dList.v_filter (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf c)) <> importerPkg))) allowed)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 608 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (B_dData_dBool.v_not ((v_implicitPreludeEnabled roots) importerPkg)) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (currentName = "Prelude") then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames imports)) then (let x = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((v_implicitPreludeFrom nFs) roots) importerPkg)))))

# 642 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withLayerCheck = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> ((Base_dCommon.v_bind ((Loader_dLayers.v_checkProjectLayers roots) project)) (fun (_u : B_dData_dUnit.t_Unit) -> (Base_dDiag.C_Check_OkC (project)))))

# 646 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan imp)) = "") then e else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan imp)) e)))

# 651 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loaderFuel = 1048576

# 677 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_nsTakeLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__283, dtb__284) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__283, ((v_nsTakeLocal (mc0 - 1)) dtb__284))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_pathPrefixOf = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (segs : string B_dData_dList.t_List) (n : int) -> (if (n < 1) then (let x = B_dData_dMaybe.C_Maybe_Nothing in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__285 = Obj.obj (e) in (let dtb__286 = Obj.obj ((k (dtb__285 u))) in (dtb__286 u)))))) ((((((Loader_dModules.v_collectModuleFiles nFs) roots) (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs))) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) (fun collected -> (if (v_notEmpty (B_dData_dPair.v_firstOf collected)) then (let x = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs)); B_dData_dPair.f_Pair_second = n })) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((((v_pathPrefixOf nFs) roots) importerPkg) segs) (n - 1)))))))

# 681 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsDropLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288)) else ((v_nsDropLocal (mc0 - 1)) dtb__288))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 654 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_loadAll = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (fuel <= 0) then (let x = (Base_dDiag.v_icFuel "loader") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (match imports with
  | B_dData_dList.C_List_Nil -> (let x = (Base_dDiag.C_Check_OkC (modules)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dList.C_List__x58__x58_ (dtb__289, dtb__290) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__291 = Obj.obj (e) in (let dtb__292 = Obj.obj ((k (dtb__291 u))) in (dtb__292 u)))))) (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) modules) stack) dtb__289)) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__293) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__293)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__294) -> (((((((v_loadAll nFs) (fuel - 1)) roots) importerPkg) dtb__294) stack) dtb__290)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 685 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadModule = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (let name = (Frontend_dAst.v_importName imp) in (if (fuel <= 0) then (let x = (Base_dDiag.v_icFuel "loader") in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (match ((Loader_dModules.v_findModule modules) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__295) -> (if (((Loader_dModules.v_moduleVisibleTo roots) importerPkg) dtb__295) then (let x = (Base_dDiag.C_Check_OkC (modules)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (name, (Loader_dModules.v_modulePackageOf dtb__295)))) name) (Loader_dModules.v_modulePackageOf dtb__295))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName name) stack) then (let x = ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ImportCycle (((v_showCycle name) stack)))) ((v_showCycle name) stack))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (Loader_dModules.v_validModuleName name) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__296 = Obj.obj (e) in (let dtb__297 = Obj.obj ((k (dtb__296 u))) in (dtb__297 u)))))) (((((Loader_dModules.v_findModuleFile nFs) roots) name) importerPkg) (Frontend_dAst.v_importSpan imp))) (fun foundR -> (match foundR with
  | Base_dDiag.C_Check_ErrC (dtb__298) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_ErrC (dtb__298)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__299) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__300 = Obj.obj (e) in (let dtb__301 = Obj.obj ((k (dtb__300 u))) in (dtb__301 u)))))) (((((v_pathPrefixOf nFs) roots) importerPkg) (Base_dSource.v_splitOnDot name)) ((B_dData_dList.v_length (Base_dSource.v_splitOnDot name)) - 1))) (fun prefixR -> (let nd_uscrut17 = prefixR in (match nd_uscrut17 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (match dtb__302 with
  | { B_dData_dPair.f_Pair_first = dtb__303; B_dData_dPair.f_Pair_second = dtb__304 } -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__305 = Obj.obj (e) in (let dtb__306 = Obj.obj ((k (dtb__305 u))) in (dtb__306 u)))))) (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) modules) stack) { Frontend_dAst.f_Import_importName = dtb__303; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })) (fun modsR -> (match modsR with
  | Base_dDiag.C_Check_ErrC (dtb__307) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__307)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__308) -> (match ((Loader_dModules.v_findModule dtb__308) dtb__303) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_ErrC (dtb__298)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__309) -> (match (((Loader_dModules.v_walkNamespaceIndex dtb__308) dtb__303) ((v_nsDropLocal dtb__304) (Base_dSource.v_splitOnDot name))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_ErrC (dtb__298)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__310) -> (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) dtb__308) stack) { Frontend_dAst.f_Import_importName = dtb__310; Frontend_dAst.f_Import_importIsQualified = true; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = (Base_dDiag.C_Check_ErrC (dtb__298)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb__311) -> (let path = (B_dData_dPair.v_firstOf dtb__311) in (let root = (B_dData_dPair.v_secondOf dtb__311) in (let _u = (if ((dtp_log_on 3) "Vuna.Compiler.Loader.Flatten") then (((dtp_log_emit 3) "Vuna.Compiler.Loader.Flatten") ("parse-module=" ^ name)) else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__312 = Obj.obj (e) in (let dtb__313 = Obj.obj ((k (dtb__312 u))) in (dtb__313 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) path)) (fun text -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__314 = Obj.obj (e) in (let dtb__315 = Obj.obj ((k (dtb__314 u))) in (dtb__315 u)))))) (((v_parseFileWithPath nFs) path) text)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__316) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__316)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__317) -> (let sf = (B_dData_dPair.v_firstOf dtb__317) in (let surface = (B_dData_dPair.v_secondOf dtb__317) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports0 = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let imports = ((v_namespaceImportsOf imports0) reexports) in (match ((v_validateModuleHeader name) hdr) with
  | Base_dDiag.C_Check_ErrC (dtb__318) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__318)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__319) -> (match ((Loader_dModules.v_validateImports name) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__320) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__320)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__321) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__322 = Obj.obj (e) in (let dtb__323 = Obj.obj ((k (dtb__322 u))) in (dtb__323 u)))))) (((((v_implicitPrelude nFs) roots) (Frontend_dPackages_dPkg.v_rootName root)) name) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__324) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__324)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__325) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__326 = Obj.obj (e) in (let dtb__327 = Obj.obj ((k (dtb__326 u))) in (dtb__327 u)))))) (((((((v_loadAll nFs) (fuel - 1)) roots) (Frontend_dPackages_dPkg.v_rootName root)) modules) (B_dData_dList.C_List__x58__x58_ (name, stack))) ((B_dData_dList.v_append imports) dtb__325))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__328) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__328)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__329) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__329) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__330) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__330)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__331) -> (match (((((((v_computeExports dtb__329) name) hdr) imports2) decls) exports) reexports) with
  | Base_dDiag.C_Check_ErrC (dtb__332) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__332)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__333) -> (let visible = fixities in (let x = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = name; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_rootName root); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__325; Loader_dModules.f_Module_moduleDeclsOf = dtb__331; Loader_dModules.f_Module_moduleExportsOf = dtb__333; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append ((Loader_dModules.v_reexportedImportNamesOfHeader imports2) hdr)) ((Loader_dModules.v_reexportedImportNames imports2) reexports)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf name) opacity); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__333); Loader_dModules.f_Module_moduleFixFactsOf = surface }, dtb__329)))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
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
))) else (let x = ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_InvalidModuleName (name))) name)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))))

# 784 "Vuna/Compiler/Loader/Flatten.vuna"
let v_entryScopeOf = (fun (pkg : string) (path : string) -> (let name = (((B_dData_dList.v_foldl (fun (acc : string) (seg : string) -> seg)) path) ((B_dData_dString.v_split "/") path)) in (if ((B_dData_dString.v_endsWith ".vuna") name) then (((B_dData_dString.v_substring 0) ((B_dData_dNat.v_minus (B_dData_dString.v_byteLength name)) 5)) name) else (if (name = "") then pkg else name))))

# 796 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__334 = Obj.obj (e) in (let dtb__335 = Obj.obj ((k (dtb__334 u))) in (dtb__335 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__336 = Obj.obj (e) in (let dtb__337 = Obj.obj ((k (dtb__336 u))) in (dtb__337 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) entry)) (fun text -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__338 = Obj.obj (e) in (let dtb__339 = Obj.obj ((k (dtb__338 u))) in (dtb__339 u)))))) (((v_parseFileWithPath nFs) entry) text)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__340) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__340)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__341) -> (let sf = (B_dData_dPair.v_firstOf dtb__341) in (let surface = (B_dData_dPair.v_secondOf dtb__341) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let nd_uscrut20 = hdr in (match nd_uscrut20 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") imports) with
  | Base_dDiag.C_Check_ErrC (dtb__342) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__342)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__343) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__344 = Obj.obj (e) in (let dtb__345 = Obj.obj ((k (dtb__344 u))) in (dtb__345 u)))))) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__346) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__346)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__347) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__348 = Obj.obj (e) in (let dtb__349 = Obj.obj ((k (dtb__348 u))) in (dtb__349 u)))))) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__347))) (fun modulesR -> (let x = (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__350) -> (Base_dDiag.C_Check_ErrC (dtb__350))
  | Base_dDiag.C_Check_OkC (dtb__351) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__351) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__352) -> (Base_dDiag.C_Check_ErrC (dtb__352))
  | Base_dDiag.C_Check_OkC (dtb__353) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__353; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__347; Loader_dModules.f_Project_projectModules = dtb__351; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = fixities; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) entry); Loader_dModules.f_Project_projectEntryFacts = surface })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__354) -> (match dtb__354 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__355; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__356; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__357; Frontend_dAst.f_ModDecl_modDeclExports = dtb__358; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__359; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__360; Frontend_dAst.f_ModDecl_modDeclRef = dtb__361 } -> (let x = ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb__361))) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntryFile (entry))) entry)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))) else (let x = ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_EntryFileNotFound (entry))) entry) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 779 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((((v_loadProjectWithPreloaded nFs) ctx) entry) B_dData_dList.C_List_Nil))

# 847 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (let entryImports = ((B_dData_dList.v_map (fun (n : string) -> { Frontend_dAst.f_Import_importName = n; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) names) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__362 = Obj.obj (e) in (let dtb__363 = Obj.obj ((k (dtb__362 u))) in (dtb__363 u)))))) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) entryImports)) (fun modulesR -> (let x = (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__364) -> (Base_dDiag.C_Check_ErrC (dtb__364))
  | Base_dDiag.C_Check_OkC (dtb__365) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb__365; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 844 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((((v_loadProjectModulesWithPreloaded nFs) ctx) names) B_dData_dList.C_List_Nil))

# 866 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSourceWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__366 = Obj.obj (e) in (let dtb__367 = Obj.obj ((k (dtb__366 u))) in (dtb__367 u)))))) ((((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__368) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__368)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__369) -> (let sf = (B_dData_dPair.v_firstOf dtb__369) in (let surface = (B_dData_dPair.v_secondOf dtb__369) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let nd_uscrut19 = hdr in (match nd_uscrut19 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") imports) with
  | Base_dDiag.C_Check_ErrC (dtb__370) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__370)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__371) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__372 = Obj.obj (e) in (let dtb__373 = Obj.obj ((k (dtb__372 u))) in (dtb__373 u)))))) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__374) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__374)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__375) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__376 = Obj.obj (e) in (let dtb__377 = Obj.obj ((k (dtb__376 u))) in (dtb__377 u)))))) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__375))) (fun modulesR -> (let x = (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__378) -> (Base_dDiag.C_Check_ErrC (dtb__378))
  | Base_dDiag.C_Check_OkC (dtb__379) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__379) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__380) -> (Base_dDiag.C_Check_ErrC (dtb__380))
  | Base_dDiag.C_Check_OkC (dtb__381) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb__381; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__375; Loader_dModules.f_Project_projectModules = dtb__379; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = fixities; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) label); Loader_dModules.f_Project_projectEntryFacts = surface })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__382) -> (match dtb__382 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__383; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__384; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__385; Frontend_dAst.f_ModDecl_modDeclExports = dtb__386; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__387; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__388; Frontend_dAst.f_ModDecl_modDeclRef = dtb__389 } -> (let x = ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntrySource (label))) label) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))

# 862 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil))

# 916 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSourceWithPreloaded = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__390 = Obj.obj (e) in (let dtb__391 = Obj.obj ((k (dtb__390 u))) in (dtb__391 u)))))) ((((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__392) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__392)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__393) -> (let sf = (B_dData_dPair.v_firstOf dtb__393) in (let surface = (B_dData_dPair.v_secondOf dtb__393) in (let hdr = (sf).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let imports0 = (sf).Frontend_dAst.f_SourceFile_sourceFileImports in (let fixities = (sf).Frontend_dAst.f_SourceFile_sourceFileFixities in (let decls = (sf).Frontend_dAst.f_SourceFile_sourceFileDecls in (let exports = (sf).Frontend_dAst.f_SourceFile_sourceFileExports in (let reexports = (sf).Frontend_dAst.f_SourceFile_sourceFileReexports in (let opacity = (sf).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let nd_uscrut19 = hdr in (match nd_uscrut19 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__394) -> (match dtb__394 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__395; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__396; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__397; Frontend_dAst.f_ModDecl_modDeclExports = dtb__398; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__399; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__400; Frontend_dAst.f_ModDecl_modDeclRef = dtb__401 } -> (let imports = ((v_namespaceImportsOf imports0) reexports) in (match ((Loader_dModules.v_validateImports dtb__395) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__402) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__402)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__403) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__404 = Obj.obj (e) in (let dtb__405 = Obj.obj ((k (dtb__404 u))) in (dtb__405 u)))))) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb__395) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__406) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__406)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__407) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__408 = Obj.obj (e) in (let dtb__409 = Obj.obj ((k (dtb__408 u))) in (dtb__409 u)))))) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__407))) (fun modulesR -> (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__410) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__410)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__411) -> (let imports2 = ((Loader_dModules.v_normalizeImports dtb__411) imports) in (match (v_withSelectors decls) with
  | Base_dDiag.C_Check_ErrC (dtb__412) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__412)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__413) -> (match (((((((v_computeExports dtb__411) dtb__395) hdr) imports2) decls) exports) reexports) with
  | Base_dDiag.C_Check_ErrC (dtb__414) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__414)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__415) -> (let visible = fixities in (let x = ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = imports2; Loader_dModules.f_Project_projectImplicitImports = dtb__407; Loader_dModules.f_Project_projectModules = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb__395; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Module_moduleImportsOf = imports2; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb__407; Loader_dModules.f_Module_moduleDeclsOf = dtb__413; Loader_dModules.f_Module_moduleExportsOf = dtb__415; Loader_dModules.f_Module_moduleFixitiesOf = visible; Loader_dModules.f_Module_moduleReexportsOf = ((Loader_dModules.v_reexportedImportNames imports2) ((B_dData_dList.v_append dtb__397) reexports)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb__395) opacity); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb__415); Loader_dModules.f_Module_moduleFixFactsOf = surface }, dtb__411)); Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts }) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))
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

# 912 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((v_loadModuleSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil))

# 984 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesFromParsed = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : Frontend_dAst.t_SourceFile) -> (match mc3 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb__416; Frontend_dAst.f_SourceFile_sourceFileImports = dtb__417; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb__418; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb__419; Frontend_dAst.f_SourceFile_sourceFileExports = dtb__420; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb__421; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb__422 } -> (let imports = ((v_namespaceImportsOf dtb__417) dtb__421) in (let headerNames = (let nd_uscrut15 = dtb__416 in (match nd_uscrut15 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__433) -> (match dtb__433 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__434; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__435; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__436; Frontend_dAst.f_ModDecl_modDeclExports = dtb__437; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__438; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__439; Frontend_dAst.f_ModDecl_modDeclRef = dtb__440 } -> { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__434 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = "" }
  | _ -> failwith "DT: impossible branch"
)) in (let diagLabel = (B_dData_dPair.v_firstOf headerNames) in (let currentName = (B_dData_dPair.v_secondOf headerNames) in (match ((Loader_dModules.v_validateImports diagLabel) imports) with
  | Base_dDiag.C_Check_ErrC (dtb__423) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__423)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__424) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__425 = Obj.obj (e) in (let dtb__426 = Obj.obj ((k (dtb__425 u))) in (dtb__426 u)))))) (((((v_implicitPrelude nFs) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) currentName) imports)) (fun implicitR -> (match implicitR with
  | Base_dDiag.C_Check_ErrC (dtb__427) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__427)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__428) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__429 = Obj.obj (e) in (let dtb__430 = Obj.obj ((k (dtb__429 u))) in (dtb__430 u)))))) (((((((v_loadAll nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) mc1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append imports) dtb__428))) (fun modulesR -> (let x = (match modulesR with
  | Base_dDiag.C_Check_ErrC (dtb__431) -> (Base_dDiag.C_Check_ErrC (dtb__431))
  | Base_dDiag.C_Check_OkC (dtb__432) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__432; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb__432) dtb__418) }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 972 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules0 : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__441 = Obj.obj (e) in (let dtb__442 = Obj.obj ((k (dtb__441 u))) in (dtb__442 u)))))) ((((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source)) (fun parsed -> (match parsed with
  | Base_dDiag.C_Check_ErrC (dtb__443) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__443)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__444) -> (((((v_fixitiesFromParsed nFs) ctx) modules0) label) (B_dData_dPair.v_firstOf dtb__444))
  | _ -> failwith "DT: impossible branch"
))))

# 1012 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__445 = Obj.obj (e) in (let dtb__446 = Obj.obj ((k (dtb__445 u))) in (dtb__446 u)))))) (((((v_fixitiesForSourceIn nFs) ctx) B_dData_dList.C_List_Nil) label) source)) (fun pairR -> (let x = (match pairR with
  | Base_dDiag.C_Check_ErrC (dtb__447) -> (Base_dDiag.C_Check_ErrC (dtb__447))
  | Base_dDiag.C_Check_OkC (dtb__448) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb__448)))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 1137 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_fixityOpsOf = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__449, dtb__450) -> (B_dData_dList.C_List__x58__x58_ ((dtb__449).Frontend_dAst.f_FixityDecl_fixityOp, (v_fixityOpsOf dtb__450)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1101 "Vuna/Compiler/Loader/Flatten.vuna"
let v_visibleFixityOps = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__451) -> (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__451))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) imports))

# 1154 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameSuffixIn = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__452, dtb__453) -> (if (if (dtb__452 = mc0) then true else ((B_dData_dString.v_endsWith ("." ^ mc0)) dtb__452)) then true else ((v_anyNameSuffixIn mc0) dtb__453))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1149 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyOpDeclared = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__454, dtb__455) -> (if ((v_anyNameSuffixIn dtb__454) mc1) then true else ((v_anyOpDeclared dtb__455) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1174 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_traitMethodNames = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (B_dData_dList.C_List__x58__x58_ ((dtb__456).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb__457)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Loader/Flatten.vuna"
let v_definedNamesOfDecl = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__458, dtb__459, dtb__460, dtb__461) -> (B_dData_dList.C_List__x58__x58_ (dtb__458, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb__462, dtb__463, dtb__464, dtb__465) -> (B_dData_dList.C_List__x58__x58_ (dtb__462, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb__466, dtb__467, dtb__468) -> (B_dData_dList.C_List__x58__x58_ (dtb__466, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb__469, dtb__470, dtb__471, dtb__472) -> (B_dData_dList.C_List__x58__x58_ (dtb__469, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb__473, dtb__474, dtb__475, dtb__476) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DTrait (dtb__477, dtb__478, dtb__479, dtb__480, dtb__481) -> (B_dData_dList.C_List__x58__x58_ (dtb__477, (v_traitMethodNames dtb__480)))
  | Frontend_dAst.C_Decl_DRecord (dtb__482, dtb__483, dtb__484, dtb__485, dtb__486, dtb__487, dtb__488, dtb__489) -> (B_dData_dList.C_List__x58__x58_ (dtb__482, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DData (dtb__490, dtb__491, dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498) -> (B_dData_dList.C_List__x58__x58_ (dtb__490, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1160 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_definedNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__499, dtb__500) -> ((B_dData_dList.v_append (v_definedNamesOfDecl dtb__499)) (v_definedNamesOf dtb__500))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesDeclaredFixity = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__501) -> ((v_anyOpDeclared (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__501))) (v_definedNamesOf decls))
  | _ -> failwith "DT: impossible branch"
))

# 1178 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__502, dtb__503) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__502) mc0) then true else ((v_anyNameIn mc0) dtb__503))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1131 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesUsedFixity = (fun (sourceNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> ((v_anyNameIn sourceNames) (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__504)))
  | _ -> failwith "DT: impossible branch"
))

# 1190 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyInstanceDecl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__505, dtb__506) -> (match dtb__505 with
  | Frontend_dAst.C_Decl_DInstance (dtb__507, dtb__508, dtb__509, dtb__510) -> true
  | _ -> (v_anyInstanceDecl dtb__506)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1184 "Vuna/Compiler/Loader/Flatten.vuna"
let v_moduleDeclaresInstance = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (v_anyInstanceDecl (Loader_dModules.v_moduleDeclsOf dtb__511))
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalEdit = (fun (imp : Frontend_dAst.t_Import) -> { Base_dDiag.f_DiagEdit_editSpan = (Frontend_dAst.v_importSpan imp); Base_dDiag.f_DiagEdit_editNewText = "" })

# 1121 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportDiag = (fun (imp : Frontend_dAst.t_Import) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = ("remove unused import " ^ (imp).Frontend_dAst.f_Import_importName); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ((v_importRemovalEdit imp), B_dData_dList.C_List_Nil)) }) (((Base_dDiagnostics_dWarning.v_warnDiagAt (Frontend_dAst.v_importSpan imp)) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedImport ((imp).Frontend_dAst.f_Import_importName))) (B_dData_dVec.C_Vec__x58__x58_ ((imp).Frontend_dAst.f_Import_importName, B_dData_dVec.C_Vec_Nil)))))

# 1210 "Vuna/Compiler/Loader/Flatten.vuna"
let v_expandGlobalName = (fun (n : string) -> (let nd_uscrut1 = (Frontend_dReserved.v_classify n) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__512) -> (match dtb__512 with
  | Frontend_dReserved.C_Reserved_RsFieldSel (dtb__513, dtb__514) -> (B_dData_dList.C_List__x58__x58_ (dtb__513, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsDoIgnore (dtb__515) -> (B_dData_dList.C_List__x58__x58_ (dtb__515, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsDoBind (dtb__516) -> (B_dData_dList.C_List__x58__x58_ (dtb__516, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb__517, dtb__518) -> dtb__518
  | _ -> (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (n, B_dData_dList.C_List_Nil))
)))

# 1221 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTargetOf = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 1225 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyTargetIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__519, dtb__520) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__519) mc0) then true else ((v_anyTargetIn mc0) dtb__520))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1110 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_unusedImportWarningsGo = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__521, dtb__522) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) (Frontend_dAst.v_importName dtb__521))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let used = (if (if (if (if ((B_dData_dList.v_memName (Frontend_dAst.v_importName dtb__521)) mc4) then true else ((v_anyTargetIn mc1) ((B_dData_dList.v_map v_exportTargetOf) es))) then true else (((v_importProvidesUsedFixity mc2) mc0) dtb__521)) then true else (((v_importProvidesDeclaredFixity mc3) mc0) dtb__521)) then true else ((v_moduleDeclaresInstance mc0) dtb__521)) in ((Base_dCommon.v_bind ((((((v_unusedImportWarningsGo mc0) mc1) mc2) mc3) mc4) dtb__522)) (fun (more : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if used then more else (B_dData_dList.C_List__x58__x58_ ((v_unusedImportDiag dtb__521), more))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1261 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_patRefNamesGo = (fun (mc0 : Frontend_dAst.t_Pat) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Pat_PRecord (dtb__523, dtb__524, dtb__525) -> ((v_fieldPatsGo dtb__524) (B_dData_dList.C_List__x58__x58_ (dtb__523, mc1)))
  | Frontend_dAst.C_Pat_PStr (dtb__526, dtb__527) -> mc1
  | Frontend_dAst.C_Pat_PInt (dtb__528, dtb__529) -> mc1
  | Frontend_dAst.C_Pat_PCon (dtb__530, dtb__531, dtb__532) -> ((v_patRefNamesListGo dtb__531) (B_dData_dList.C_List__x58__x58_ (dtb__530, mc1)))
  | Frontend_dAst.C_Pat_PWild (dtb__533) -> mc1
  | Frontend_dAst.C_Pat_PAs (dtb__534, dtb__535, dtb__536) -> ((v_patRefNamesGo dtb__535) mc1)
  | Frontend_dAst.C_Pat_PVar (dtb__537, dtb__538) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1270 "Vuna/Compiler/Loader/Flatten.vuna"
and v_patRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Pat B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__539, dtb__540) -> ((v_patRefNamesListGo dtb__540) ((v_patRefNamesGo dtb__539) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1274 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldPatsGo = (fun (mc0 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__541, dtb__542) -> ((v_fieldPatsGo dtb__542) ((v_patRefNamesGo (B_dData_dPair.v_secondOf dtb__541)) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1258 "Vuna/Compiler/Loader/Flatten.vuna"
let v_patRefNames = (fun (p : Frontend_dAst.t_Pat) -> ((v_patRefNamesGo p) B_dData_dList.C_List_Nil))

# 1285 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exprRefNamesGo = (fun (mc0 : Frontend_dAst.t_Expr) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_Expr_EInterp (dtb__543, dtb__544) -> ((v_interpPartRefNamesListGo dtb__543) mc1)
  | Frontend_dAst.C_Expr_EDo (dtb__545, dtb__546) -> ((v_doStmtRefNamesListGo dtb__545) mc1)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__547, dtb__548, dtb__549) -> ((v_exprRefNamesGo dtb__547) ((v_fieldExprsGo dtb__548) mc1))
  | Frontend_dAst.C_Expr_ERecord (dtb__550, dtb__551, dtb__552) -> ((v_fieldExprsGo dtb__551) (B_dData_dList.C_List__x58__x58_ (dtb__550, mc1)))
  | Frontend_dAst.C_Expr_EField (dtb__553, dtb__554, dtb__555) -> ((v_exprRefNamesGo dtb__553) mc1)
  | Frontend_dAst.C_Expr_EIf (dtb__556, dtb__557, dtb__558, dtb__559) -> ((v_exprRefNamesGo dtb__556) ((v_exprRefNamesGo dtb__557) ((v_exprRefNamesGo dtb__558) mc1)))
  | Frontend_dAst.C_Expr_ECase (dtb__560, dtb__561, dtb__562) -> ((v_exprRefNamesGo dtb__560) ((v_altRefNamesListGo dtb__561) mc1))
  | Frontend_dAst.C_Expr_ELet (dtb__563, dtb__564, dtb__565, dtb__566) -> ((v_exprRefNamesGo dtb__564) ((v_bindRefNamesListGo dtb__563) mc1))
  | Frontend_dAst.C_Expr_EPi (dtb__567, dtb__568, dtb__569, dtb__570, dtb__571, dtb__572) -> ((v_exprRefNamesGo dtb__570) ((v_exprRefNamesGo dtb__571) mc1))
  | Frontend_dAst.C_Expr_EApp (dtb__573, dtb__574, dtb__575) -> ((v_exprRefNamesGo dtb__573) ((v_exprRefNamesListGo dtb__574) mc1))
  | Frontend_dAst.C_Expr_ELam (dtb__576, dtb__577, dtb__578) -> ((v_exprRefNamesGo dtb__577) mc1)
  | Frontend_dAst.C_Expr_EFloat (dtb__579, dtb__580) -> mc1
  | Frontend_dAst.C_Expr_EStr (dtb__581, dtb__582) -> mc1
  | Frontend_dAst.C_Expr_EInt (dtb__583, dtb__584) -> mc1
  | Frontend_dAst.C_Expr_EVar (dtb__585, dtb__586) -> (B_dData_dList.C_List__x58__x58_ (dtb__585, mc1))
  | _ -> failwith "DT: impossible branch"
))
# 1302 "Vuna/Compiler/Loader/Flatten.vuna"
and v_exprRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Expr B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__587, dtb__588) -> ((v_exprRefNamesListGo dtb__588) ((v_exprRefNamesGo dtb__587) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1306 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldExprsGo = (fun (mc0 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__589, dtb__590) -> ((v_fieldExprsGo dtb__590) ((v_exprRefNamesGo (B_dData_dPair.v_secondOf dtb__589)) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1311 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesGo = (fun (b : Frontend_dAst.t_Binding) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesGo (b).Frontend_dAst.f_Binding_bindPat) ((v_bindingValueRefNames (b).Frontend_dAst.f_Binding_bindValue) ((v_bindingSigRefNames (b).Frontend_dAst.f_Binding_bindSig) acc))))
# 1316 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingValueRefNames = (fun (mc0 : Frontend_dAst.t_BindingValue) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb__591) -> ((v_clauseRefNamesListGo dtb__591) mc1)
  | Frontend_dAst.C_BindingValue_BVal (dtb__592) -> ((v_exprRefNamesGo dtb__592) mc1)
  | _ -> failwith "DT: impossible branch"
))
# 1321 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingSigRefNames = (fun (mc0 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__593) -> ((v_exprRefNamesGo (dtb__593).Frontend_dAst.f_BindingSig_sigType) mc1)
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1325 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Binding B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__594, dtb__595) -> ((v_bindRefNamesListGo dtb__595) ((v_bindRefNamesGo dtb__594) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1330 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesGo = (fun (alt : Frontend_dAst.t_Alt) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesGo (alt).Frontend_dAst.f_Alt_altPat) ((v_exprRefNamesGo (alt).Frontend_dAst.f_Alt_altBody) acc)))
# 1333 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesListGo = (fun (mc0 : Frontend_dAst.t_Alt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__596, dtb__597) -> ((v_altRefNamesListGo dtb__597) ((v_altRefNamesGo dtb__596) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1338 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesGo = (fun (clause : Frontend_dAst.t_LocalClause) (acc : string B_dData_dList.t_List) -> ((v_patRefNamesListGo (clause).Frontend_dAst.f_LocalClause_lcPats) ((v_exprRefNamesGo (clause).Frontend_dAst.f_LocalClause_lcBody) acc)))
# 1341 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesListGo = (fun (mc0 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__598, dtb__599) -> ((v_clauseRefNamesListGo dtb__599) ((v_clauseRefNamesGo dtb__598) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1346 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesGo = (fun (mc0 : Frontend_dAst.t_DoStmt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_DoStmt_DLet (dtb__600, dtb__601) -> ((v_bindRefNamesListGo dtb__600) mc1)
  | Frontend_dAst.C_DoStmt_DExpr (dtb__602, dtb__603) -> ((v_exprRefNamesGo dtb__602) mc1)
  | Frontend_dAst.C_DoStmt_DBind (dtb__604, dtb__605, dtb__606) -> ((v_patRefNamesGo dtb__604) ((v_exprRefNamesGo dtb__605) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 1351 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesListGo = (fun (mc0 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__607, dtb__608) -> ((v_doStmtRefNamesListGo dtb__608) ((v_doStmtRefNamesGo dtb__607) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1356 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesGo = (fun (mc0 : Frontend_dAst.t_InterpPart) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb__609) -> ((v_exprRefNamesGo dtb__609) mc1)
  | Frontend_dAst.C_InterpPart_IPText (dtb__610) -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 1360 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesListGo = (fun (mc0 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__611, dtb__612) -> ((v_interpPartRefNamesListGo dtb__612) ((v_interpPartRefNamesGo dtb__611) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 1282 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exprRefNames = (fun (e : Frontend_dAst.t_Expr) -> ((v_exprRefNamesGo e) B_dData_dList.C_List_Nil))

# 1246 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ctorRefNames = (fun (c : Frontend_dAst.t_Ctor) -> (v_exprRefNames (c).Frontend_dAst.f_Ctor_ctorType))

# 1250 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fieldRefNames = (fun (f : Frontend_dAst.t_Field) -> (v_exprRefNames (f).Frontend_dAst.f_Field_fieldType))

# 1254 "Vuna/Compiler/Loader/Flatten.vuna"
let v_traitMethodRefNames = (fun (m : Frontend_dAst.t_TraitMethod) -> (v_exprRefNames (m).Frontend_dAst.f_TraitMethod_traitMethodType))

# 1231 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_declRefNames = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DFun (dtb__613, dtb__614, dtb__615, dtb__616) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_patRefNames) dtb__614)) (v_exprRefNames dtb__615))
  | Frontend_dAst.C_Decl_DExtern (dtb__617, dtb__618, dtb__619, dtb__620) -> (v_exprRefNames dtb__619)
  | Frontend_dAst.C_Decl_DAxiom (dtb__621, dtb__622, dtb__623) -> (v_exprRefNames dtb__622)
  | Frontend_dAst.C_Decl_DSig (dtb__624, dtb__625, dtb__626, dtb__627) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__625)) (v_exprRefNames dtb__626))
  | Frontend_dAst.C_Decl_DInstance (dtb__628, dtb__629, dtb__630, dtb__631) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__628)) ((B_dData_dList.v_append (v_exprRefNames dtb__629)) ((B_dData_dList.v_concatMap v_declRefNames) dtb__630)))
  | Frontend_dAst.C_Decl_DTrait (dtb__632, dtb__633, dtb__634, dtb__635, dtb__636) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb__634)) ((B_dData_dList.v_concatMap v_traitMethodRefNames) dtb__635))
  | Frontend_dAst.C_Decl_DRecord (dtb__637, dtb__638, dtb__639, dtb__640, dtb__641, dtb__642, dtb__643, dtb__644) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_fieldRefNames) dtb__639)) dtb__640)
  | Frontend_dAst.C_Decl_DData (dtb__645, dtb__646, dtb__647, dtb__648, dtb__649, dtb__650, dtb__651, dtb__652, dtb__653) -> ((B_dData_dList.v_append (v_exprRefNames dtb__647)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_ctorRefNames) dtb__648)) dtb__649))
  | _ -> failwith "DT: impossible branch"
))

# 1203 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declGlobalNames = (fun (d : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_concatMap v_expandGlobalName) (v_declRefNames d)))

# 1072 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportWarnings = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (sourceDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (reexports : string B_dData_dList.t_List) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.names") (fun (_u : int) -> (let sourceRefs = ((B_dData_dList.v_concatMap v_declRefNames) sourceDecls) in (let interpRef = (if ((B_dData_dList.v_memName "interp") sourceRefs) then true else ((B_dData_dList.v_memName Base_dIntrinsics.v_interpMethodName) sourceRefs)) in (let names0 = ((B_dData_dList.v_concatMap v_declGlobalNames) decls) in (let names = (if interpRef then names0 else ((B_dData_dList.v_filter (fun (n : string) -> (n <> Base_dIntrinsics.v_interpMethodName))) names0)) in (let nameSet = (B_dContainer_dHashMap.v_ofNames names) in (let fixitySet = (B_dContainer_dHashMap.v_ofNames ((v_visibleFixityOps modules) imports)) in ((Base_dObs.v_obsCheck "vuna.resolve.warn.sources") (fun (_u : int) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.imports") (fun (_u : int) -> (let sourceNames = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_filter (fun (n : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) fixitySet))) sourceRefs)) in ((((((v_unusedImportWarningsGo modules) nameSet) sourceNames) decls) reexports) imports)))))))))))))))

# 1058 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveModuleGo = (fun (release : bool) (m : Loader_dModules.t_Module) (rest : Loader_dModules.t_Module B_dData_dList.t_List) (declsR : Frontend_dAst.t_Decl B_dData_dList.t_List Base_dDiag.t_Check) -> ((Base_dCommon.v_bind declsR) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let modules2 = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = decls3; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (m).Loader_dModules.f_Module_moduleFixFactsOf }, rest)) in (let ns = ((Base_dObs.v_obsPure "vuna.resolve.ns") (fun (_u : int) -> ((((Loader_dResolve.v_namespacesOfWith release) modules2) decls3) (Loader_dModules.v_moduleAllImportsOf m)))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.module") (fun (_u : int) -> ((((((Loader_dResolve.v_resolveProgram modules2) (Loader_dModules.v_moduleNameOf m)) (Loader_dModules.v_moduleNameOf m)) ns) (Loader_dModules.v_moduleAllImportsOf m)) decls3)))) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings modules2) (m).Loader_dModules.f_Module_moduleImportsOf) d1) decls3) (Loader_dModules.v_moduleReexportsOf m))))) (fun (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = d1; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (m).Loader_dModules.f_Module_moduleFixFactsOf }; B_dData_dPair.f_Pair_second = warns })))))))))))

# 1044 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_resolveModulesKeep = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc3 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__654, dtb__655) -> (if ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__654)) mc1) then ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__655)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__654, (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p2) })))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf (dtb__654).Loader_dModules.f_Module_moduleFixFactsOf) mc2)) (Loader_dModules.v_moduleDeclsOf dtb__654))))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModuleGo mc0) dtb__654) dtb__655) ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls (Loader_dModules.v_moduleNameOf dtb__654)) decls2))))) (fun (p : (Loader_dModules.t_Module, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__655)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dPair.v_secondOf p2)) })))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectKeeping = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Loader_dModules.t_Project) -> (match mc2 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__656; Loader_dModules.f_Project_projectEntryImports = dtb__657; Loader_dModules.f_Project_projectImplicitImports = dtb__658; Loader_dModules.f_Project_projectModules = dtb__659; Loader_dModules.f_Project_projectEntryPkg = dtb__660; Loader_dModules.f_Project_projectEntryFixities = dtb__661; Loader_dModules.f_Project_projectEntryName = dtb__662; Loader_dModules.f_Project_projectEntryFacts = dtb__663 } -> (let projectFixities = ((v_dedupeFixitiesOf dtb__659) dtb__661) in ((Base_dCommon.v_bind (Loader_dFixity.v_checkUniqueFixities projectFixities)) (fun (fixes : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf dtb__663) fixes)) dtb__656)))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls dtb__662) decls2)))) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.entry") (fun (_u : int) -> (((((Loader_dResolve.v_resolveEntry mc0) dtb__659) dtb__660) ((B_dData_dList.v_append dtb__657) dtb__658)) decls3)))) (fun (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings dtb__659) dtb__657) entryDecls) decls3) B_dData_dList.C_List_Nil)))) (fun (entryWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) fixes) dtb__659)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append entryWarns) (B_dData_dPair.v_secondOf p2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = entryDecls; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p2) } })))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1024 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProject = (fun (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping false) B_dData_dList.C_List_Nil) project))

# 1028 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectWith = (fun (release : bool) (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping release) B_dData_dList.C_List_Nil) project))
