open Vuna_runtime
# 63 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseWith = (fun (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match ((Base_dObs.v_obsPure "vuna.parse.syntax") (fun (_u : int) -> ((((Frontend_dParser.v_parseSourceRecoveringTokens path) src) mode) toks))) with
  | Base_dDiag.C_Check_ErrC (dtb__0) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb__0)))
  | Base_dDiag.C_Check_OkC (dtb__1) -> (let parsed = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb__1)) in (let surface = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb__1)) in (let errs = (B_dData_dPair.v_secondOf dtb__1) in (match errs with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = parsed; B_dData_dPair.f_Pair_second = surface }))
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb__3) dtb__2)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode = (fun (dtb_u_u13 : string) (dtb_u_u16 : Frontend_dParser_dSupport.t_ParseMode) (dtb_u_u17 : string) (dtb_u_u18 : string) -> (match ((Base_dObs.v_obsPure "vuna.parse.lex") (fun (dtb_u_u19 : int) -> (Frontend_dLexer.v_lexSource dtb_u_u18))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u20) -> (let dtb_u_u22 = (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty dtb_u_u17) dtb_u_u20))) in (Obj.repr ((fun (dtb_u_u23 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u22))))
  | Base_dDiag.C_Check_OkC (dtb_u_u24) -> (let dtb_u_u26 = ((((v_parseWith dtb_u_u16) dtb_u_u17) dtb_u_u18) dtb_u_u24) in (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u26))))
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode_u_udirect = (fun (nFs : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) _u_ueffTok -> (match ((Base_dObs.v_obsPure "vuna.parse.lex") (fun (dtb_u_u19 : int) -> (Frontend_dLexer.v_lexSource src))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u20) -> (let dtb_u_u22 = (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb_u_u20))) in dtb_u_u22)
  | Base_dDiag.C_Check_OkC (dtb_u_u24) -> (let dtb_u_u26 = ((((v_parseWith mode) path) src) dtb_u_u24) in dtb_u_u26)
  | _ -> failwith "DT: impossible branch"
))

# 51 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath = (fun nFs -> ((v_parseFileWithPathMode nFs) Frontend_dParser_dSupport.C_ParseMode_PmStrict))

# 51 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath_u_udirect = (fun _u_ueta0 _u_ueta1 _u_ueta2 _u_ueffTok -> ((Obj.magic (((v_parseFileWithPath _u_ueta0) _u_ueta1) _u_ueta2)) _u_ueffTok))

# 88 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeFixitiesGo = (fun (mc0 : (string, Frontend_dAst.t_FixityDecl) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (let key = (B_dData_dPair.v_firstOf dtb__6) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (((v_dedupeFixitiesGo dtb__7) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeFixitiesGo dtb__7) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb__6), mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 98 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixityDeclKey = (fun (d : Frontend_dAst.t_FixityDecl) -> (let sp = (Frontend_dAst.v_fixitySpan d) in (String.concat "" [(d).Frontend_dAst.f_FixityDecl_fixityOp; "|"; (string_of_int (d).Frontend_dAst.f_FixityDecl_fixityLevel); "|"; (string_of_int (d).Frontend_dAst.f_FixityDecl_fixityAssoc); "|"; (Base_dSource.v_spanFile sp); ":"; (string_of_int (Base_dSource.v_spanStartLine sp)); ":"; (string_of_int (Base_dSource.v_spanStartCol sp))])))

# 81 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeFixitiesOf = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (local : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (((v_dedupeFixitiesGo ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (m : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = (String.concat "" [(Loader_dModules.v_moduleNameOf m); "|"; (v_fixityDeclKey d)]); B_dData_dPair.f_Pair_second = d })) (Loader_dModules.v_moduleFixitiesOf m)))) modules)) ((B_dData_dList.v_map (fun (d : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = ("|entry|" ^ (v_fixityDeclKey d)); B_dData_dPair.f_Pair_second = d })) local))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 107 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isPrivateName = (fun (name : string) -> ((B_dData_dString.v_startsWith "_") name))

# 110 "Vuna/Compiler/Loader/Flatten.vuna"
let v_privateExportMsg = (fun (prefix : string) (sp : Base_dSource.t_Span) (name : string) -> ((((((Base_dDiag.v_diagAt sp) Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

# 122 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 134 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 155 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 147 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_typeKindAxiom = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | Frontend_dAst.C_Decl_DAxiom (dtb__69, dtb__70, dtb__71) -> (if (dtb__69 = mc0) then (v_kindEndsInType dtb__70) else ((v_typeKindAxiom mc0) dtb__68))
  | _ -> ((v_typeKindAxiom mc0) dtb__68)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findCtorNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if ((Frontend_dAst.v_ctorName dtb__72) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_ctorName dtb__72))) else ((v_findCtorNamed mc0) dtb__73))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findMethodNamed = (fun (mc0 : string) (mc1 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (match dtb__74 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb__76; Frontend_dAst.f_TraitMethod_traitMethodType = dtb__77; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb__78 } -> (if (dtb__76 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__76)) else ((v_findMethodNamed mc0) dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 193 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__103; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle mc0) dtb__103); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownCtorEntries mc0) mc1) dtb__104)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownDataCtorEntries = (fun (mc0 : string) (mc1 : string) (mc2 : string B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__105, dtb__106) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb__105; Loader_dModules.f_ExportEntry_target = (((Loader_dModules.v_ctorCanonical mc0) mc1) dtb__105); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle mc0) mc1) }, (((v_ownDataCtorEntries mc0) mc1) dtb__106)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownSelectorEntries = (fun (prefix : string) (all : Frontend_dAst.t_Decl B_dData_dList.t_List) (dname : string) -> ((B_dData_dList.v_map (fun (f : string) -> { Loader_dModules.f_ExportEntry_kind = "val"; Loader_dModules.f_ExportEntry_public = f; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle prefix) f); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle prefix) dname) })) ((Loader_dSelectors.v_selectedFieldNames all) dname)))

# 211 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 244 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ctorEntriesOfType = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (if (if (if ((dtb__131).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((dtb__131).Loader_dModules.f_ExportEntry_kind = "val")) then ((dtb__131).Loader_dModules.f_ExportEntry_parent = mc0) else false) then (B_dData_dList.C_List__x58__x58_ (dtb__131, ((v_ctorEntriesOfType mc0) dtb__132))) else ((v_ctorEntriesOfType mc0) dtb__132))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 279 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_isRecordDecl = (fun (mc0 : string) (mc1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (match dtb__133 with
  | Frontend_dAst.C_Decl_DRecord (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140, dtb__141, dtb__142) -> (if (dtb__135 = mc0) then true else ((v_isRecordDecl mc0) dtb__134))
  | _ -> ((v_isRecordDecl mc0) dtb__134)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 266 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 255 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 287 "Vuna/Compiler/Loader/Flatten.vuna"
let v_refEntryList = (fun (mc0 : string) (mc1 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (match dtb__165 with
  | { Loader_dModules.f_ExportRef_refKind = dtb__166; Loader_dModules.f_ExportRef_refTarget = dtb__167; Loader_dModules.f_ExportRef_refParent = dtb__168 } -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = dtb__166; Loader_dModules.f_ExportEntry_public = mc0; Loader_dModules.f_ExportEntry_target = dtb__167; Loader_dModules.f_ExportEntry_parent = dtb__168 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedTypeRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = ((v_findOwnData name) decls) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Obj.magic (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "type") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((B_dData_dPair.v_secondOf p)).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = "" }))))))
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match dtb__169 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__170); Loader_dModules.f_ExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 333 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 313 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef2 = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (let nd_uscrut5 = (((v_ownCtorEntriesNamed prefix) name) decls) in (match nd_uscrut5 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Obj.magic (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs prefix) "name") name) pairs)) (fun (p : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let e = (B_dData_dPair.v_secondOf p) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportRef_refTarget = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (e).Loader_dModules.f_ExportEntry_parent })))))))
)))
  | B_dData_dList.C_List__x58__x58_ (dtb__196, dtb__197) -> (match dtb__197 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructorExport (name))) name)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "ctor"; Loader_dModules.f_ExportRef_refTarget = (dtb__196).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (dtb__196).Loader_dModules.f_ExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 304 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) -> (match ((v_findOwnFn name) decls) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (if ((v_typeKindAxiom name) decls) then "type" else "val"); Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle prefix) dtb__200); Loader_dModules.f_ExportRef_refParent = "" }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ownOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Loader/Flatten.vuna"
let v_bareEntries = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (prefix : string) (name : string) (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((B_dData_dList.v_append entries) (((v_ownSelectorEntries prefix) decls) name)))

# 385 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameExportEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = (e).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (e).Loader_dModules.f_ExportEntry_parent })

# 389 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameTypeEntry = (fun (public : string) (e : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = public; Loader_dModules.f_ExportEntry_target = (e).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" })

# 405 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isEmptyEntries = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSelective = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (m : string) (base : string) (name : string) (sp : Base_dSource.t_Span) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf modules) m)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let values = ((B_dData_dList.v_map (v_renameExportEntry base)) ((Loader_dModules.v_findExportValues es) base)) in (let types = ((B_dData_dList.v_map (v_renameTypeEntry base)) ((Loader_dModules.v_findExportTypes es) base)) in (let entries = ((B_dData_dList.v_append values) types) in (if (v_isEmptyEntries entries) then (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name) else (Base_dDiag.C_Check_OkC (entries)))))))))

# 459 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_hasImportOf = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__203, dtb__204) -> (if ((Frontend_dAst.v_importName dtb__203) = mc1) then true else ((v_hasImportOf dtb__204) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_namespaceImportsGo = (fun (mc0 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc1 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (mc2 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__205 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb__207, dtb__208, dtb__209) -> (if (if ((v_hasImportOf mc0) dtb__207) then true else ((v_hasImportOf mc2) dtb__207)) then (((v_namespaceImportsGo mc0) dtb__206) mc2) else (((v_namespaceImportsGo mc0) dtb__206) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb__207; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = dtb__208; Frontend_dAst.f_Import_importRef = dtb__209 }, mc2))))
  | _ -> (((v_namespaceImportsGo mc0) dtb__206) mc2)
)
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 447 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceImportsOf = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (items : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> ((B_dData_dList.v_append imports) (B_dData_dList.v_reverse (((v_namespaceImportsGo imports) items) B_dData_dList.C_List_Nil))))

# 471 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_joinCommaNames = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (match dtb__211 with
  | B_dData_dList.C_List_Nil -> dtb__210
  | _ -> (String.concat "" [dtb__210; ", "; (v_joinCommaNames dtb__211)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveImportPrefix = (fun (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (prefix : string) -> (let nd_uscrut2 = ((Loader_dModules.v_qualifierCandidates imports) prefix) in (match nd_uscrut2 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (prefix))) prefix)
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__213 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb__212))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (prefix, (v_joinCommaNames nd_uscrut2)))) prefix) (v_joinCommaNames nd_uscrut2))
)
  | _ -> failwith "DT: impossible branch"
)))

# 357 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportBare = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (match dtb__214 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ownOrImportedTypeRef modules) prefix) decls) imports) name)) (fun (tr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_ownOrImportedValueRef modules) prefix) decls) imports) name)) (fun (vr : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match tr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match vr with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name))
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

# 409 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTypeAll = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (prefix : string) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (name : string) (sp : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot name)) with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (match dtb__219 with
  | B_dData_dList.C_List_Nil -> (match ((((v_ownTypeEntries decls) prefix) decls) name) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__221) -> (Base_dDiag.C_Check_OkC (dtb__221))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType modules) imports) name)) (fun (pairs : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match pairs with
  | B_dData_dList.C_List_Nil -> (Obj.magic (((Base_dDiagnostics_dRn.v_rnAt1 sp) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (name))) name))
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

# 496 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceEntry = (fun (path : string) (target : string) -> { Loader_dModules.f_ExportEntry_kind = "module"; Loader_dModules.f_ExportEntry_public = path; Loader_dModules.f_ExportEntry_target = target; Loader_dModules.f_ExportEntry_parent = "" })

# 500 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_filterExportMembers = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__223, dtb__224) -> (if (if ((dtb__223).Loader_dModules.f_ExportEntry_kind = "ctor") then (B_dData_dBool.v_not ((B_dData_dList.v_memName (dtb__223).Loader_dModules.f_ExportEntry_public) mc0)) else false) then ((v_filterExportMembers mc0) dtb__224) else (B_dData_dList.C_List__x58__x58_ (dtb__223, ((v_filterExportMembers mc0) dtb__224))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 511 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportEntryKey = (fun (e : Loader_dModules.t_ExportEntry) -> (String.concat "" [(e).Loader_dModules.f_ExportEntry_kind; "|"; (e).Loader_dModules.f_ExportEntry_public; "|"; (e).Loader_dModules.f_ExportEntry_target; "|"; (e).Loader_dModules.f_ExportEntry_parent]))

# 514 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeByFullKey = (fun (mc0 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (mc1 : (string, int) B_dContainer_dHashMap.t_HashMap) (mc2 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__238, dtb__239) -> (let key = (v_exportEntryKey dtb__238) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__240) -> (((v_dedupeByFullKey dtb__239) mc1) mc2)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeByFullKey dtb__239) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) key) 1) mc1)) (B_dData_dList.C_List__x58__x58_ (dtb__238, mc2)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeExportEntries = (fun (entries : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (((v_dedupeByFullKey entries) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 532 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exportItemsAll = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__241, dtb__242) -> ((Base_dCommon.v_bind (((((v_exportItemEntries mc0) mc1) mc2) mc3) dtb__241)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) dtb__242)) (fun (tail : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append es) tail)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 523 "Vuna/Compiler/Loader/Flatten.vuna"
let v_explicitExports = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : string) (mc2 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc3 : Frontend_dAst.t_Import B_dData_dList.t_List) (mc4 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> ((Base_dCommon.v_bind (((((v_exportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((v_dedupeExportEntries es)))))
))

# 539 "Vuna/Compiler/Loader/Flatten.vuna"
let v_validateModuleHeader = (fun (mc0 : string) (mc1 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__243) -> (match dtb__243 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb__244; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb__245; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb__246; Frontend_dAst.f_ModDecl_modDeclExports = dtb__247; Frontend_dAst.f_ModDecl_modDeclReexports = dtb__248; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb__249; Frontend_dAst.f_ModDecl_modDeclRef = dtb__250 } -> (if (dtb__244 = mc0) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb__250)) (Base_dDiagnostics_dRn.C_RnErr_ModuleNameMismatch (dtb__244))) dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 547 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 555 "Vuna/Compiler/Loader/Flatten.vuna"
let v_abstractOpaquePrefix = ":"

# 558 "Vuna/Compiler/Loader/Flatten.vuna"
let v_opaqueBaseName = (fun (name : string) -> (if ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name) then (((dtp_substring (String.length v_abstractOpaquePrefix)) ((String.length name) - (String.length v_abstractOpaquePrefix))) name) else name))

# 568 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isAbstractOpaqueName = (fun (name : string) -> ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) name))

# 572 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withSelectors = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Loader_dSelectors.v_selectorDecls decls)) (fun (gen : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append decls) gen))))))

# 590 "Vuna/Compiler/Loader/Flatten.vuna"
let v_notEmpty = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__253, dtb__254) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 576 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 600 "Vuna/Compiler/Loader/Flatten.vuna"
let v_showCycle = (fun (name : string) (stack : string B_dData_dList.t_List) -> (Base_dSource.v_joinArrows (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (name, stack)))))

# 620 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_implicitPreludeEnabled = (fun (mc0 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__277, dtb__278) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb__277) = mc1) then (dtb__277).Frontend_dPackages_dPkg.f_Root_rootImplicitPrelude else ((v_implicitPreludeEnabled dtb__278) mc1))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 633 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeDeps = (fun (mc0 : string) (mc1 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__279, dtb__280) -> (match dtb__280 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = "Prelude"; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousPrelude ((Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf (Obj.magic c))))) mc1))))) (Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (c : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf (Obj.magic c))))) mc1))))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 625 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom = (fun (dtb_u_u514 : string) (dtb_u_u517 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u518 : string) -> (Obj.repr ((fun (dtb_u_u523 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u526 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect dtb_u_u514) dtb_u_u517) "Prelude") dtb_u_u518) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u523) in (let dtb_u_u527 = (B_dData_dPair.v_firstOf dtb_u_u526) in (let dtb_u_u529 = ((v_implicitPreludeDeps dtb_u_u518) ((B_dData_dList.v_filter (fun (dtb_u_u531 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf (Obj.magic dtb_u_u531))) <> dtb_u_u518))) dtb_u_u527)) in dtb_u_u529)))))))

# 625 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) _u_ueffTok -> (let dtb_u_u526 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect nFs) roots) "Prelude") importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) _u_ueffTok) in (let dtb_u_u527 = (B_dData_dPair.v_firstOf dtb_u_u526) in (let dtb_u_u529 = ((v_implicitPreludeDeps importerPkg) ((B_dData_dList.v_filter (fun (dtb_u_u531 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf (Obj.magic dtb_u_u531))) <> importerPkg))) dtb_u_u527)) in dtb_u_u529))))

# 609 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude = (fun (dtb_u_u532 : string) (dtb_u_u535 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u536 : string) (dtb_u_u537 : string) (dtb_u_u538 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (B_dData_dBool.v_not ((v_implicitPreludeEnabled dtb_u_u535) dtb_u_u536)) then (let dtb_u_u540 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u541 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u540)))) else (if (dtb_u_u537 = "Prelude") then (let dtb_u_u543 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u544 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u543)))) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames dtb_u_u538)) then (let dtb_u_u546 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u547 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u546)))) else (((v_implicitPreludeFrom dtb_u_u532) dtb_u_u535) dtb_u_u536)))))

# 609 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) _u_ueffTok -> (if (B_dData_dBool.v_not ((v_implicitPreludeEnabled roots) importerPkg)) then (let dtb_u_u540 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u540) else (if (currentName = "Prelude") then (let dtb_u_u543 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u543) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames imports)) then (let dtb_u_u546 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u546) else ((Obj.magic (((v_implicitPreludeFrom nFs) roots) importerPkg)) _u_ueffTok)))))

# 643 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withLayerCheck = (fun (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (project : Loader_dModules.t_Project) -> ((Base_dCommon.v_bind ((Loader_dLayers.v_checkProjectLayers roots) project)) (fun (_u : B_dData_dUnit.t_Unit) -> (Base_dDiag.C_Check_OkC (project)))))

# 647 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withImportSpan = (fun (imp : Frontend_dAst.t_Import) (e : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan imp)) = "") then e else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan imp)) e)))

# 652 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loaderFuel = 1048576

# 678 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_nsTakeLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__283, dtb__284) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__283, ((v_nsTakeLocal (mc0 - 1)) dtb__284))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 669 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_pathPrefixOf = (fun (dtb_u_u557 : string) (dtb_u_u560 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u561 : string) (dtb_u_u562 : string B_dData_dList.t_List) (dtb_u_u563 : int) -> (if (dtb_u_u563 < 1) then (let dtb_u_u565 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u566 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u565)))) else (Obj.repr ((fun (dtb_u_u571 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u574 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect dtb_u_u557) dtb_u_u560) (Base_dSource.v_joinDots ((v_nsTakeLocal dtb_u_u563) dtb_u_u562))) dtb_u_u561) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u571) in (if (v_notEmpty (B_dData_dPair.v_firstOf dtb_u_u574)) then (let dtb_u_u576 = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal dtb_u_u563) dtb_u_u562)); B_dData_dPair.f_Pair_second = dtb_u_u563 })) in dtb_u_u576) else ((Obj.magic (((((v_pathPrefixOf dtb_u_u557) dtb_u_u560) dtb_u_u561) dtb_u_u562) (dtb_u_u563 - 1))) dtb_u_u571))))))))
# 669 "Vuna/Compiler/Loader/Flatten.vuna"
and v_pathPrefixOf_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (segs : string B_dData_dList.t_List) (n : int) _u_ueffTok -> (if (n < 1) then (let dtb_u_u565 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u565) else (let dtb_u_u574 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect nFs) roots) (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs))) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) _u_ueffTok) in (if (v_notEmpty (B_dData_dPair.v_firstOf dtb_u_u574)) then (let dtb_u_u576 = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs)); B_dData_dPair.f_Pair_second = n })) in dtb_u_u576) else ((Obj.magic (((((v_pathPrefixOf nFs) roots) importerPkg) segs) (n - 1))) _u_ueffTok)))))

# 682 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsDropLocal = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288) -> (if (mc0 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb__287, dtb__288)) else ((v_nsDropLocal (mc0 - 1)) dtb__288))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 655 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_loadAll = (fun (dtb_u_u582 : string) (dtb_u_u585 : int) (dtb_u_u586 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u587 : string) (dtb_u_u588 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u589 : string B_dData_dList.t_List) (dtb_u_u590 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (dtb_u_u585 <= 0) then (let dtb_u_u592 = (Base_dDiag.v_icFuel "loader") in (Obj.repr ((fun (dtb_u_u593 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u592)))) else (match dtb_u_u590 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u595 = (Base_dDiag.C_Check_OkC (dtb_u_u588)) in (Obj.repr ((fun (dtb_u_u596 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u595))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u597, dtb_u_u598) -> (Obj.repr ((fun (dtb_u_u603 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u606 = ((((((((v_loadModule_u_udirect dtb_u_u582) (dtb_u_u585 - 1)) dtb_u_u586) dtb_u_u587) dtb_u_u588) dtb_u_u589) dtb_u_u597) dtb_u_u603) in (match dtb_u_u606 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u607) -> (let dtb_u_u609 = (Base_dDiag.C_Check_ErrC (dtb_u_u607)) in dtb_u_u609)
  | Base_dDiag.C_Check_OkC (dtb_u_u611) -> ((Obj.magic (((((((v_loadAll dtb_u_u582) (dtb_u_u585 - 1)) dtb_u_u586) dtb_u_u587) dtb_u_u611) dtb_u_u589) dtb_u_u598)) dtb_u_u603)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
# 686 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadModule = (fun (dtb_u_u612 : string) (dtb_u_u615 : int) (dtb_u_u616 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u617 : string) (dtb_u_u618 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u619 : string B_dData_dList.t_List) (dtb_u_u620 : Frontend_dAst.t_Import) -> (let dtb_u_u621 = (Frontend_dAst.v_importName dtb_u_u620) in (if (dtb_u_u615 <= 0) then (let dtb_u_u623 = (Base_dDiag.v_icFuel "loader") in (Obj.repr ((fun (dtb_u_u624 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u623)))) else (match ((Loader_dModules.v_findModule dtb_u_u618) dtb_u_u621) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u625) -> (if (((Loader_dModules.v_moduleVisibleTo dtb_u_u616) dtb_u_u617) dtb_u_u625) then (let dtb_u_u627 = (Base_dDiag.C_Check_OkC (dtb_u_u618)) in (Obj.repr ((fun (dtb_u_u628 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u627)))) else (let dtb_u_u630 = ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb_u_u620)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (dtb_u_u621, (Loader_dModules.v_modulePackageOf dtb_u_u625)))) dtb_u_u621) (Loader_dModules.v_modulePackageOf dtb_u_u625))) in (Obj.repr ((fun (dtb_u_u631 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u630)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName dtb_u_u621) dtb_u_u619) then (let dtb_u_u633 = ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb_u_u620)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ImportCycle (((v_showCycle dtb_u_u621) dtb_u_u619)))) ((v_showCycle dtb_u_u621) dtb_u_u619))) in (Obj.repr ((fun (dtb_u_u634 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u633)))) else (if (Loader_dModules.v_validModuleName dtb_u_u621) then (Obj.repr ((fun (dtb_u_u639 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u642 = ((((((Loader_dModules.v_findModuleFile_u_udirect dtb_u_u612) dtb_u_u616) dtb_u_u621) dtb_u_u617) (Frontend_dAst.v_importSpan dtb_u_u620)) dtb_u_u639) in (match dtb_u_u642 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u643) -> (match (dtb_u_u620).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u645 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u645)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u647) -> (let dtb_u_u655 = ((((((v_pathPrefixOf_u_udirect dtb_u_u612) dtb_u_u616) dtb_u_u617) (Base_dSource.v_splitOnDot dtb_u_u621)) ((B_dData_dList.v_length (Base_dSource.v_splitOnDot dtb_u_u621)) - 1)) dtb_u_u639) in (let dtb_u_u656 = dtb_u_u655 in (match dtb_u_u656 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u657) -> (match dtb_u_u657 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u658; B_dData_dPair.f_Pair_second = dtb_u_u659 } -> (let dtb_u_u667 = ((((((((v_loadModule_u_udirect dtb_u_u612) (dtb_u_u615 - 1)) dtb_u_u616) dtb_u_u617) dtb_u_u618) dtb_u_u619) { Frontend_dAst.f_Import_importName = dtb_u_u658; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan dtb_u_u620)) }) dtb_u_u639) in (match dtb_u_u667 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u668) -> (let dtb_u_u670 = (Base_dDiag.C_Check_ErrC (dtb_u_u668)) in dtb_u_u670)
  | Base_dDiag.C_Check_OkC (dtb_u_u672) -> (match ((Loader_dModules.v_findModule dtb_u_u672) dtb_u_u658) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u674 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u674)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u676) -> (match (((Loader_dModules.v_walkNamespaceIndex dtb_u_u672) dtb_u_u658) ((v_nsDropLocal dtb_u_u659) (Base_dSource.v_splitOnDot dtb_u_u621))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u678 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u678)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u680) -> ((Obj.magic (((((((v_loadModule dtb_u_u612) (dtb_u_u615 - 1)) dtb_u_u616) dtb_u_u617) dtb_u_u672) dtb_u_u619) { Frontend_dAst.f_Import_importName = dtb_u_u680; Frontend_dAst.f_Import_importIsQualified = true; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan dtb_u_u620)) })) dtb_u_u639)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u682 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u682)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb_u_u684) -> (let dtb_u_u685 = (B_dData_dPair.v_firstOf dtb_u_u684) in (let dtb_u_u686 = (B_dData_dPair.v_secondOf dtb_u_u684) in (let dtb_u_u687 = (if ((dtp_log_on 3) "Vuna.Compiler.Loader.Flatten") then (((dtp_log_emit 3) "Vuna.Compiler.Loader.Flatten") ("parse-module=" ^ dtb_u_u621)) else 0) in (let dtb_u_u695 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u612) dtb_u_u685) dtb_u_u639) in (let dtb_u_u703 = ((((v_parseFileWithPath_u_udirect dtb_u_u612) dtb_u_u685) dtb_u_u695) dtb_u_u639) in (match dtb_u_u703 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u704) -> (let dtb_u_u706 = (Base_dDiag.C_Check_ErrC (dtb_u_u704)) in dtb_u_u706)
  | Base_dDiag.C_Check_OkC (dtb_u_u708) -> (let dtb_u_u709 = (B_dData_dPair.v_firstOf dtb_u_u708) in (let dtb_u_u710 = (B_dData_dPair.v_secondOf dtb_u_u708) in (let dtb_u_u711 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u712 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u713 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u714 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u715 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u716 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u717 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u718 = ((v_namespaceImportsOf dtb_u_u712) dtb_u_u716) in (match ((v_validateModuleHeader dtb_u_u621) dtb_u_u711) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u719) -> (let dtb_u_u721 = (Base_dDiag.C_Check_ErrC (dtb_u_u719)) in dtb_u_u721)
  | Base_dDiag.C_Check_OkC (dtb_u_u723) -> (match ((Loader_dModules.v_validateImports dtb_u_u621) dtb_u_u718) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u724) -> (let dtb_u_u726 = (Base_dDiag.C_Check_ErrC (dtb_u_u724)) in dtb_u_u726)
  | Base_dDiag.C_Check_OkC (dtb_u_u728) -> (let dtb_u_u736 = ((((((v_implicitPrelude_u_udirect dtb_u_u612) dtb_u_u616) (Frontend_dPackages_dPkg.v_rootName dtb_u_u686)) dtb_u_u621) dtb_u_u718) dtb_u_u639) in (match dtb_u_u736 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u737) -> (let dtb_u_u739 = (Base_dDiag.C_Check_ErrC (dtb_u_u737)) in dtb_u_u739)
  | Base_dDiag.C_Check_OkC (dtb_u_u741) -> (let dtb_u_u749 = ((((((((v_loadAll_u_udirect dtb_u_u612) (dtb_u_u615 - 1)) dtb_u_u616) (Frontend_dPackages_dPkg.v_rootName dtb_u_u686)) dtb_u_u618) (B_dData_dList.C_List__x58__x58_ (dtb_u_u621, dtb_u_u619))) ((B_dData_dList.v_append dtb_u_u718) dtb_u_u741)) dtb_u_u639) in (match dtb_u_u749 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u750) -> (let dtb_u_u752 = (Base_dDiag.C_Check_ErrC (dtb_u_u750)) in dtb_u_u752)
  | Base_dDiag.C_Check_OkC (dtb_u_u754) -> (let dtb_u_u755 = ((Loader_dModules.v_normalizeImports dtb_u_u754) dtb_u_u718) in (match (v_withSelectors dtb_u_u714) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u756) -> (let dtb_u_u758 = (Base_dDiag.C_Check_ErrC (dtb_u_u756)) in dtb_u_u758)
  | Base_dDiag.C_Check_OkC (dtb_u_u760) -> (match (((((((v_computeExports dtb_u_u754) dtb_u_u621) dtb_u_u711) dtb_u_u755) dtb_u_u714) dtb_u_u715) dtb_u_u716) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u761) -> (let dtb_u_u763 = (Base_dDiag.C_Check_ErrC (dtb_u_u761)) in dtb_u_u763)
  | Base_dDiag.C_Check_OkC (dtb_u_u765) -> (let dtb_u_u766 = dtb_u_u713 in (let dtb_u_u768 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb_u_u621; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_rootName dtb_u_u686); Loader_dModules.f_Module_moduleImportsOf = dtb_u_u755; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb_u_u741; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u760; Loader_dModules.f_Module_moduleExportsOf = dtb_u_u765; Loader_dModules.f_Module_moduleFixitiesOf = dtb_u_u766; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append ((Loader_dModules.v_reexportedImportNamesOfHeader dtb_u_u755) dtb_u_u711)) ((Loader_dModules.v_reexportedImportNames dtb_u_u755) dtb_u_u716)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb_u_u621) dtb_u_u717); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb_u_u765); Loader_dModules.f_Module_moduleFixFactsOf = dtb_u_u710 }, dtb_u_u754)))) in dtb_u_u768))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
))))) else (let dtb_u_u771 = ((Base_dDiag.v_onErrDiag (v_withImportSpan dtb_u_u620)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_InvalidModuleName (dtb_u_u621))) dtb_u_u621)) in (Obj.repr ((fun (dtb_u_u772 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u771))))))
  | _ -> failwith "DT: impossible branch"
))))
# 655 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadAll_u_udirect = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u592 = (Base_dDiag.v_icFuel "loader") in dtb_u_u592) else (match imports with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u595 = (Base_dDiag.C_Check_OkC (modules)) in dtb_u_u595)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u597, dtb_u_u598) -> (let dtb_u_u606 = ((((((((v_loadModule_u_udirect nFs) (fuel - 1)) roots) importerPkg) modules) stack) dtb_u_u597) _u_ueffTok) in (match dtb_u_u606 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u607) -> (let dtb_u_u609 = (Base_dDiag.C_Check_ErrC (dtb_u_u607)) in dtb_u_u609)
  | Base_dDiag.C_Check_OkC (dtb_u_u611) -> ((Obj.magic (((((((v_loadAll nFs) (fuel - 1)) roots) importerPkg) dtb_u_u611) stack) dtb_u_u598)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 686 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadModule_u_udirect = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) _u_ueffTok -> (let dtb_u_u621 = (Frontend_dAst.v_importName imp) in (if (fuel <= 0) then (let dtb_u_u623 = (Base_dDiag.v_icFuel "loader") in dtb_u_u623) else (match ((Loader_dModules.v_findModule modules) dtb_u_u621) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u625) -> (if (((Loader_dModules.v_moduleVisibleTo roots) importerPkg) dtb_u_u625) then (let dtb_u_u627 = (Base_dDiag.C_Check_OkC (modules)) in dtb_u_u627) else (let dtb_u_u630 = ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) (((Base_dDiagnostics_dLoader.v_ldErr2 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleNotExported (dtb_u_u621, (Loader_dModules.v_modulePackageOf dtb_u_u625)))) dtb_u_u621) (Loader_dModules.v_modulePackageOf dtb_u_u625))) in dtb_u_u630))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((B_dData_dList.v_memName dtb_u_u621) stack) then (let dtb_u_u633 = ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ImportCycle (((v_showCycle dtb_u_u621) stack)))) ((v_showCycle dtb_u_u621) stack))) in dtb_u_u633) else (if (Loader_dModules.v_validModuleName dtb_u_u621) then (let dtb_u_u642 = ((((((Loader_dModules.v_findModuleFile_u_udirect nFs) roots) dtb_u_u621) importerPkg) (Frontend_dAst.v_importSpan imp)) _u_ueffTok) in (match dtb_u_u642 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u643) -> (match (imp).Frontend_dAst.f_Import_importAlias with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u645 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u645)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u647) -> (let dtb_u_u655 = ((((((v_pathPrefixOf_u_udirect nFs) roots) importerPkg) (Base_dSource.v_splitOnDot dtb_u_u621)) ((B_dData_dList.v_length (Base_dSource.v_splitOnDot dtb_u_u621)) - 1)) _u_ueffTok) in (let dtb_u_u656 = dtb_u_u655 in (match dtb_u_u656 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u657) -> (match dtb_u_u657 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u658; B_dData_dPair.f_Pair_second = dtb_u_u659 } -> (let dtb_u_u667 = ((((((((v_loadModule_u_udirect nFs) (fuel - 1)) roots) importerPkg) modules) stack) { Frontend_dAst.f_Import_importName = dtb_u_u658; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) }) _u_ueffTok) in (match dtb_u_u667 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u668) -> (let dtb_u_u670 = (Base_dDiag.C_Check_ErrC (dtb_u_u668)) in dtb_u_u670)
  | Base_dDiag.C_Check_OkC (dtb_u_u672) -> (match ((Loader_dModules.v_findModule dtb_u_u672) dtb_u_u658) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u674 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u674)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u676) -> (match (((Loader_dModules.v_walkNamespaceIndex dtb_u_u672) dtb_u_u658) ((v_nsDropLocal dtb_u_u659) (Base_dSource.v_splitOnDot dtb_u_u621))) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u678 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u678)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u680) -> ((Obj.magic (((((((v_loadModule nFs) (fuel - 1)) roots) importerPkg) dtb_u_u672) stack) { Frontend_dAst.f_Import_importName = dtb_u_u680; Frontend_dAst.f_Import_importIsQualified = true; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = (Frontend_dAst.v_detachedNodeRef (Frontend_dAst.v_importSpan imp)) })) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u682 = (Base_dDiag.C_Check_ErrC (dtb_u_u643)) in dtb_u_u682)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_OkC (dtb_u_u684) -> (let dtb_u_u685 = (B_dData_dPair.v_firstOf dtb_u_u684) in (let dtb_u_u686 = (B_dData_dPair.v_secondOf dtb_u_u684) in (let dtb_u_u687 = (if ((dtp_log_on 3) "Vuna.Compiler.Loader.Flatten") then (((dtp_log_emit 3) "Vuna.Compiler.Loader.Flatten") ("parse-module=" ^ dtb_u_u621)) else 0) in (let dtb_u_u695 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u685) _u_ueffTok) in (let dtb_u_u703 = ((((v_parseFileWithPath_u_udirect nFs) dtb_u_u685) dtb_u_u695) _u_ueffTok) in (match dtb_u_u703 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u704) -> (let dtb_u_u706 = (Base_dDiag.C_Check_ErrC (dtb_u_u704)) in dtb_u_u706)
  | Base_dDiag.C_Check_OkC (dtb_u_u708) -> (let dtb_u_u709 = (B_dData_dPair.v_firstOf dtb_u_u708) in (let dtb_u_u710 = (B_dData_dPair.v_secondOf dtb_u_u708) in (let dtb_u_u711 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u712 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u713 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u714 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u715 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u716 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u717 = (dtb_u_u709).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u718 = ((v_namespaceImportsOf dtb_u_u712) dtb_u_u716) in (match ((v_validateModuleHeader dtb_u_u621) dtb_u_u711) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u719) -> (let dtb_u_u721 = (Base_dDiag.C_Check_ErrC (dtb_u_u719)) in dtb_u_u721)
  | Base_dDiag.C_Check_OkC (dtb_u_u723) -> (match ((Loader_dModules.v_validateImports dtb_u_u621) dtb_u_u718) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u724) -> (let dtb_u_u726 = (Base_dDiag.C_Check_ErrC (dtb_u_u724)) in dtb_u_u726)
  | Base_dDiag.C_Check_OkC (dtb_u_u728) -> (let dtb_u_u736 = ((((((v_implicitPrelude_u_udirect nFs) roots) (Frontend_dPackages_dPkg.v_rootName dtb_u_u686)) dtb_u_u621) dtb_u_u718) _u_ueffTok) in (match dtb_u_u736 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u737) -> (let dtb_u_u739 = (Base_dDiag.C_Check_ErrC (dtb_u_u737)) in dtb_u_u739)
  | Base_dDiag.C_Check_OkC (dtb_u_u741) -> (let dtb_u_u749 = ((((((((v_loadAll_u_udirect nFs) (fuel - 1)) roots) (Frontend_dPackages_dPkg.v_rootName dtb_u_u686)) modules) (B_dData_dList.C_List__x58__x58_ (dtb_u_u621, stack))) ((B_dData_dList.v_append dtb_u_u718) dtb_u_u741)) _u_ueffTok) in (match dtb_u_u749 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u750) -> (let dtb_u_u752 = (Base_dDiag.C_Check_ErrC (dtb_u_u750)) in dtb_u_u752)
  | Base_dDiag.C_Check_OkC (dtb_u_u754) -> (let dtb_u_u755 = ((Loader_dModules.v_normalizeImports dtb_u_u754) dtb_u_u718) in (match (v_withSelectors dtb_u_u714) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u756) -> (let dtb_u_u758 = (Base_dDiag.C_Check_ErrC (dtb_u_u756)) in dtb_u_u758)
  | Base_dDiag.C_Check_OkC (dtb_u_u760) -> (match (((((((v_computeExports dtb_u_u754) dtb_u_u621) dtb_u_u711) dtb_u_u755) dtb_u_u714) dtb_u_u715) dtb_u_u716) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u761) -> (let dtb_u_u763 = (Base_dDiag.C_Check_ErrC (dtb_u_u761)) in dtb_u_u763)
  | Base_dDiag.C_Check_OkC (dtb_u_u765) -> (let dtb_u_u766 = dtb_u_u713 in (let dtb_u_u768 = (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb_u_u621; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_rootName dtb_u_u686); Loader_dModules.f_Module_moduleImportsOf = dtb_u_u755; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb_u_u741; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u760; Loader_dModules.f_Module_moduleExportsOf = dtb_u_u765; Loader_dModules.f_Module_moduleFixitiesOf = dtb_u_u766; Loader_dModules.f_Module_moduleReexportsOf = ((B_dData_dList.v_append ((Loader_dModules.v_reexportedImportNamesOfHeader dtb_u_u755) dtb_u_u711)) ((Loader_dModules.v_reexportedImportNames dtb_u_u755) dtb_u_u716)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb_u_u621) dtb_u_u717); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb_u_u765); Loader_dModules.f_Module_moduleFixFactsOf = dtb_u_u710 }, dtb_u_u754)))) in dtb_u_u768))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u771 = ((Base_dDiag.v_onErrDiag (v_withImportSpan imp)) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_InvalidModuleName (dtb_u_u621))) dtb_u_u621)) in dtb_u_u771)))
  | _ -> failwith "DT: impossible branch"
))))

# 785 "Vuna/Compiler/Loader/Flatten.vuna"
let v_entryScopeOf = (fun (pkg : string) (path : string) -> (let name = (((B_dData_dList.v_foldl (fun (acc : string) (seg : string) -> (Obj.magic seg))) path) ((B_dData_dString.v_split "/") path)) in (if ((B_dData_dString.v_endsWith ".vuna") name) then (((B_dData_dString.v_substring 0) ((B_dData_dNat.v_minus (B_dData_dString.v_byteLength name)) 5)) name) else (if (name = "") then pkg else name))))

# 797 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectWithPreloaded = (fun (dtb_u_u778 : string) (dtb_u_u781 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u782 : string) (dtb_u_u783 : Loader_dModules.t_Module B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u788 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u791 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u778) dtb_u_u782) dtb_u_u788) in (if dtb_u_u791 then (let dtb_u_u799 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u778) dtb_u_u782) dtb_u_u788) in (let dtb_u_u807 = ((((v_parseFileWithPath_u_udirect dtb_u_u778) dtb_u_u782) dtb_u_u799) dtb_u_u788) in (match dtb_u_u807 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u808) -> (let dtb_u_u810 = (Base_dDiag.C_Check_ErrC (dtb_u_u808)) in dtb_u_u810)
  | Base_dDiag.C_Check_OkC (dtb_u_u812) -> (let dtb_u_u813 = (B_dData_dPair.v_firstOf dtb_u_u812) in (let dtb_u_u814 = (B_dData_dPair.v_secondOf dtb_u_u812) in (let dtb_u_u815 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u816 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u817 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u818 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u819 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u820 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u821 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u822 = dtb_u_u815 in (match dtb_u_u822 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") dtb_u_u816) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u823) -> (let dtb_u_u825 = (Base_dDiag.C_Check_ErrC (dtb_u_u823)) in dtb_u_u825)
  | Base_dDiag.C_Check_OkC (dtb_u_u827) -> (let dtb_u_u835 = ((((((v_implicitPrelude_u_udirect dtb_u_u778) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u781)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u781)) "") dtb_u_u816) dtb_u_u788) in (match dtb_u_u835 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u836) -> (let dtb_u_u838 = (Base_dDiag.C_Check_ErrC (dtb_u_u836)) in dtb_u_u838)
  | Base_dDiag.C_Check_OkC (dtb_u_u840) -> (let dtb_u_u848 = ((((((((v_loadAll_u_udirect dtb_u_u778) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u781)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u781)) dtb_u_u783) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u816) dtb_u_u840)) dtb_u_u788) in (let dtb_u_u850 = (match dtb_u_u848 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u852) -> (Base_dDiag.C_Check_ErrC (dtb_u_u852))
  | Base_dDiag.C_Check_OkC (dtb_u_u853) -> (let dtb_u_u854 = ((Loader_dModules.v_normalizeImports dtb_u_u853) dtb_u_u816) in (match (v_withSelectors dtb_u_u818) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u855) -> (Base_dDiag.C_Check_ErrC (dtb_u_u855))
  | Base_dDiag.C_Check_OkC (dtb_u_u856) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u781)) { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u856; Loader_dModules.f_Project_projectEntryImports = dtb_u_u854; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u840; Loader_dModules.f_Project_projectModules = dtb_u_u853; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u781); Loader_dModules.f_Project_projectEntryFixities = dtb_u_u817; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u781)) dtb_u_u782); Loader_dModules.f_Project_projectEntryFacts = dtb_u_u814 })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u850))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u857) -> (match dtb_u_u857 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u858; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u859; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u860; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u861; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u862; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u863; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u864 } -> (let dtb_u_u866 = ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u864))) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntryFile (dtb_u_u782))) dtb_u_u782)) in dtb_u_u866)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))) else (let dtb_u_u869 = ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_EntryFileNotFound (dtb_u_u782))) dtb_u_u782) in dtb_u_u869)))))))

# 797 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectWithPreloaded_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u791 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) entry) _u_ueffTok) in (if dtb_u_u791 then (let dtb_u_u799 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) entry) _u_ueffTok) in (let dtb_u_u807 = ((((v_parseFileWithPath_u_udirect nFs) entry) dtb_u_u799) _u_ueffTok) in (match dtb_u_u807 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u808) -> (let dtb_u_u810 = (Base_dDiag.C_Check_ErrC (dtb_u_u808)) in dtb_u_u810)
  | Base_dDiag.C_Check_OkC (dtb_u_u812) -> (let dtb_u_u813 = (B_dData_dPair.v_firstOf dtb_u_u812) in (let dtb_u_u814 = (B_dData_dPair.v_secondOf dtb_u_u812) in (let dtb_u_u815 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u816 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u817 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u818 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u819 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u820 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u821 = (dtb_u_u813).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u822 = dtb_u_u815 in (match dtb_u_u822 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") dtb_u_u816) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u823) -> (let dtb_u_u825 = (Base_dDiag.C_Check_ErrC (dtb_u_u823)) in dtb_u_u825)
  | Base_dDiag.C_Check_OkC (dtb_u_u827) -> (let dtb_u_u835 = ((((((v_implicitPrelude_u_udirect nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") dtb_u_u816) _u_ueffTok) in (match dtb_u_u835 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u836) -> (let dtb_u_u838 = (Base_dDiag.C_Check_ErrC (dtb_u_u836)) in dtb_u_u838)
  | Base_dDiag.C_Check_OkC (dtb_u_u840) -> (let dtb_u_u848 = ((((((((v_loadAll_u_udirect nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u816) dtb_u_u840)) _u_ueffTok) in (let dtb_u_u850 = (match dtb_u_u848 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u852) -> (Base_dDiag.C_Check_ErrC (dtb_u_u852))
  | Base_dDiag.C_Check_OkC (dtb_u_u853) -> (let dtb_u_u854 = ((Loader_dModules.v_normalizeImports dtb_u_u853) dtb_u_u816) in (match (v_withSelectors dtb_u_u818) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u855) -> (Base_dDiag.C_Check_ErrC (dtb_u_u855))
  | Base_dDiag.C_Check_OkC (dtb_u_u856) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u856; Loader_dModules.f_Project_projectEntryImports = dtb_u_u854; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u840; Loader_dModules.f_Project_projectModules = dtb_u_u853; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = dtb_u_u817; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) entry); Loader_dModules.f_Project_projectEntryFacts = dtb_u_u814 })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u850))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u857) -> (match dtb_u_u857 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u858; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u859; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u860; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u861; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u862; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u863; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u864 } -> (let dtb_u_u866 = ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_nodeRefSpan dtb_u_u864))) ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntryFile (entry))) entry)) in dtb_u_u866)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))) else (let dtb_u_u869 = ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_EntryFileNotFound (entry))) entry) in dtb_u_u869))))

# 780 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) -> ((((v_loadProjectWithPreloaded nFs) ctx) entry) B_dData_dList.C_List_Nil))

# 780 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> ((Obj.magic ((((v_loadProjectWithPreloaded nFs) ctx) entry) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 848 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded = (fun (dtb_u_u876 : string) (dtb_u_u879 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u880 : string B_dData_dList.t_List) (dtb_u_u881 : Loader_dModules.t_Module B_dData_dList.t_List) -> (let dtb_u_u882 = ((B_dData_dList.v_map (fun (dtb_u_u896 : string) -> { Frontend_dAst.f_Import_importName = dtb_u_u896; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) dtb_u_u880) in (Obj.repr ((fun (dtb_u_u887 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u890 = ((((((((v_loadAll_u_udirect dtb_u_u876) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u879)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u879)) dtb_u_u881) B_dData_dList.C_List_Nil) dtb_u_u882) dtb_u_u887) in (let dtb_u_u892 = (match dtb_u_u890 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u894) -> (Base_dDiag.C_Check_ErrC (dtb_u_u894))
  | Base_dDiag.C_Check_OkC (dtb_u_u895) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u879)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb_u_u895; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u879); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u879); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u892)))))))

# 848 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u882 = ((B_dData_dList.v_map (fun (dtb_u_u896 : string) -> { Frontend_dAst.f_Import_importName = dtb_u_u896; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) names) in (let dtb_u_u890 = ((((((((v_loadAll_u_udirect nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) dtb_u_u882) _u_ueffTok) in (let dtb_u_u892 = (match dtb_u_u890 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u894) -> (Base_dDiag.C_Check_ErrC (dtb_u_u894))
  | Base_dDiag.C_Check_OkC (dtb_u_u895) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb_u_u895; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u892))))

# 845 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) -> ((((v_loadProjectModulesWithPreloaded nFs) ctx) names) B_dData_dList.C_List_Nil))

# 845 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic ((((v_loadProjectModulesWithPreloaded nFs) ctx) names) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 867 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSourceWithPreloaded = (fun (dtb_u_u902 : string) (dtb_u_u905 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u906 : string) (dtb_u_u907 : string) (dtb_u_u908 : Loader_dModules.t_Module B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u913 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u916 = (((((v_parseFileWithPathMode_u_udirect dtb_u_u902) Frontend_dParser_dSupport.C_ParseMode_PmTool) dtb_u_u906) dtb_u_u907) dtb_u_u913) in (match dtb_u_u916 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u917) -> (let dtb_u_u919 = (Base_dDiag.C_Check_ErrC (dtb_u_u917)) in dtb_u_u919)
  | Base_dDiag.C_Check_OkC (dtb_u_u921) -> (let dtb_u_u922 = (B_dData_dPair.v_firstOf dtb_u_u921) in (let dtb_u_u923 = (B_dData_dPair.v_secondOf dtb_u_u921) in (let dtb_u_u924 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u925 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u926 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u927 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u928 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u929 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u930 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u931 = dtb_u_u924 in (match dtb_u_u931 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") dtb_u_u925) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u932) -> (let dtb_u_u934 = (Base_dDiag.C_Check_ErrC (dtb_u_u932)) in dtb_u_u934)
  | Base_dDiag.C_Check_OkC (dtb_u_u936) -> (let dtb_u_u944 = ((((((v_implicitPrelude_u_udirect dtb_u_u902) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u905)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u905)) "") dtb_u_u925) dtb_u_u913) in (match dtb_u_u944 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u945) -> (let dtb_u_u947 = (Base_dDiag.C_Check_ErrC (dtb_u_u945)) in dtb_u_u947)
  | Base_dDiag.C_Check_OkC (dtb_u_u949) -> (let dtb_u_u957 = ((((((((v_loadAll_u_udirect dtb_u_u902) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u905)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u905)) dtb_u_u908) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u925) dtb_u_u949)) dtb_u_u913) in (let dtb_u_u959 = (match dtb_u_u957 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u961) -> (Base_dDiag.C_Check_ErrC (dtb_u_u961))
  | Base_dDiag.C_Check_OkC (dtb_u_u962) -> (let dtb_u_u963 = ((Loader_dModules.v_normalizeImports dtb_u_u962) dtb_u_u925) in (match (v_withSelectors dtb_u_u927) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u964) -> (Base_dDiag.C_Check_ErrC (dtb_u_u964))
  | Base_dDiag.C_Check_OkC (dtb_u_u965) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u905)) { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u965; Loader_dModules.f_Project_projectEntryImports = dtb_u_u963; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u949; Loader_dModules.f_Project_projectModules = dtb_u_u962; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u905); Loader_dModules.f_Project_projectEntryFixities = dtb_u_u926; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u905)) dtb_u_u906); Loader_dModules.f_Project_projectEntryFacts = dtb_u_u923 })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u959))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u966) -> (match dtb_u_u966 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u967; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u968; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u969; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u970; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u971; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u972; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u973 } -> (let dtb_u_u975 = ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntrySource (dtb_u_u906))) dtb_u_u906) in dtb_u_u975)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 867 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSourceWithPreloaded_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u916 = (((((v_parseFileWithPathMode_u_udirect nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source) _u_ueffTok) in (match dtb_u_u916 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u917) -> (let dtb_u_u919 = (Base_dDiag.C_Check_ErrC (dtb_u_u917)) in dtb_u_u919)
  | Base_dDiag.C_Check_OkC (dtb_u_u921) -> (let dtb_u_u922 = (B_dData_dPair.v_firstOf dtb_u_u921) in (let dtb_u_u923 = (B_dData_dPair.v_secondOf dtb_u_u921) in (let dtb_u_u924 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u925 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u926 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u927 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u928 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u929 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u930 = (dtb_u_u922).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u931 = dtb_u_u924 in (match dtb_u_u931 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((Loader_dModules.v_validateImports "<entry>") dtb_u_u925) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u932) -> (let dtb_u_u934 = (Base_dDiag.C_Check_ErrC (dtb_u_u932)) in dtb_u_u934)
  | Base_dDiag.C_Check_OkC (dtb_u_u936) -> (let dtb_u_u944 = ((((((v_implicitPrelude_u_udirect nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) "") dtb_u_u925) _u_ueffTok) in (match dtb_u_u944 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u945) -> (let dtb_u_u947 = (Base_dDiag.C_Check_ErrC (dtb_u_u945)) in dtb_u_u947)
  | Base_dDiag.C_Check_OkC (dtb_u_u949) -> (let dtb_u_u957 = ((((((((v_loadAll_u_udirect nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u925) dtb_u_u949)) _u_ueffTok) in (let dtb_u_u959 = (match dtb_u_u957 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u961) -> (Base_dDiag.C_Check_ErrC (dtb_u_u961))
  | Base_dDiag.C_Check_OkC (dtb_u_u962) -> (let dtb_u_u963 = ((Loader_dModules.v_normalizeImports dtb_u_u962) dtb_u_u925) in (match (v_withSelectors dtb_u_u927) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u964) -> (Base_dDiag.C_Check_ErrC (dtb_u_u964))
  | Base_dDiag.C_Check_OkC (dtb_u_u965) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u965; Loader_dModules.f_Project_projectEntryImports = dtb_u_u963; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u949; Loader_dModules.f_Project_projectModules = dtb_u_u962; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = dtb_u_u926; Loader_dModules.f_Project_projectEntryName = ((v_entryScopeOf (Frontend_dPackages_dPkg.v_contextPackageName ctx)) label); Loader_dModules.f_Project_projectEntryFacts = dtb_u_u923 })
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u959))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u966) -> (match dtb_u_u966 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u967; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u968; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u969; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u970; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u971; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u972; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u973 } -> (let dtb_u_u975 = ((Base_dDiagnostics_dLoader.v_ldErr1 (Base_dDiagnostics_dLoader.C_LdDiag_ModuleHeaderInEntrySource (label))) label) in dtb_u_u975)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 863 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil))

# 863 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> ((Obj.magic (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 917 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSourceWithPreloaded = (fun (dtb_u_u983 : string) (dtb_u_u986 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u987 : string) (dtb_u_u988 : string) (dtb_u_u989 : Loader_dModules.t_Module B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u994 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u997 = (((((v_parseFileWithPathMode_u_udirect dtb_u_u983) Frontend_dParser_dSupport.C_ParseMode_PmTool) dtb_u_u987) dtb_u_u988) dtb_u_u994) in (match dtb_u_u997 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u998) -> (let dtb_u_u1000 = (Base_dDiag.C_Check_ErrC (dtb_u_u998)) in dtb_u_u1000)
  | Base_dDiag.C_Check_OkC (dtb_u_u1002) -> (let dtb_u_u1003 = (B_dData_dPair.v_firstOf dtb_u_u1002) in (let dtb_u_u1004 = (B_dData_dPair.v_secondOf dtb_u_u1002) in (let dtb_u_u1005 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u1006 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u1007 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u1008 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u1009 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u1010 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u1011 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u1012 = dtb_u_u1005 in (match dtb_u_u1012 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1013) -> (match dtb_u_u1013 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u1014; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u1015; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u1016; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u1017; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u1018; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u1019; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u1020 } -> (let dtb_u_u1021 = ((v_namespaceImportsOf dtb_u_u1006) dtb_u_u1010) in (match ((Loader_dModules.v_validateImports dtb_u_u1014) dtb_u_u1021) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1022) -> (let dtb_u_u1024 = (Base_dDiag.C_Check_ErrC (dtb_u_u1022)) in dtb_u_u1024)
  | Base_dDiag.C_Check_OkC (dtb_u_u1026) -> (let dtb_u_u1034 = ((((((v_implicitPrelude_u_udirect dtb_u_u983) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u986)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u986)) dtb_u_u1014) dtb_u_u1021) dtb_u_u994) in (match dtb_u_u1034 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1035) -> (let dtb_u_u1037 = (Base_dDiag.C_Check_ErrC (dtb_u_u1035)) in dtb_u_u1037)
  | Base_dDiag.C_Check_OkC (dtb_u_u1039) -> (let dtb_u_u1047 = ((((((((v_loadAll_u_udirect dtb_u_u983) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u986)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u986)) dtb_u_u989) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u1021) dtb_u_u1039)) dtb_u_u994) in (match dtb_u_u1047 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1048) -> (let dtb_u_u1050 = (Base_dDiag.C_Check_ErrC (dtb_u_u1048)) in dtb_u_u1050)
  | Base_dDiag.C_Check_OkC (dtb_u_u1052) -> (let dtb_u_u1053 = ((Loader_dModules.v_normalizeImports dtb_u_u1052) dtb_u_u1021) in (match (v_withSelectors dtb_u_u1008) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1054) -> (let dtb_u_u1056 = (Base_dDiag.C_Check_ErrC (dtb_u_u1054)) in dtb_u_u1056)
  | Base_dDiag.C_Check_OkC (dtb_u_u1058) -> (match (((((((v_computeExports dtb_u_u1052) dtb_u_u1014) dtb_u_u1005) dtb_u_u1053) dtb_u_u1008) dtb_u_u1009) dtb_u_u1010) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1059) -> (let dtb_u_u1061 = (Base_dDiag.C_Check_ErrC (dtb_u_u1059)) in dtb_u_u1061)
  | Base_dDiag.C_Check_OkC (dtb_u_u1063) -> (let dtb_u_u1064 = dtb_u_u1007 in (let dtb_u_u1066 = ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u986)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = dtb_u_u1053; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u1039; Loader_dModules.f_Project_projectModules = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb_u_u1014; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u986); Loader_dModules.f_Module_moduleImportsOf = dtb_u_u1053; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb_u_u1039; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u1058; Loader_dModules.f_Module_moduleExportsOf = dtb_u_u1063; Loader_dModules.f_Module_moduleFixitiesOf = dtb_u_u1064; Loader_dModules.f_Module_moduleReexportsOf = ((Loader_dModules.v_reexportedImportNames dtb_u_u1053) ((B_dData_dList.v_append dtb_u_u1016) dtb_u_u1010)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb_u_u1014) dtb_u_u1011); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb_u_u1063); Loader_dModules.f_Module_moduleFixFactsOf = dtb_u_u1004 }, dtb_u_u1052)); Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u986); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u986); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts }) in dtb_u_u1066))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((v_loadProjectSourceWithPreloaded dtb_u_u983) dtb_u_u986) dtb_u_u987) dtb_u_u988) dtb_u_u989)) dtb_u_u994)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 917 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSourceWithPreloaded_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u997 = (((((v_parseFileWithPathMode_u_udirect nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source) _u_ueffTok) in (match dtb_u_u997 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u998) -> (let dtb_u_u1000 = (Base_dDiag.C_Check_ErrC (dtb_u_u998)) in dtb_u_u1000)
  | Base_dDiag.C_Check_OkC (dtb_u_u1002) -> (let dtb_u_u1003 = (B_dData_dPair.v_firstOf dtb_u_u1002) in (let dtb_u_u1004 = (B_dData_dPair.v_secondOf dtb_u_u1002) in (let dtb_u_u1005 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileModDecl in (let dtb_u_u1006 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileImports in (let dtb_u_u1007 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileFixities in (let dtb_u_u1008 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileDecls in (let dtb_u_u1009 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileExports in (let dtb_u_u1010 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileReexports in (let dtb_u_u1011 = (dtb_u_u1003).Frontend_dAst.f_SourceFile_sourceFileOpacity in (let dtb_u_u1012 = dtb_u_u1005 in (match dtb_u_u1012 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1013) -> (match dtb_u_u1013 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u1014; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u1015; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u1016; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u1017; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u1018; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u1019; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u1020 } -> (let dtb_u_u1021 = ((v_namespaceImportsOf dtb_u_u1006) dtb_u_u1010) in (match ((Loader_dModules.v_validateImports dtb_u_u1014) dtb_u_u1021) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1022) -> (let dtb_u_u1024 = (Base_dDiag.C_Check_ErrC (dtb_u_u1022)) in dtb_u_u1024)
  | Base_dDiag.C_Check_OkC (dtb_u_u1026) -> (let dtb_u_u1034 = ((((((v_implicitPrelude_u_udirect nFs) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) dtb_u_u1014) dtb_u_u1021) _u_ueffTok) in (match dtb_u_u1034 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1035) -> (let dtb_u_u1037 = (Base_dDiag.C_Check_ErrC (dtb_u_u1035)) in dtb_u_u1037)
  | Base_dDiag.C_Check_OkC (dtb_u_u1039) -> (let dtb_u_u1047 = ((((((((v_loadAll_u_udirect nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u1021) dtb_u_u1039)) _u_ueffTok) in (match dtb_u_u1047 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1048) -> (let dtb_u_u1050 = (Base_dDiag.C_Check_ErrC (dtb_u_u1048)) in dtb_u_u1050)
  | Base_dDiag.C_Check_OkC (dtb_u_u1052) -> (let dtb_u_u1053 = ((Loader_dModules.v_normalizeImports dtb_u_u1052) dtb_u_u1021) in (match (v_withSelectors dtb_u_u1008) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1054) -> (let dtb_u_u1056 = (Base_dDiag.C_Check_ErrC (dtb_u_u1054)) in dtb_u_u1056)
  | Base_dDiag.C_Check_OkC (dtb_u_u1058) -> (match (((((((v_computeExports dtb_u_u1052) dtb_u_u1014) dtb_u_u1005) dtb_u_u1053) dtb_u_u1008) dtb_u_u1009) dtb_u_u1010) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1059) -> (let dtb_u_u1061 = (Base_dDiag.C_Check_ErrC (dtb_u_u1059)) in dtb_u_u1061)
  | Base_dDiag.C_Check_OkC (dtb_u_u1063) -> (let dtb_u_u1064 = dtb_u_u1007 in (let dtb_u_u1066 = ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = dtb_u_u1053; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u1039; Loader_dModules.f_Project_projectModules = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = dtb_u_u1014; Loader_dModules.f_Module_modulePackageOf = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Module_moduleImportsOf = dtb_u_u1053; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb_u_u1039; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u1058; Loader_dModules.f_Module_moduleExportsOf = dtb_u_u1063; Loader_dModules.f_Module_moduleFixitiesOf = dtb_u_u1064; Loader_dModules.f_Module_moduleReexportsOf = ((Loader_dModules.v_reexportedImportNames dtb_u_u1053) ((B_dData_dList.v_append dtb_u_u1016) dtb_u_u1010)); Loader_dModules.f_Module_moduleOpaqueOf = ((v_opaqueNamesOf dtb_u_u1014) dtb_u_u1011); Loader_dModules.f_Module_moduleExportIndexOf = (Loader_dModules.v_exportIndexOf dtb_u_u1063); Loader_dModules.f_Module_moduleFixFactsOf = dtb_u_u1004 }, dtb_u_u1052)); Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts }) in dtb_u_u1066))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) preloaded)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))))))))))
  | _ -> failwith "DT: impossible branch"
)))

# 913 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) -> (((((v_loadModuleSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil))

# 913 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> ((Obj.magic (((((v_loadModuleSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 985 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesFromParsed = (fun (dtb_u_u1074 : string) (dtb_u_u1077 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1078 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1079 : string) (dtb_u_u1080 : Frontend_dAst.t_SourceFile) -> (match dtb_u_u1080 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u1081; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u1082; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u1083; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u1084; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u1085; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u1086; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u1087 } -> (let dtb_u_u1088 = ((v_namespaceImportsOf dtb_u_u1082) dtb_u_u1086) in (let dtb_u_u1089 = (let dtb_u_u1123 = dtb_u_u1081 in (match dtb_u_u1123 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1124) -> (match dtb_u_u1124 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u1125; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u1126; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u1127; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u1128; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u1129; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u1130; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u1131 } -> { B_dData_dPair.f_Pair_first = dtb_u_u1125; B_dData_dPair.f_Pair_second = dtb_u_u1125 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = dtb_u_u1079; B_dData_dPair.f_Pair_second = "" }
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u1090 = (B_dData_dPair.v_firstOf dtb_u_u1089) in (let dtb_u_u1091 = (B_dData_dPair.v_secondOf dtb_u_u1089) in (match ((Loader_dModules.v_validateImports dtb_u_u1090) dtb_u_u1088) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1092) -> (let dtb_u_u1094 = (Base_dDiag.C_Check_ErrC (dtb_u_u1092)) in (Obj.repr ((fun (dtb_u_u1095 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1094))))
  | Base_dDiag.C_Check_OkC (dtb_u_u1096) -> (Obj.repr ((fun (dtb_u_u1101 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1104 = ((((((v_implicitPrelude_u_udirect dtb_u_u1074) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u1077)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1077)) dtb_u_u1091) dtb_u_u1088) dtb_u_u1101) in (match dtb_u_u1104 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1105) -> (let dtb_u_u1107 = (Base_dDiag.C_Check_ErrC (dtb_u_u1105)) in dtb_u_u1107)
  | Base_dDiag.C_Check_OkC (dtb_u_u1109) -> (let dtb_u_u1117 = ((((((((v_loadAll_u_udirect dtb_u_u1074) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u1077)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u1077)) dtb_u_u1078) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u1088) dtb_u_u1109)) dtb_u_u1101) in (let dtb_u_u1119 = (match dtb_u_u1117 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1121) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1121))
  | Base_dDiag.C_Check_OkC (dtb_u_u1122) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1122; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb_u_u1122) dtb_u_u1083) }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1119))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 985 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesFromParsed_u_udirect = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_PackageContext) (mc1 : Loader_dModules.t_Module B_dData_dList.t_List) (mc2 : string) (mc3 : Frontend_dAst.t_SourceFile) _u_ueffTok -> (match mc3 with
  | { Frontend_dAst.f_SourceFile_sourceFileModDecl = dtb_u_u1081; Frontend_dAst.f_SourceFile_sourceFileImports = dtb_u_u1082; Frontend_dAst.f_SourceFile_sourceFileFixities = dtb_u_u1083; Frontend_dAst.f_SourceFile_sourceFileDecls = dtb_u_u1084; Frontend_dAst.f_SourceFile_sourceFileExports = dtb_u_u1085; Frontend_dAst.f_SourceFile_sourceFileReexports = dtb_u_u1086; Frontend_dAst.f_SourceFile_sourceFileOpacity = dtb_u_u1087 } -> (let dtb_u_u1088 = ((v_namespaceImportsOf dtb_u_u1082) dtb_u_u1086) in (let dtb_u_u1089 = (let dtb_u_u1123 = dtb_u_u1081 in (match dtb_u_u1123 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1124) -> (match dtb_u_u1124 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u1125; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u1126; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u1127; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u1128; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u1129; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u1130; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u1131 } -> { B_dData_dPair.f_Pair_first = dtb_u_u1125; B_dData_dPair.f_Pair_second = dtb_u_u1125 }
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = mc2; B_dData_dPair.f_Pair_second = "" }
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u1090 = (B_dData_dPair.v_firstOf dtb_u_u1089) in (let dtb_u_u1091 = (B_dData_dPair.v_secondOf dtb_u_u1089) in (match ((Loader_dModules.v_validateImports dtb_u_u1090) dtb_u_u1088) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1092) -> (let dtb_u_u1094 = (Base_dDiag.C_Check_ErrC (dtb_u_u1092)) in dtb_u_u1094)
  | Base_dDiag.C_Check_OkC (dtb_u_u1096) -> (let dtb_u_u1104 = ((((((v_implicitPrelude_u_udirect nFs) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) dtb_u_u1091) dtb_u_u1088) _u_ueffTok) in (match dtb_u_u1104 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1105) -> (let dtb_u_u1107 = (Base_dDiag.C_Check_ErrC (dtb_u_u1105)) in dtb_u_u1107)
  | Base_dDiag.C_Check_OkC (dtb_u_u1109) -> (let dtb_u_u1117 = ((((((((v_loadAll_u_udirect nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots mc0)) (Frontend_dPackages_dPkg.v_contextPackageName mc0)) mc1) B_dData_dList.C_List_Nil) ((B_dData_dList.v_append dtb_u_u1088) dtb_u_u1109)) _u_ueffTok) in (let dtb_u_u1119 = (match dtb_u_u1117 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1121) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1121))
  | Base_dDiag.C_Check_OkC (dtb_u_u1122) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u1122; B_dData_dPair.f_Pair_second = ((v_dedupeFixitiesOf dtb_u_u1122) dtb_u_u1083) }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1119))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

# 973 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn = (fun (dtb_u_u1132 : string) (dtb_u_u1135 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1136 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1137 : string) (dtb_u_u1138 : string) -> (Obj.repr ((fun (dtb_u_u1143 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1146 = (((((v_parseFileWithPathMode_u_udirect dtb_u_u1132) Frontend_dParser_dSupport.C_ParseMode_PmTool) dtb_u_u1137) dtb_u_u1138) dtb_u_u1143) in (match dtb_u_u1146 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1147) -> (let dtb_u_u1149 = (Base_dDiag.C_Check_ErrC (dtb_u_u1147)) in dtb_u_u1149)
  | Base_dDiag.C_Check_OkC (dtb_u_u1151) -> ((Obj.magic (((((v_fixitiesFromParsed dtb_u_u1132) dtb_u_u1135) dtb_u_u1136) dtb_u_u1137) (B_dData_dPair.v_firstOf dtb_u_u1151))) dtb_u_u1143)
  | _ -> failwith "DT: impossible branch"
))))))

# 973 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules0 : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1146 = (((((v_parseFileWithPathMode_u_udirect nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source) _u_ueffTok) in (match dtb_u_u1146 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1147) -> (let dtb_u_u1149 = (Base_dDiag.C_Check_ErrC (dtb_u_u1147)) in dtb_u_u1149)
  | Base_dDiag.C_Check_OkC (dtb_u_u1151) -> ((Obj.magic (((((v_fixitiesFromParsed nFs) ctx) modules0) label) (B_dData_dPair.v_firstOf dtb_u_u1151))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 1013 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource = (fun (dtb_u_u1152 : string) (dtb_u_u1155 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1156 : string) (dtb_u_u1157 : string) -> (Obj.repr ((fun (dtb_u_u1162 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1165 = ((((((v_fixitiesForSourceIn_u_udirect dtb_u_u1152) dtb_u_u1155) B_dData_dList.C_List_Nil) dtb_u_u1156) dtb_u_u1157) dtb_u_u1162) in (let dtb_u_u1167 = (match dtb_u_u1165 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1169) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1169))
  | Base_dDiag.C_Check_OkC (dtb_u_u1170) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb_u_u1170)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1167))))))

# 1013 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1165 = ((((((v_fixitiesForSourceIn_u_udirect nFs) ctx) B_dData_dList.C_List_Nil) label) source) _u_ueffTok) in (let dtb_u_u1167 = (match dtb_u_u1165 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1169) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1169))
  | Base_dDiag.C_Check_OkC (dtb_u_u1170) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb_u_u1170)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1167)))

# 1138 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_fixityOpsOf = (fun (mc0 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__449, dtb__450) -> (B_dData_dList.C_List__x58__x58_ ((dtb__449).Frontend_dAst.f_FixityDecl_fixityOp, (v_fixityOpsOf dtb__450)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1102 "Vuna/Compiler/Loader/Flatten.vuna"
let v_visibleFixityOps = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__451) -> (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__451))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) imports))

# 1155 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameSuffixIn = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__452, dtb__453) -> (if (if (dtb__452 = mc0) then true else ((B_dData_dString.v_endsWith ("." ^ mc0)) dtb__452)) then true else ((v_anyNameSuffixIn mc0) dtb__453))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1150 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyOpDeclared = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__454, dtb__455) -> (if ((v_anyNameSuffixIn dtb__454) mc1) then true else ((v_anyOpDeclared dtb__455) mc1))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1175 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_traitMethodNames = (fun (mc0 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__456, dtb__457) -> (B_dData_dList.C_List__x58__x58_ ((dtb__456).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb__457)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1165 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 1161 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_definedNamesOf = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__499, dtb__500) -> ((B_dData_dList.v_append (v_definedNamesOfDecl dtb__499)) (v_definedNamesOf dtb__500))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1144 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesDeclaredFixity = (fun (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__501) -> ((v_anyOpDeclared (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__501))) (v_definedNamesOf decls))
  | _ -> failwith "DT: impossible branch"
))

# 1179 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__502, dtb__503) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__502) mc0) then true else ((v_anyNameIn mc0) dtb__503))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1132 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesUsedFixity = (fun (sourceNames : (string, bool) B_dContainer_dHashMap.t_HashMap) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__504) -> ((v_anyNameIn sourceNames) (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb__504)))
  | _ -> failwith "DT: impossible branch"
))

# 1191 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyInstanceDecl = (fun (mc0 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__505, dtb__506) -> (match dtb__505 with
  | Frontend_dAst.C_Decl_DInstance (dtb__507, dtb__508, dtb__509, dtb__510) -> true
  | _ -> (v_anyInstanceDecl dtb__506)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1185 "Vuna/Compiler/Loader/Flatten.vuna"
let v_moduleDeclaresInstance = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imp : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule modules) (Frontend_dAst.v_importName imp)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (v_anyInstanceDecl (Loader_dModules.v_moduleDeclsOf dtb__511))
  | _ -> failwith "DT: impossible branch"
))

# 1199 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalEdit = (fun (imp : Frontend_dAst.t_Import) -> { Base_dDiag.f_DiagEdit_editSpan = (Frontend_dAst.v_importSpan imp); Base_dDiag.f_DiagEdit_editNewText = "" })

# 1122 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportDiag = (fun (imp : Frontend_dAst.t_Import) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = ("remove unused import " ^ (imp).Frontend_dAst.f_Import_importName); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ((v_importRemovalEdit imp), B_dData_dList.C_List_Nil)) }) (((Base_dDiagnostics_dWarning.v_warnDiagAt (Frontend_dAst.v_importSpan imp)) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedImport ((imp).Frontend_dAst.f_Import_importName))) (B_dData_dVec.C_Vec__x58__x58_ ((imp).Frontend_dAst.f_Import_importName, B_dData_dVec.C_Vec_Nil)))))

# 1211 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 1222 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTargetOf = (fun (e : Loader_dModules.t_ExportEntry) -> (e).Loader_dModules.f_ExportEntry_target)

# 1226 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyTargetIn = (fun (mc0 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__519, dtb__520) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__519) mc0) then true else ((v_anyTargetIn mc0) dtb__520))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1111 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_unusedImportWarningsGo = (fun (mc0 : Loader_dModules.t_Module B_dData_dList.t_List) (mc1 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, bool) B_dContainer_dHashMap.t_HashMap) (mc3 : Frontend_dAst.t_Decl B_dData_dList.t_List) (mc4 : string B_dData_dList.t_List) (mc5 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__521, dtb__522) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf mc0) (Frontend_dAst.v_importName dtb__521))) (fun (es : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let used = (if (if (if (if ((B_dData_dList.v_memName (Frontend_dAst.v_importName dtb__521)) mc4) then true else ((v_anyTargetIn mc1) ((B_dData_dList.v_map v_exportTargetOf) es))) then true else (((v_importProvidesUsedFixity mc2) mc0) dtb__521)) then true else (((v_importProvidesDeclaredFixity mc3) mc0) dtb__521)) then true else ((v_moduleDeclaresInstance mc0) dtb__521)) in ((Base_dCommon.v_bind ((((((v_unusedImportWarningsGo mc0) mc1) mc2) mc3) mc4) dtb__522)) (fun (more : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if used then more else (B_dData_dList.C_List__x58__x58_ ((v_unusedImportDiag dtb__521), more))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1236 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declExtraNames = (fun (mc0 : Frontend_dAst.t_Decl) -> (match mc0 with
  | Frontend_dAst.C_Decl_DInstance (dtb__523, dtb__524, dtb__525, dtb__526) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DTrait (dtb__527, dtb__528, dtb__529, dtb__530, dtb__531) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DFun (dtb__532, dtb__533, dtb__534, dtb__535) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DSig (dtb__536, dtb__537, dtb__538, dtb__539) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DExtern (dtb__540, dtb__541, dtb__542, dtb__543) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DAxiom (dtb__544, dtb__545, dtb__546) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DRecord (dtb__547, dtb__548, dtb__549, dtb__550, dtb__551, dtb__552, dtb__553, dtb__554) -> dtb__550
  | Frontend_dAst.C_Decl_DData (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559, dtb__560, dtb__561, dtb__562, dtb__563) -> dtb__559
  | _ -> failwith "DT: impossible branch"
))

# 1246 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exprRefStep = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Expr) -> (match mc1 with
  | Frontend_dAst.C_Expr_EInterp (dtb__564, dtb__565) -> mc0
  | Frontend_dAst.C_Expr_EDo (dtb__566, dtb__567) -> mc0
  | Frontend_dAst.C_Expr_ERecUpdate (dtb__568, dtb__569, dtb__570) -> mc0
  | Frontend_dAst.C_Expr_ERecord (dtb__571, dtb__572, dtb__573) -> (B_dData_dList.C_List__x58__x58_ (dtb__571, mc0))
  | Frontend_dAst.C_Expr_EField (dtb__574, dtb__575, dtb__576) -> mc0
  | Frontend_dAst.C_Expr_EIf (dtb__577, dtb__578, dtb__579, dtb__580) -> mc0
  | Frontend_dAst.C_Expr_ECase (dtb__581, dtb__582, dtb__583) -> mc0
  | Frontend_dAst.C_Expr_ELet (dtb__584, dtb__585, dtb__586, dtb__587) -> mc0
  | Frontend_dAst.C_Expr_EPi (dtb__588, dtb__589, dtb__590, dtb__591, dtb__592, dtb__593) -> mc0
  | Frontend_dAst.C_Expr_EApp (dtb__594, dtb__595, dtb__596) -> mc0
  | Frontend_dAst.C_Expr_ELam (dtb__597, dtb__598, dtb__599) -> mc0
  | Frontend_dAst.C_Expr_EFloat (dtb__600, dtb__601) -> mc0
  | Frontend_dAst.C_Expr_EStr (dtb__602, dtb__603) -> mc0
  | Frontend_dAst.C_Expr_EInt (dtb__604, dtb__605) -> mc0
  | Frontend_dAst.C_Expr_EVar (dtb__606, dtb__607) -> (B_dData_dList.C_List__x58__x58_ (dtb__606, mc0))
  | _ -> failwith "DT: impossible branch"
))

# 1263 "Vuna/Compiler/Loader/Flatten.vuna"
let v_patRefStep = (fun (mc0 : string B_dData_dList.t_List) (mc1 : Frontend_dAst.t_Pat) -> (match mc1 with
  | Frontend_dAst.C_Pat_PRecord (dtb__608, dtb__609, dtb__610) -> (B_dData_dList.C_List__x58__x58_ (dtb__608, mc0))
  | Frontend_dAst.C_Pat_PStr (dtb__611, dtb__612) -> mc0
  | Frontend_dAst.C_Pat_PInt (dtb__613, dtb__614) -> mc0
  | Frontend_dAst.C_Pat_PCon (dtb__615, dtb__616, dtb__617) -> (B_dData_dList.C_List__x58__x58_ (dtb__615, mc0))
  | Frontend_dAst.C_Pat_PWild (dtb__618) -> mc0
  | Frontend_dAst.C_Pat_PAs (dtb__619, dtb__620, dtb__621) -> mc0
  | Frontend_dAst.C_Pat_PVar (dtb__622, dtb__623) -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1233 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declRefNames = (fun (d : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_append ((((Frontend_dAstWalk.v_foldDecl v_exprRefStep) v_patRefStep) B_dData_dList.C_List_Nil) d)) (v_declExtraNames d)))

# 1204 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declGlobalNames = (fun (d : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_concatMap v_expandGlobalName) (v_declRefNames d)))

# 1073 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportWarnings = (fun (modules : Loader_dModules.t_Module B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) (decls : Frontend_dAst.t_Decl B_dData_dList.t_List) (sourceDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) (reexports : string B_dData_dList.t_List) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.names") (fun (_u : int) -> (let sourceRefs = ((B_dData_dList.v_concatMap v_declRefNames) sourceDecls) in (let interpRef = (if ((B_dData_dList.v_memName "interp") sourceRefs) then true else ((B_dData_dList.v_memName Base_dIntrinsics.v_interpMethodName) sourceRefs)) in (let names0 = ((B_dData_dList.v_concatMap v_declGlobalNames) decls) in (let names = (if interpRef then names0 else ((B_dData_dList.v_filter (fun (n : string) -> (n <> Base_dIntrinsics.v_interpMethodName))) names0)) in (let nameSet = (B_dContainer_dHashMap.v_ofNames names) in (let fixitySet = (B_dContainer_dHashMap.v_ofNames ((v_visibleFixityOps modules) imports)) in ((Base_dObs.v_obsCheck "vuna.resolve.warn.sources") (fun (_u : int) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.imports") (fun (_u : int) -> (let sourceNames = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_filter (fun (n : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) n) fixitySet))) sourceRefs)) in ((((((v_unusedImportWarningsGo modules) nameSet) sourceNames) decls) reexports) imports)))))))))))))))

# 1059 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveModuleGo = (fun (release : bool) (m : Loader_dModules.t_Module) (rest : Loader_dModules.t_Module B_dData_dList.t_List) (declsR : Frontend_dAst.t_Decl B_dData_dList.t_List Base_dDiag.t_Check) -> ((Base_dCommon.v_bind declsR) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let modules2 = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = decls3; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (m).Loader_dModules.f_Module_moduleFixFactsOf }, rest)) in (let ns = ((Base_dObs.v_obsPure "vuna.resolve.ns") (fun (_u : int) -> ((((Loader_dResolve.v_namespacesOfWith release) modules2) decls3) (Loader_dModules.v_moduleAllImportsOf m)))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.module") (fun (_u : int) -> ((((((Loader_dResolve.v_resolveProgram modules2) (Loader_dModules.v_moduleNameOf m)) (Loader_dModules.v_moduleNameOf m)) ns) (Loader_dModules.v_moduleAllImportsOf m)) decls3)))) (fun (d1 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings modules2) (m).Loader_dModules.f_Module_moduleImportsOf) d1) decls3) (Loader_dModules.v_moduleReexportsOf m))))) (fun (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf m); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf m); Loader_dModules.f_Module_moduleImportsOf = (m).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (m).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = d1; Loader_dModules.f_Module_moduleExportsOf = (m).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf m); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf m); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf m); Loader_dModules.f_Module_moduleExportIndexOf = (m).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (m).Loader_dModules.f_Module_moduleFixFactsOf }; B_dData_dPair.f_Pair_second = warns })))))))))))

# 1045 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_resolveModulesKeep = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (mc3 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__624, dtb__625) -> (if ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb__624)) mc1) then ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__625)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__624, (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p2) })))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf (dtb__624).Loader_dModules.f_Module_moduleFixFactsOf) mc2)) (Loader_dModules.v_moduleDeclsOf dtb__624))))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModuleGo mc0) dtb__624) dtb__625) ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls (Loader_dModules.v_moduleNameOf dtb__624)) decls2))))) (fun (p : (Loader_dModules.t_Module, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) mc2) dtb__625)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf p), (B_dData_dPair.v_firstOf p2))); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf p)) (B_dData_dPair.v_secondOf p2)) })))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 1037 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectKeeping = (fun (mc0 : bool) (mc1 : string B_dData_dList.t_List) (mc2 : Loader_dModules.t_Project) -> (match mc2 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb__626; Loader_dModules.f_Project_projectEntryImports = dtb__627; Loader_dModules.f_Project_projectImplicitImports = dtb__628; Loader_dModules.f_Project_projectModules = dtb__629; Loader_dModules.f_Project_projectEntryPkg = dtb__630; Loader_dModules.f_Project_projectEntryFixities = dtb__631; Loader_dModules.f_Project_projectEntryName = dtb__632; Loader_dModules.f_Project_projectEntryFacts = dtb__633 } -> (let projectFixities = ((v_dedupeFixitiesOf dtb__629) dtb__631) in ((Base_dCommon.v_bind (Loader_dFixity.v_checkUniqueFixities projectFixities)) (fun (fixes : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (_u : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf dtb__633) fixes)) dtb__626)))) (fun (decls2 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (_u : int) -> ((Loader_dExpand.v_expandDecls dtb__632) decls2)))) (fun (decls3 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.entry") (fun (_u : int) -> (((((Loader_dResolve.v_resolveEntry mc0) dtb__629) dtb__630) ((B_dData_dList.v_append dtb__627) dtb__628)) decls3)))) (fun (entryDecls : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (_u : int) -> (((((v_unusedImportWarnings dtb__629) dtb__627) entryDecls) decls3) B_dData_dList.C_List_Nil)))) (fun (entryWarns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep mc0) mc1) fixes) dtb__629)) (fun (p2 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append entryWarns) (B_dData_dPair.v_secondOf p2)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = entryDecls; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p2) } })))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProject = (fun (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping false) B_dData_dList.C_List_Nil) project))

# 1029 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectWith = (fun (release : bool) (project : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping release) B_dData_dList.C_List_Nil) project))

# 1273 "Vuna/Compiler/Loader/Flatten.vuna"
let v_patRefNames = (fun (p : Frontend_dAst.t_Pat) -> (((Frontend_dAstWalk.v_foldPat v_patRefStep) B_dData_dList.C_List_Nil) p))

# 1277 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exprRefNames = (fun (e : Frontend_dAst.t_Expr) -> (((Frontend_dAstWalk.v_foldExpr v_exprRefStep) B_dData_dList.C_List_Nil) e))
