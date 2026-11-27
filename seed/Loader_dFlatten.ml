open Vuna_runtime
# 62 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseWith = (fun (dtb_u_u1 : Frontend_dParser_dSupport.t_ParseMode) (dtb_u_u2 : string) (dtb_u_u3 : string) (dtb_u_u4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match ((Base_dObs.v_obsPure "vuna.parse.syntax") (fun (dtb_u_u5 : int) -> ((((Frontend_dParser.v_parseSourceRecoveringTokens dtb_u_u2) dtb_u_u3) dtb_u_u1) dtb_u_u4))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u6) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty dtb_u_u2) dtb_u_u6)))
  | Base_dDiag.C_Check_OkC (dtb_u_u7) -> (let dtb_u_u8 = (B_dData_dPair.v_firstOf (B_dData_dPair.v_firstOf dtb_u_u7)) in (let dtb_u_u9 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_firstOf dtb_u_u7)) in (let dtb_u_u10 = (B_dData_dPair.v_secondOf dtb_u_u7) in (match dtb_u_u10 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u8; B_dData_dPair.f_Pair_second = dtb_u_u9 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withChildren dtb_u_u12) dtb_u_u11)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode = (fun (dtb_u_u13 : string) (dtb_u_u16 : Frontend_dParser_dSupport.t_ParseMode) (dtb_u_u17 : string) (dtb_u_u18 : string) -> (match ((Base_dObs.v_obsPure "vuna.parse.lex") (fun (dtb_u_u19 : int) -> (Frontend_dLexer.v_lexSource dtb_u_u18))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u20) -> (let dtb_u_u22 = (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty dtb_u_u17) dtb_u_u20))) in (Obj.repr ((fun (dtb_u_u23 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u22))))
  | Base_dDiag.C_Check_OkC (dtb_u_u24) -> (let dtb_u_u26 = ((((v_parseWith dtb_u_u16) dtb_u_u17) dtb_u_u18) dtb_u_u24) in (Obj.repr ((fun (dtb_u_u27 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u26))))
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPathMode_u_udirect = (fun (nFs : string) (mode : Frontend_dParser_dSupport.t_ParseMode) (path : string) (src : string) _u_ueffTok -> (match ((Base_dObs.v_obsPure "vuna.parse.lex") (fun (dtb_u_u19 : int) -> (Frontend_dLexer.v_lexSource src))) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u20) -> (let dtb_u_u22 = (Base_dDiag.C_Check_ErrC (((Base_dDiag.v_withSpanFileIfEmpty path) dtb_u_u20))) in dtb_u_u22)
  | Base_dDiag.C_Check_OkC (dtb_u_u24) -> (let dtb_u_u26 = ((((v_parseWith mode) path) src) dtb_u_u24) in dtb_u_u26)
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath = (fun dtb_u_u28 -> ((v_parseFileWithPathMode dtb_u_u28) Frontend_dParser_dSupport.C_ParseMode_PmStrict))

# 50 "Vuna/Compiler/Loader/Flatten.vuna"
let v_parseFileWithPath_u_udirect = (fun _u_ueta0 _u_ueta1 _u_ueta2 _u_ueffTok -> ((Obj.magic (((v_parseFileWithPath _u_ueta0) _u_ueta1) _u_ueta2)) _u_ueffTok))

# 87 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeFixitiesGo = (fun (dtb_u_u31 : (string, Frontend_dAst.t_FixityDecl) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u32 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u33 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (let dtb_u_u36 = (B_dData_dPair.v_firstOf dtb_u_u34) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u36) dtb_u_u32) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u37) -> (((v_dedupeFixitiesGo dtb_u_u35) dtb_u_u32) dtb_u_u33)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeFixitiesGo dtb_u_u35) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u36) 1) dtb_u_u32)) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_secondOf dtb_u_u34), dtb_u_u33)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u33)
  | _ -> failwith "DT: impossible branch"
))

# 97 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixityDeclKey = (fun (dtb_u_u38 : Frontend_dAst.t_FixityDecl) -> (let dtb_u_u39 = (Frontend_dAst.v_fixitySpan dtb_u_u38) in (String.concat "" [(dtb_u_u38).Frontend_dAst.f_FixityDecl_fixityOp; "|"; (string_of_int (dtb_u_u38).Frontend_dAst.f_FixityDecl_fixityLevel); "|"; (string_of_int (dtb_u_u38).Frontend_dAst.f_FixityDecl_fixityAssoc); "|"; (Base_dSource.v_spanFile dtb_u_u39); ":"; (string_of_int (Base_dSource.v_spanStartLine dtb_u_u39)); ":"; (string_of_int (Base_dSource.v_spanStartCol dtb_u_u39))])))

# 80 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeFixitiesOf = (fun (dtb_u_u40 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u41 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (((v_dedupeFixitiesGo ((B_dData_dList.v_append ((B_dData_dList.v_concatMap (fun (dtb_u_u42 : Loader_dModules.t_Module) -> ((B_dData_dList.v_map (fun (dtb_u_u43 : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = (String.concat "" [(Loader_dModules.v_moduleNameOf dtb_u_u42); "|"; (v_fixityDeclKey dtb_u_u43)]); B_dData_dPair.f_Pair_second = dtb_u_u43 })) (Loader_dModules.v_moduleFixitiesOf dtb_u_u42)))) dtb_u_u40)) ((B_dData_dList.v_map (fun (dtb_u_u44 : Frontend_dAst.t_FixityDecl) -> { B_dData_dPair.f_Pair_first = ("|entry|" ^ (v_fixityDeclKey dtb_u_u44)); B_dData_dPair.f_Pair_second = dtb_u_u44 })) dtb_u_u41))) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 106 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isPrivateName = (fun (dtb_u_u45 : string) -> ((B_dData_dString.v_startsWith "_") dtb_u_u45))

# 109 "Vuna/Compiler/Loader/Flatten.vuna"
let v_privateExportMsg = (fun (dtb_u_u46 : string) (dtb_u_u47 : Base_dSource.t_Span) (dtb_u_u48 : string) -> ((((((Base_dDiag.v_diagAt dtb_u_u47) Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhLoad) Base_dDiag.C_Category_CatPackage) "") (String.concat "" [dtb_u_u46; ": cannot export private name "; dtb_u_u48; " (names starting with _ are module-private)"])))

# 121 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnData = (fun (dtb_u_u49 : string) (dtb_u_u50 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u51, dtb_u_u52) -> (match dtb_u_u51 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u53, dtb_u_u54, dtb_u_u55, dtb_u_u56, dtb_u_u57, dtb_u_u58, dtb_u_u59, dtb_u_u60, dtb_u_u61) -> (if (dtb_u_u53 = dtb_u_u49) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u53; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map Frontend_dAst.v_ctorName) dtb_u_u56) })) else ((v_findOwnData dtb_u_u49) dtb_u_u52))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u66, dtb_u_u67, dtb_u_u68, dtb_u_u69) -> (if (dtb_u_u62 = dtb_u_u49) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u62; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u62, B_dData_dList.C_List_Nil)) })) else ((v_findOwnData dtb_u_u49) dtb_u_u52))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u70, dtb_u_u71, dtb_u_u72, dtb_u_u73, dtb_u_u74) -> (if (dtb_u_u70 = dtb_u_u49) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u70; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb_u_u73) })) else ((v_findOwnData dtb_u_u49) dtb_u_u52))
  | _ -> ((v_findOwnData dtb_u_u49) dtb_u_u52)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnFn = (fun (dtb_u_u75 : string) (dtb_u_u76 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u76 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u77, dtb_u_u78) -> (match dtb_u_u77 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u79, dtb_u_u80, dtb_u_u81, dtb_u_u82) -> (if (dtb_u_u79 = dtb_u_u75) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u75)) else ((v_findOwnFn dtb_u_u75) dtb_u_u78))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u83, dtb_u_u84, dtb_u_u85, dtb_u_u86) -> (if (dtb_u_u83 = dtb_u_u75) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u75)) else ((v_findOwnFn dtb_u_u75) dtb_u_u78))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u87, dtb_u_u88, dtb_u_u89) -> (if (dtb_u_u87 = dtb_u_u75) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u75)) else ((v_findOwnFn dtb_u_u75) dtb_u_u78))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u90, dtb_u_u91, dtb_u_u92, dtb_u_u93) -> (if (dtb_u_u90 = dtb_u_u75) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u75)) else ((v_findOwnFn dtb_u_u75) dtb_u_u78))
  | _ -> ((v_findOwnFn dtb_u_u75) dtb_u_u78)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_kindEndsInType = (fun (dtb_u_u94 : Frontend_dAst.t_Expr) -> (match dtb_u_u94 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u95 = "Type") then true else false)
  | Frontend_dAst.C_Expr_EApp (dtb_u_u97, dtb_u_u98, dtb_u_u99) -> (match dtb_u_u97 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u100, dtb_u_u101) -> (if (dtb_u_u100 = "->") then (match dtb_u_u98 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u102, dtb_u_u103) -> (match dtb_u_u103 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match dtb_u_u105 with
  | B_dData_dList.C_List_Nil -> (v_kindEndsInType dtb_u_u104)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
) else false)
  | _ -> false
)
  | Frontend_dAst.C_Expr_EPi (dtb_u_u106, dtb_u_u107, dtb_u_u108, dtb_u_u109, dtb_u_u110, dtb_u_u111) -> (v_kindEndsInType dtb_u_u110)
  | _ -> false
))

# 146 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_typeKindAxiom = (fun (dtb_u_u112 : string) (dtb_u_u113 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u113 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u114, dtb_u_u115) -> (match dtb_u_u114 with
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u116, dtb_u_u117, dtb_u_u118) -> (if (dtb_u_u116 = dtb_u_u112) then (v_kindEndsInType dtb_u_u117) else ((v_typeKindAxiom dtb_u_u112) dtb_u_u115))
  | _ -> ((v_typeKindAxiom dtb_u_u112) dtb_u_u115)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findCtorNamed = (fun (dtb_u_u119 : string) (dtb_u_u120 : Frontend_dAst.t_Ctor B_dData_dList.t_List) -> (match dtb_u_u120 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u121, dtb_u_u122) -> (if ((Frontend_dAst.v_ctorName dtb_u_u121) = dtb_u_u119) then (B_dData_dMaybe.C_Maybe_Just ((Frontend_dAst.v_ctorName dtb_u_u121))) else ((v_findCtorNamed dtb_u_u119) dtb_u_u122))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findMethodNamed = (fun (dtb_u_u123 : string) (dtb_u_u124 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match dtb_u_u124 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u125, dtb_u_u126) -> (match dtb_u_u125 with
  | { Frontend_dAst.f_TraitMethod_traitMethodName = dtb_u_u127; Frontend_dAst.f_TraitMethod_traitMethodType = dtb_u_u128; Frontend_dAst.f_TraitMethod_traitMethodRef = dtb_u_u129 } -> (if (dtb_u_u127 = dtb_u_u123) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u127)) else ((v_findMethodNamed dtb_u_u123) dtb_u_u126))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_findOwnCtorNames = (fun (dtb_u_u130 : string) (dtb_u_u131 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u131 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u132, dtb_u_u133) -> (match dtb_u_u132 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u134, dtb_u_u135, dtb_u_u136, dtb_u_u137, dtb_u_u138, dtb_u_u139, dtb_u_u140, dtb_u_u141, dtb_u_u142) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u143 : Frontend_dAst.t_Ctor) -> { B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_ctorName dtb_u_u143) })) ((B_dData_dList.v_filter (fun (dtb_u_u144 : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName dtb_u_u144) = dtb_u_u130))) dtb_u_u137))) ((v_findOwnCtorNames dtb_u_u130) dtb_u_u133))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u145, dtb_u_u146, dtb_u_u147, dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152) -> (if (dtb_u_u145 = dtb_u_u130) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u145; B_dData_dPair.f_Pair_second = dtb_u_u145 }, ((v_findOwnCtorNames dtb_u_u130) dtb_u_u133))) else ((v_findOwnCtorNames dtb_u_u130) dtb_u_u133))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u153, dtb_u_u154, dtb_u_u155, dtb_u_u156, dtb_u_u157) -> ((B_dData_dList.v_append ((B_dData_dList.v_map (fun (dtb_u_u158 : Frontend_dAst.t_TraitMethod) -> { B_dData_dPair.f_Pair_first = dtb_u_u153; B_dData_dPair.f_Pair_second = (Frontend_dAst.v_traitMethodName dtb_u_u158) })) ((B_dData_dList.v_filter (fun (dtb_u_u159 : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName dtb_u_u159) = dtb_u_u130))) dtb_u_u156))) ((v_findOwnCtorNames dtb_u_u130) dtb_u_u133))
  | _ -> ((v_findOwnCtorNames dtb_u_u130) dtb_u_u133)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownCtorEntries = (fun (dtb_u_u160 : string) (dtb_u_u161 : string) (dtb_u_u162 : string B_dData_dList.t_List) -> (match dtb_u_u162 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u163, dtb_u_u164) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb_u_u163; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle dtb_u_u160) dtb_u_u163); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle dtb_u_u160) dtb_u_u161) }, (((v_ownCtorEntries dtb_u_u160) dtb_u_u161) dtb_u_u164)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ownDataCtorEntries = (fun (dtb_u_u165 : string) (dtb_u_u166 : string) (dtb_u_u167 : string B_dData_dList.t_List) -> (match dtb_u_u167 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u168, dtb_u_u169) -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "ctor"; Loader_dModules.f_ExportEntry_public = dtb_u_u168; Loader_dModules.f_ExportEntry_target = (((Loader_dModules.v_ctorCanonical dtb_u_u165) dtb_u_u166) dtb_u_u168); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle dtb_u_u165) dtb_u_u166) }, (((v_ownDataCtorEntries dtb_u_u165) dtb_u_u166) dtb_u_u169)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 235 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownSelectorEntries = (fun (dtb_u_u170 : string) (dtb_u_u171 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u172 : string) -> ((B_dData_dList.v_map (fun (dtb_u_u173 : string) -> { Loader_dModules.f_ExportEntry_kind = "val"; Loader_dModules.f_ExportEntry_public = dtb_u_u173; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle dtb_u_u170) dtb_u_u173); Loader_dModules.f_ExportEntry_parent = ((Loader_dModules.v_mangle dtb_u_u170) dtb_u_u172) })) ((Loader_dSelectors.v_selectedFieldNames dtb_u_u171) dtb_u_u172)))

# 210 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownTypeEntries = (fun (dtb_u_u174 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u175 : string) (dtb_u_u176 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u177 : string) -> (match dtb_u_u176 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u178, dtb_u_u179) -> (match dtb_u_u178 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u180, dtb_u_u181, dtb_u_u182, dtb_u_u183, dtb_u_u184, dtb_u_u185, dtb_u_u186, dtb_u_u187, dtb_u_u188) -> (if (dtb_u_u180 = dtb_u_u177) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb_u_u180; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle dtb_u_u175) dtb_u_u180); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownDataCtorEntries dtb_u_u175) dtb_u_u180) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) dtb_u_u183)))))) else ((((v_ownTypeEntries dtb_u_u174) dtb_u_u175) dtb_u_u179) dtb_u_u177))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u189, dtb_u_u190, dtb_u_u191, dtb_u_u192, dtb_u_u193, dtb_u_u194, dtb_u_u195, dtb_u_u196) -> (if (dtb_u_u189 = dtb_u_u177) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb_u_u189; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle dtb_u_u175) dtb_u_u189); Loader_dModules.f_ExportEntry_parent = "" }, ((B_dData_dList.v_append (((v_ownCtorEntries dtb_u_u175) dtb_u_u189) (B_dData_dList.C_List__x58__x58_ (dtb_u_u189, B_dData_dList.C_List_Nil)))) (((v_ownSelectorEntries dtb_u_u175) dtb_u_u174) dtb_u_u189)))))) else ((((v_ownTypeEntries dtb_u_u174) dtb_u_u175) dtb_u_u179) dtb_u_u177))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u197, dtb_u_u198, dtb_u_u199, dtb_u_u200, dtb_u_u201) -> (if (dtb_u_u197 = dtb_u_u177) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb_u_u197; Loader_dModules.f_ExportEntry_target = ((Loader_dModules.v_mangle dtb_u_u175) dtb_u_u197); Loader_dModules.f_ExportEntry_parent = "" }, (((v_ownCtorEntries dtb_u_u175) dtb_u_u197) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) dtb_u_u200)))))) else ((((v_ownTypeEntries dtb_u_u174) dtb_u_u175) dtb_u_u179) dtb_u_u177))
  | _ -> ((((v_ownTypeEntries dtb_u_u174) dtb_u_u175) dtb_u_u179) dtb_u_u177)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 243 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_ctorEntriesOfType = (fun (dtb_u_u202 : string) (dtb_u_u203 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u203 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u204, dtb_u_u205) -> (if (if (if ((dtb_u_u204).Loader_dModules.f_ExportEntry_kind = "ctor") then true else ((dtb_u_u204).Loader_dModules.f_ExportEntry_kind = "val")) then ((dtb_u_u204).Loader_dModules.f_ExportEntry_parent = dtb_u_u202) else false) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u204, ((v_ctorEntriesOfType dtb_u_u202) dtb_u_u205))) else ((v_ctorEntriesOfType dtb_u_u202) dtb_u_u205))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 278 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_isRecordDecl = (fun (dtb_u_u206 : string) (dtb_u_u207 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u207 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u208, dtb_u_u209) -> (match dtb_u_u208 with
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u210, dtb_u_u211, dtb_u_u212, dtb_u_u213, dtb_u_u214, dtb_u_u215, dtb_u_u216, dtb_u_u217) -> (if (dtb_u_u210 = dtb_u_u206) then true else ((v_isRecordDecl dtb_u_u206) dtb_u_u209))
  | _ -> ((v_isRecordDecl dtb_u_u206) dtb_u_u209)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isRecordTarget = (fun (dtb_u_u218 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u219 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u220 : string) (dtb_u_u221 : string) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u221)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u222; B_dData_dPair.f_Pair_second = dtb_u_u223 } -> (let dtb_u_u224 = (Base_dSource.v_joinDots dtb_u_u222) in (if (dtb_u_u224 = dtb_u_u220) then ((v_isRecordDecl dtb_u_u223) dtb_u_u219) else (let dtb_u_u225 = ((Loader_dModules.v_findModule dtb_u_u218) dtb_u_u224) in (match dtb_u_u225 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u226) -> (match dtb_u_u226 with
  | { Loader_dModules.f_Module_moduleNameOf = dtb_u_u227; Loader_dModules.f_Module_modulePackageOf = dtb_u_u228; Loader_dModules.f_Module_moduleImportsOf = dtb_u_u229; Loader_dModules.f_Module_moduleImplicitImportsOf = dtb_u_u230; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u231; Loader_dModules.f_Module_moduleExportsOf = dtb_u_u232; Loader_dModules.f_Module_moduleFixitiesOf = dtb_u_u233; Loader_dModules.f_Module_moduleReexportsOf = dtb_u_u234; Loader_dModules.f_Module_moduleOpaqueOf = dtb_u_u235; Loader_dModules.f_Module_moduleExportIndexOf = dtb_u_u236; Loader_dModules.f_Module_moduleFixFactsOf = dtb_u_u237 } -> ((v_isRecordDecl dtb_u_u223) dtb_u_u231)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

# 254 "Vuna/Compiler/Loader/Flatten.vuna"
let v_typeRefDominates = (fun (dtb_u_u238 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u239 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u240 : string) (dtb_u_u241 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) (dtb_u_u242 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match dtb_u_u241 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u243) -> (match dtb_u_u243 with
  | { Loader_dModules.f_ExportRef_refKind = dtb_u_u244; Loader_dModules.f_ExportRef_refTarget = dtb_u_u245; Loader_dModules.f_ExportRef_refParent = dtb_u_u246 } -> (let dtb_u_u247 = dtb_u_u242 in (match dtb_u_u247 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u248) -> (match dtb_u_u248 with
  | { Loader_dModules.f_ExportRef_refKind = dtb_u_u249; Loader_dModules.f_ExportRef_refTarget = dtb_u_u250; Loader_dModules.f_ExportRef_refParent = dtb_u_u251 } -> (if (if (if (dtb_u_u244 = "type") then (dtb_u_u249 = "ctor") else false) then (dtb_u_u245 = dtb_u_u250) else false) then ((((v_isRecordTarget dtb_u_u238) dtb_u_u239) dtb_u_u240) dtb_u_u245) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Loader/Flatten.vuna"
let v_refEntryList = (fun (dtb_u_u252 : string) (dtb_u_u253 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match dtb_u_u253 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (match dtb_u_u254 with
  | { Loader_dModules.f_ExportRef_refKind = dtb_u_u255; Loader_dModules.f_ExportRef_refTarget = dtb_u_u256; Loader_dModules.f_ExportRef_refParent = dtb_u_u257 } -> (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = dtb_u_u255; Loader_dModules.f_ExportEntry_public = dtb_u_u252; Loader_dModules.f_ExportEntry_target = dtb_u_u256; Loader_dModules.f_ExportEntry_parent = dtb_u_u257 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 291 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedTypeRef = (fun (dtb_u_u258 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u259 : string) (dtb_u_u260 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u261 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u262 : string) -> (let dtb_u_u263 = ((v_findOwnData dtb_u_u262) dtb_u_u260) in (match dtb_u_u263 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType dtb_u_u258) dtb_u_u261) dtb_u_u262)) (fun (dtb_u_u264 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u264 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u259) "type") dtb_u_u262) dtb_u_u264)) (fun (dtb_u_u265 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((B_dData_dPair.v_secondOf dtb_u_u265)).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = "" }))))))
)))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u266) -> (match dtb_u_u266 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u267; B_dData_dPair.f_Pair_second = dtb_u_u268 } -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "type"; Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle dtb_u_u259) dtb_u_u267); Loader_dModules.f_ExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 332 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_ownCtorEntriesNamed = (fun (dtb_u_u269 : string) (dtb_u_u270 : string) (dtb_u_u271 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u271 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u272, dtb_u_u273) -> (match dtb_u_u272 with
  | Frontend_dAst.C_Decl_DData (dtb_u_u274, dtb_u_u275, dtb_u_u276, dtb_u_u277, dtb_u_u278, dtb_u_u279, dtb_u_u280, dtb_u_u281, dtb_u_u282) -> ((B_dData_dList.v_append (((v_ownDataCtorEntries dtb_u_u269) dtb_u_u274) ((B_dData_dList.v_map Frontend_dAst.v_ctorName) ((B_dData_dList.v_filter (fun (dtb_u_u283 : Frontend_dAst.t_Ctor) -> ((Frontend_dAst.v_ctorName dtb_u_u283) = dtb_u_u270))) dtb_u_u277)))) (((v_ownCtorEntriesNamed dtb_u_u269) dtb_u_u270) dtb_u_u273))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u284, dtb_u_u285, dtb_u_u286, dtb_u_u287, dtb_u_u288, dtb_u_u289, dtb_u_u290, dtb_u_u291) -> (if (dtb_u_u284 = dtb_u_u270) then ((B_dData_dList.v_append (((v_ownCtorEntries dtb_u_u269) dtb_u_u284) (B_dData_dList.C_List__x58__x58_ (dtb_u_u284, B_dData_dList.C_List_Nil)))) (((v_ownCtorEntriesNamed dtb_u_u269) dtb_u_u270) dtb_u_u273)) else (((v_ownCtorEntriesNamed dtb_u_u269) dtb_u_u270) dtb_u_u273))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u292, dtb_u_u293, dtb_u_u294, dtb_u_u295, dtb_u_u296) -> ((B_dData_dList.v_append (((v_ownCtorEntries dtb_u_u269) dtb_u_u292) ((B_dData_dList.v_map Frontend_dAst.v_traitMethodName) ((B_dData_dList.v_filter (fun (dtb_u_u297 : Frontend_dAst.t_TraitMethod) -> ((Frontend_dAst.v_traitMethodName dtb_u_u297) = dtb_u_u270))) dtb_u_u295)))) (((v_ownCtorEntriesNamed dtb_u_u269) dtb_u_u270) dtb_u_u273))
  | _ -> (((v_ownCtorEntriesNamed dtb_u_u269) dtb_u_u270) dtb_u_u273)
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 312 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef2 = (fun (dtb_u_u298 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u299 : string) (dtb_u_u300 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u301 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u302 : string) -> (let dtb_u_u303 = (((v_ownCtorEntriesNamed dtb_u_u299) dtb_u_u302) dtb_u_u300) in (match dtb_u_u303 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingValue dtb_u_u298) dtb_u_u301) dtb_u_u302)) (fun (dtb_u_u304 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u304 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dMaybe.C_Maybe_Nothing))
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u299) "name") dtb_u_u302) dtb_u_u304)) (fun (dtb_u_u305 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let dtb_u_u306 = (B_dData_dPair.v_secondOf dtb_u_u305) in (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (dtb_u_u306).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportRef_refTarget = (dtb_u_u306).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (dtb_u_u306).Loader_dModules.f_ExportEntry_parent })))))))
)))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u307, dtb_u_u308) -> (match dtb_u_u308 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u309, dtb_u_u310) -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousConstructorExport (dtb_u_u302))) dtb_u_u302)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = "ctor"; Loader_dModules.f_ExportRef_refTarget = (dtb_u_u307).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportRef_refParent = (dtb_u_u307).Loader_dModules.f_ExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 303 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ownOrImportedValueRef = (fun (dtb_u_u311 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u312 : string) (dtb_u_u313 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u314 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u315 : string) -> (match ((v_findOwnFn dtb_u_u315) dtb_u_u313) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u316) -> (Base_dDiag.C_Check_OkC ((B_dData_dMaybe.C_Maybe_Just ({ Loader_dModules.f_ExportRef_refKind = (if ((v_typeKindAxiom dtb_u_u315) dtb_u_u313) then "type" else "val"); Loader_dModules.f_ExportRef_refTarget = ((Loader_dModules.v_mangle dtb_u_u312) dtb_u_u316); Loader_dModules.f_ExportRef_refParent = "" }))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_ownOrImportedValueRef2 dtb_u_u311) dtb_u_u312) dtb_u_u313) dtb_u_u314) dtb_u_u315)
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Loader/Flatten.vuna"
let v_bareEntries = (fun (dtb_u_u317 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u318 : string) (dtb_u_u319 : string) (dtb_u_u320 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((B_dData_dList.v_append dtb_u_u320) (((v_ownSelectorEntries dtb_u_u318) dtb_u_u317) dtb_u_u319)))

# 384 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameExportEntry = (fun (dtb_u_u321 : string) (dtb_u_u322 : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = (dtb_u_u322).Loader_dModules.f_ExportEntry_kind; Loader_dModules.f_ExportEntry_public = dtb_u_u321; Loader_dModules.f_ExportEntry_target = (dtb_u_u322).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = (dtb_u_u322).Loader_dModules.f_ExportEntry_parent })

# 388 "Vuna/Compiler/Loader/Flatten.vuna"
let v_renameTypeEntry = (fun (dtb_u_u323 : string) (dtb_u_u324 : Loader_dModules.t_ExportEntry) -> { Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb_u_u323; Loader_dModules.f_ExportEntry_target = (dtb_u_u324).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" })

# 404 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isEmptyEntries = (fun dtb_u_u326 -> (match dtb_u_u326 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u327, dtb_u_u328) -> false
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSelective = (fun (dtb_u_u329 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u330 : string) (dtb_u_u331 : string) (dtb_u_u332 : string) (dtb_u_u333 : string) (dtb_u_u334 : Base_dSource.t_Span) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u329) dtb_u_u331)) (fun (dtb_u_u335 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let dtb_u_u336 = ((B_dData_dList.v_map (v_renameExportEntry dtb_u_u332)) ((Loader_dModules.v_findExportValues dtb_u_u335) dtb_u_u332)) in (let dtb_u_u337 = ((B_dData_dList.v_map (v_renameTypeEntry dtb_u_u332)) ((Loader_dModules.v_findExportTypes dtb_u_u335) dtb_u_u332)) in (let dtb_u_u338 = ((B_dData_dList.v_append dtb_u_u336) dtb_u_u337) in (if (v_isEmptyEntries dtb_u_u338) then (((Base_dDiagnostics_dRn.v_rnAt1 dtb_u_u334) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (dtb_u_u333))) dtb_u_u333) else (Base_dDiag.C_Check_OkC (dtb_u_u338)))))))))

# 458 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_hasImportOf = (fun (dtb_u_u339 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u340 : string) -> (match dtb_u_u339 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u341, dtb_u_u342) -> (if ((Frontend_dAst.v_importName dtb_u_u341) = dtb_u_u340) then true else ((v_hasImportOf dtb_u_u342) dtb_u_u340))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 449 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_namespaceImportsGo = (fun (dtb_u_u343 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u344 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) (dtb_u_u345 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match dtb_u_u344 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u346, dtb_u_u347) -> (match dtb_u_u346 with
  | Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u348, dtb_u_u349, dtb_u_u350) -> (if (if ((v_hasImportOf dtb_u_u343) dtb_u_u348) then true else ((v_hasImportOf dtb_u_u345) dtb_u_u348)) then (((v_namespaceImportsGo dtb_u_u343) dtb_u_u347) dtb_u_u345) else (((v_namespaceImportsGo dtb_u_u343) dtb_u_u347) (B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = dtb_u_u348; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = dtb_u_u349; Frontend_dAst.f_Import_importRef = dtb_u_u350 }, dtb_u_u345))))
  | _ -> (((v_namespaceImportsGo dtb_u_u343) dtb_u_u347) dtb_u_u345)
)
  | B_dData_dList.C_List_Nil -> dtb_u_u345
  | _ -> failwith "DT: impossible branch"
))

# 446 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceImportsOf = (fun (dtb_u_u351 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u352 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> ((B_dData_dList.v_append dtb_u_u351) (B_dData_dList.v_reverse (((v_namespaceImportsGo dtb_u_u351) dtb_u_u352) B_dData_dList.C_List_Nil))))

# 470 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_joinCommaNames = (fun (dtb_u_u353 : string B_dData_dList.t_List) -> (match dtb_u_u353 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u354, dtb_u_u355) -> (match dtb_u_u355 with
  | B_dData_dList.C_List_Nil -> dtb_u_u354
  | _ -> (String.concat "" [dtb_u_u354; ", "; (v_joinCommaNames dtb_u_u355)])
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveImportPrefix = (fun (dtb_u_u356 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u357 : string) -> (let dtb_u_u358 = ((Loader_dModules.v_qualifierCandidates dtb_u_u356) dtb_u_u357) in (match dtb_u_u358 with
  | B_dData_dList.C_List_Nil -> ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_ModuleNotImported (dtb_u_u357))) dtb_u_u357)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u359, dtb_u_u360) -> (match dtb_u_u360 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u359))
  | _ -> (((Base_dDiagnostics_dRn.v_rnNoLoc2 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousModule (dtb_u_u357, (v_joinCommaNames dtb_u_u358)))) dtb_u_u357) (v_joinCommaNames dtb_u_u358))
)
  | _ -> failwith "DT: impossible branch"
)))

# 356 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportBare = (fun (dtb_u_u361 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u362 : string) (dtb_u_u363 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u364 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u365 : string) (dtb_u_u366 : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u365)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u367; B_dData_dPair.f_Pair_second = dtb_u_u368 } -> (match dtb_u_u367 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((v_ownOrImportedTypeRef dtb_u_u361) dtb_u_u362) dtb_u_u363) dtb_u_u364) dtb_u_u365)) (fun (dtb_u_u369 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> ((Base_dCommon.v_bind (((((v_ownOrImportedValueRef dtb_u_u361) dtb_u_u362) dtb_u_u363) dtb_u_u364) dtb_u_u365)) (fun (dtb_u_u370 : Loader_dModules.t_ExportRef B_dData_dMaybe.t_Maybe) -> (match dtb_u_u369 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u370 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((Base_dDiagnostics_dRn.v_rnAt1 dtb_u_u366) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (dtb_u_u365))) dtb_u_u365)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u371) -> (Base_dDiag.C_Check_OkC (((v_refEntryList dtb_u_u365) dtb_u_u370)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u372) -> (match dtb_u_u370 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((((v_bareEntries dtb_u_u363) dtb_u_u362) dtb_u_u365) ((v_refEntryList dtb_u_u365) dtb_u_u369))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u373) -> (if (((((v_typeRefDominates dtb_u_u361) dtb_u_u363) dtb_u_u362) dtb_u_u369) dtb_u_u370) then (Base_dDiag.C_Check_OkC (((((v_bareEntries dtb_u_u363) dtb_u_u362) dtb_u_u365) ((v_refEntryList dtb_u_u365) dtb_u_u369)))) else (Base_dDiag.C_Check_OkC (((((v_bareEntries dtb_u_u363) dtb_u_u362) dtb_u_u365) ((B_dData_dList.v_append ((v_refEntryList dtb_u_u365) dtb_u_u369)) ((v_refEntryList dtb_u_u365) dtb_u_u370))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> (let dtb_u_u374 = (Base_dSource.v_joinDots dtb_u_u367) in ((Base_dCommon.v_bind ((v_resolveImportPrefix dtb_u_u364) dtb_u_u374)) (fun (dtb_u_u375 : string) -> ((((((v_exportSelective dtb_u_u361) dtb_u_u362) dtb_u_u375) dtb_u_u368) dtb_u_u365) dtb_u_u366))))
)
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTypeAll = (fun (dtb_u_u376 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u377 : string) (dtb_u_u378 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u379 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u380 : string) (dtb_u_u381 : Base_dSource.t_Span) -> (match (Base_dSource.v_splitLastDot (Base_dSource.v_splitOnDot dtb_u_u380)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u382; B_dData_dPair.f_Pair_second = dtb_u_u383 } -> (match dtb_u_u382 with
  | B_dData_dList.C_List_Nil -> (match ((((v_ownTypeEntries dtb_u_u378) dtb_u_u377) dtb_u_u378) dtb_u_u380) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u384) -> (Base_dDiag.C_Check_OkC (dtb_u_u384))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dCommon.v_bind (((Loader_dModules.v_modulesExportingType dtb_u_u376) dtb_u_u379) dtb_u_u380)) (fun (dtb_u_u385 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u385 with
  | B_dData_dList.C_List_Nil -> (((Base_dDiagnostics_dRn.v_rnAt1 dtb_u_u381) (Base_dDiagnostics_dRn.C_RnErr_CannotExportUnknownName (dtb_u_u380))) dtb_u_u380)
  | _ -> ((Base_dCommon.v_bind ((((Loader_dModules.v_unifyEntryPairs dtb_u_u377) "type") dtb_u_u380) dtb_u_u385)) (fun (dtb_u_u386 : (string, Loader_dModules.t_ExportEntry) B_dData_dPair.t_Pair) -> (let dtb_u_u387 = (B_dData_dPair.v_firstOf dtb_u_u386) in (let dtb_u_u388 = ((B_dData_dPair.v_secondOf dtb_u_u386)).Loader_dModules.f_ExportEntry_target in ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u376) dtb_u_u387)) (fun (dtb_u_u389 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb_u_u380; Loader_dModules.f_ExportEntry_target = dtb_u_u388; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType dtb_u_u388) dtb_u_u389)))))))))))
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (let dtb_u_u390 = (Base_dSource.v_joinDots dtb_u_u382) in ((Base_dCommon.v_bind ((v_resolveImportPrefix dtb_u_u379) dtb_u_u390)) (fun (dtb_u_u391 : string) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u376) dtb_u_u391)) (fun (dtb_u_u392 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match ((Loader_dModules.v_findExportType dtb_u_u392) dtb_u_u383) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u393) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_ExportEntry_kind = "type"; Loader_dModules.f_ExportEntry_public = dtb_u_u383; Loader_dModules.f_ExportEntry_target = (dtb_u_u393).Loader_dModules.f_ExportEntry_target; Loader_dModules.f_ExportEntry_parent = "" }, ((v_ctorEntriesOfType (dtb_u_u393).Loader_dModules.f_ExportEntry_target) dtb_u_u392)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((Base_dDiagnostics_dRn.v_rnAt2 dtb_u_u381) (Base_dDiagnostics_dRn.C_RnErr_TypeNotExported (dtb_u_u383, dtb_u_u391))) dtb_u_u383) dtb_u_u391)
  | _ -> failwith "DT: impossible branch"
))))))
)
  | _ -> failwith "DT: impossible branch"
))

# 495 "Vuna/Compiler/Loader/Flatten.vuna"
let v_namespaceEntry = (fun (dtb_u_u394 : string) (dtb_u_u395 : string) -> { Loader_dModules.f_ExportEntry_kind = "module"; Loader_dModules.f_ExportEntry_public = dtb_u_u394; Loader_dModules.f_ExportEntry_target = dtb_u_u395; Loader_dModules.f_ExportEntry_parent = "" })

# 499 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_filterExportMembers = (fun (dtb_u_u396 : string B_dData_dList.t_List) (dtb_u_u397 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u397 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u398, dtb_u_u399) -> (if (if ((dtb_u_u398).Loader_dModules.f_ExportEntry_kind = "ctor") then (B_dData_dBool.v_not ((B_dData_dList.v_memName (dtb_u_u398).Loader_dModules.f_ExportEntry_public) dtb_u_u396)) else false) then ((v_filterExportMembers dtb_u_u396) dtb_u_u399) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u398, ((v_filterExportMembers dtb_u_u396) dtb_u_u399))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportItemEntries = (fun (dtb_u_u400 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u401 : string) (dtb_u_u402 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u403 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u404 : Frontend_dAst.t_ExportItem) -> (match dtb_u_u404 with
  | Frontend_dAst.C_ExportItem_XBare (dtb_u_u405, dtb_u_u406) -> ((((((v_exportBare dtb_u_u400) dtb_u_u401) dtb_u_u402) dtb_u_u403) dtb_u_u405) (Frontend_dAst.v_nodeRefSpan dtb_u_u406))
  | Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u407, dtb_u_u408, dtb_u_u409) -> ((Base_dCommon.v_bind ((((((v_exportTypeAll dtb_u_u400) dtb_u_u401) dtb_u_u402) dtb_u_u403) dtb_u_u407) (Frontend_dAst.v_nodeRefSpan dtb_u_u409))) (fun (dtb_u_u410 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((v_filterExportMembers dtb_u_u408) dtb_u_u410)))))
  | Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u411, dtb_u_u412) -> ((((((v_exportTypeAll dtb_u_u400) dtb_u_u401) dtb_u_u402) dtb_u_u403) dtb_u_u411) (Frontend_dAst.v_nodeRefSpan dtb_u_u412))
  | Frontend_dAst.C_ExportItem_XNamespace (dtb_u_u413, dtb_u_u414, dtb_u_u415) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix dtb_u_u403) dtb_u_u413)) (fun (dtb_u_u416 : string) -> (match dtb_u_u414 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Loader_dModules.v_exportsOf dtb_u_u400) dtb_u_u416)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u417) -> (if (dtb_u_u417 = dtb_u_u413) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb_u_u413) dtb_u_u416), B_dData_dList.C_List_Nil)))) else (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb_u_u413) dtb_u_u416), (B_dData_dList.C_List__x58__x58_ (((v_namespaceEntry dtb_u_u417) dtb_u_u416), B_dData_dList.C_List_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Frontend_dAst.C_ExportItem_XModule (dtb_u_u418, dtb_u_u419) -> ((Base_dCommon.v_bind ((v_resolveImportPrefix dtb_u_u403) dtb_u_u418)) (fun (dtb_u_u420 : string) -> ((Loader_dModules.v_exportsOf dtb_u_u400) dtb_u_u420)))
  | _ -> failwith "DT: impossible branch"
))

# 510 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportEntryKey = (fun (dtb_u_u421 : Loader_dModules.t_ExportEntry) -> (String.concat "" [(dtb_u_u421).Loader_dModules.f_ExportEntry_kind; "|"; (dtb_u_u421).Loader_dModules.f_ExportEntry_public; "|"; (dtb_u_u421).Loader_dModules.f_ExportEntry_target; "|"; (dtb_u_u421).Loader_dModules.f_ExportEntry_parent]))

# 513 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_dedupeByFullKey = (fun (dtb_u_u422 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) (dtb_u_u423 : (string, int) B_dContainer_dHashMap.t_HashMap) (dtb_u_u424 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (match dtb_u_u422 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u425, dtb_u_u426) -> (let dtb_u_u427 = (v_exportEntryKey dtb_u_u425) in (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u427) dtb_u_u423) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u428) -> (((v_dedupeByFullKey dtb_u_u426) dtb_u_u423) dtb_u_u424)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_dedupeByFullKey dtb_u_u426) (((((B_dContainer_dHashMap.v_insert B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u427) 1) dtb_u_u423)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u425, dtb_u_u424)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u424)
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Loader/Flatten.vuna"
let v_dedupeExportEntries = (fun (dtb_u_u429 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (((v_dedupeByFullKey dtb_u_u429) (((B_dContainer_dHashMap.v_fromList B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) B_dData_dList.C_List_Nil)) B_dData_dList.C_List_Nil))

# 531 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exportItemsAll = (fun (dtb_u_u430 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u431 : string) (dtb_u_u432 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u433 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u434 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match dtb_u_u434 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u435, dtb_u_u436) -> ((Base_dCommon.v_bind (((((v_exportItemEntries dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u433) dtb_u_u435)) (fun (dtb_u_u437 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> ((Base_dCommon.v_bind (((((v_exportItemsAll dtb_u_u430) dtb_u_u431) dtb_u_u432) dtb_u_u433) dtb_u_u436)) (fun (dtb_u_u438 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u437) dtb_u_u438)))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Loader/Flatten.vuna"
let v_explicitExports = (fun (dtb_u_u439 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u440 : string) (dtb_u_u441 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u442 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u443 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (match dtb_u_u443 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> ((Base_dCommon.v_bind (((((v_exportItemsAll dtb_u_u439) dtb_u_u440) dtb_u_u441) dtb_u_u442) dtb_u_u443)) (fun (dtb_u_u444 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((v_dedupeExportEntries dtb_u_u444)))))
))

# 538 "Vuna/Compiler/Loader/Flatten.vuna"
let v_validateModuleHeader = (fun (dtb_u_u446 : string) (dtb_u_u447 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) -> (match dtb_u_u447 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u448) -> (match dtb_u_u448 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u449; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u450; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u451; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u452; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u453; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u454; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u455 } -> (if (dtb_u_u449 = dtb_u_u446) then (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) else (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb_u_u455)) (Base_dDiagnostics_dRn.C_RnErr_ModuleNameMismatch (dtb_u_u449))) dtb_u_u449))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 546 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_opaqueNamesOf = (fun (dtb_u_u456 : string) (dtb_u_u457 : Frontend_dAst.t_OpacitySpec B_dData_dList.t_List) -> (match dtb_u_u457 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u458, dtb_u_u459) -> (match (dtb_u_u458).Frontend_dAst.f_OpacitySpec_opacityKind with
  | Frontend_dAst.C_Opacity_OpacityOpaque -> (B_dData_dList.C_List__x58__x58_ (((Loader_dModules.v_mangle dtb_u_u456) (Frontend_dAst.v_opacitySpecName dtb_u_u458)), ((v_opaqueNamesOf dtb_u_u456) dtb_u_u459)))
  | Frontend_dAst.C_Opacity_OpacityTransparent -> ((v_opaqueNamesOf dtb_u_u456) dtb_u_u459)
  | Frontend_dAst.C_Opacity_OpacityAbstract -> (B_dData_dList.C_List__x58__x58_ ((":" ^ ((Loader_dModules.v_mangle dtb_u_u456) (Frontend_dAst.v_opacitySpecName dtb_u_u458))), ((v_opaqueNamesOf dtb_u_u456) dtb_u_u459)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Loader/Flatten.vuna"
let v_abstractOpaquePrefix = ":"

# 557 "Vuna/Compiler/Loader/Flatten.vuna"
let v_opaqueBaseName = (fun (dtb_u_u460 : string) -> (if ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) dtb_u_u460) then (((dtp_substring (String.length v_abstractOpaquePrefix)) ((String.length dtb_u_u460) - (String.length v_abstractOpaquePrefix))) dtb_u_u460) else dtb_u_u460))

# 567 "Vuna/Compiler/Loader/Flatten.vuna"
let v_isAbstractOpaqueName = (fun (dtb_u_u461 : string) -> ((B_dData_dString.v_startsWith v_abstractOpaquePrefix) dtb_u_u461))

# 571 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withSelectors = (fun (dtb_u_u462 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind (Loader_dSelectors.v_selectorDecls dtb_u_u462)) (fun (dtb_u_u463 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u462) dtb_u_u463))))))

# 589 "Vuna/Compiler/Loader/Flatten.vuna"
let v_notEmpty = (fun dtb_u_u465 -> (match dtb_u_u465 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u466, dtb_u_u467) -> true
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportSpecToItem = (fun (dtb_u_u468 : Frontend_dAst.t_ExportSpec) -> (match dtb_u_u468 with
  | Frontend_dAst.C_ExportSpec_ESType (dtb_u_u469, dtb_u_u470, dtb_u_u471) -> (match dtb_u_u470 with
  | Frontend_dAst.C_ExportMembers_EMOnly (dtb_u_u472) -> (Frontend_dAst.C_ExportItem_XTypeSome (dtb_u_u469, dtb_u_u472, (Frontend_dAst.v_detachedNodeRef dtb_u_u471)))
  | Frontend_dAst.C_ExportMembers_EMAll -> (Frontend_dAst.C_ExportItem_XTypeAll (dtb_u_u469, (Frontend_dAst.v_detachedNodeRef dtb_u_u471)))
  | Frontend_dAst.C_ExportMembers_EMNone -> (Frontend_dAst.C_ExportItem_XBare (dtb_u_u469, (Frontend_dAst.v_detachedNodeRef dtb_u_u471)))
  | _ -> failwith "DT: impossible branch"
)
  | Frontend_dAst.C_ExportSpec_ESValue (dtb_u_u473, dtb_u_u474) -> (Frontend_dAst.C_ExportItem_XBare (dtb_u_u473, (Frontend_dAst.v_detachedNodeRef dtb_u_u474)))
  | _ -> failwith "DT: impossible branch"
))

# 575 "Vuna/Compiler/Loader/Flatten.vuna"
let v_computeExports = (fun (dtb_u_u475 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u476 : string) (dtb_u_u477 : Frontend_dAst.t_ModDecl B_dData_dMaybe.t_Maybe) (dtb_u_u478 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u479 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u480 : Frontend_dAst.t_ExportSpec B_dData_dList.t_List) (dtb_u_u481 : Frontend_dAst.t_ExportItem B_dData_dList.t_List) -> (let dtb_u_u482 = ((B_dData_dList.v_append ((B_dData_dList.v_map v_exportSpecToItem) dtb_u_u480)) dtb_u_u481) in (let dtb_u_u483 = (((((v_explicitExports dtb_u_u475) dtb_u_u476) dtb_u_u479) dtb_u_u478) dtb_u_u482) in (if (v_notEmpty dtb_u_u482) then (let dtb_u_u484 = dtb_u_u477 in (match dtb_u_u484 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u483
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u485) -> (match dtb_u_u485 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u486; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u487; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u488; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u489; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u490; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u491; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u492 } -> (if dtb_u_u487 then (((Base_dDiagnostics_dRn.v_rnAt1 (Frontend_dAst.v_nodeRefSpan dtb_u_u492)) (Base_dDiagnostics_dRn.C_RnErr_DuplicateExport ("module header"))) "module header") else dtb_u_u483)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u493 = dtb_u_u477 in (match dtb_u_u493 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u494) -> (match dtb_u_u494 with
  | { Frontend_dAst.f_ModDecl_modDeclName = dtb_u_u495; Frontend_dAst.f_ModDecl_modDeclHasExportList = dtb_u_u496; Frontend_dAst.f_ModDecl_modDeclExportItems = dtb_u_u497; Frontend_dAst.f_ModDecl_modDeclExports = dtb_u_u498; Frontend_dAst.f_ModDecl_modDeclReexports = dtb_u_u499; Frontend_dAst.f_ModDecl_modDeclOpacity = dtb_u_u500; Frontend_dAst.f_ModDecl_modDeclRef = dtb_u_u501 } -> (if dtb_u_u496 then (((((v_explicitExports dtb_u_u475) dtb_u_u476) dtb_u_u479) dtb_u_u478) dtb_u_u497) else (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

# 599 "Vuna/Compiler/Loader/Flatten.vuna"
let v_showCycle = (fun (dtb_u_u502 : string) (dtb_u_u503 : string B_dData_dList.t_List) -> (Base_dSource.v_joinArrows (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u502, dtb_u_u503)))))

# 619 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_implicitPreludeEnabled = (fun (dtb_u_u504 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u505 : string) -> (match dtb_u_u504 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u506, dtb_u_u507) -> (if ((Frontend_dPackages_dPkg.v_rootName dtb_u_u506) = dtb_u_u505) then (dtb_u_u506).Frontend_dPackages_dPkg.f_Root_rootImplicitPrelude else ((v_implicitPreludeEnabled dtb_u_u507) dtb_u_u505))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 632 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeDeps = (fun (dtb_u_u508 : string) (dtb_u_u509 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u509 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u510, dtb_u_u511) -> (match dtb_u_u511 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ Frontend_dAst.f_Import_importName = "Prelude"; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef }, B_dData_dList.C_List_Nil))))
  | _ -> ((Base_dDiag.v_onErrDiag (Base_dDiag.v_withAbsent Base_dDiag.C_NoSourceReason_NsPackageGraph)) ((Base_dDiagnostics_dRn.v_rnNoLoc1 (Base_dDiagnostics_dRn.C_RnErr_AmbiguousPrelude ((Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (dtb_u_u512 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf dtb_u_u512)))) dtb_u_u509))))) (Base_dSource.v_joinArrows ((B_dData_dList.v_map (fun (dtb_u_u513 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> (Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf dtb_u_u513)))) dtb_u_u509))))
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom = (fun (dtb_u_u514 : string) (dtb_u_u517 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u518 : string) -> (Obj.repr ((fun (dtb_u_u523 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u526 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect dtb_u_u514) dtb_u_u517) "Prelude") dtb_u_u518) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u523) in (let dtb_u_u527 = (B_dData_dPair.v_firstOf dtb_u_u526) in (let dtb_u_u529 = ((v_implicitPreludeDeps dtb_u_u518) ((B_dData_dList.v_filter (fun (dtb_u_u531 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf dtb_u_u531)) <> dtb_u_u518))) dtb_u_u527)) in dtb_u_u529)))))))

# 624 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPreludeFrom_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) _u_ueffTok -> (let dtb_u_u526 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect nFs) roots) "Prelude") importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) _u_ueffTok) in (let dtb_u_u527 = (B_dData_dPair.v_firstOf dtb_u_u526) in (let dtb_u_u529 = ((v_implicitPreludeDeps importerPkg) ((B_dData_dList.v_filter (fun (dtb_u_u531 : (string, Frontend_dPackages_dPkg.t_Root) B_dData_dPair.t_Pair) -> ((Frontend_dPackages_dPkg.v_rootName (B_dData_dPair.v_secondOf dtb_u_u531)) <> importerPkg))) dtb_u_u527)) in dtb_u_u529))))

# 608 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude = (fun (dtb_u_u532 : string) (dtb_u_u535 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u536 : string) (dtb_u_u537 : string) (dtb_u_u538 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (B_dData_dBool.v_not ((v_implicitPreludeEnabled dtb_u_u535) dtb_u_u536)) then (let dtb_u_u540 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u541 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u540)))) else (if (dtb_u_u537 = "Prelude") then (let dtb_u_u543 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u544 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u543)))) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames dtb_u_u538)) then (let dtb_u_u546 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in (Obj.repr ((fun (dtb_u_u547 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u546)))) else (((v_implicitPreludeFrom dtb_u_u532) dtb_u_u535) dtb_u_u536)))))

# 608 "Vuna/Compiler/Loader/Flatten.vuna"
let v_implicitPrelude_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (currentName : string) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) _u_ueffTok -> (if (B_dData_dBool.v_not ((v_implicitPreludeEnabled roots) importerPkg)) then (let dtb_u_u540 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u540) else (if (currentName = "Prelude") then (let dtb_u_u543 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u543) else (if ((B_dData_dList.v_memName "Prelude") (Loader_dModules.v_importModuleNames imports)) then (let dtb_u_u546 = (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil)) in dtb_u_u546) else ((Obj.magic (((v_implicitPreludeFrom nFs) roots) importerPkg)) _u_ueffTok)))))

# 642 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withLayerCheck = (fun (dtb_u_u548 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u549 : Loader_dModules.t_Project) -> ((Base_dCommon.v_bind ((Loader_dLayers.v_checkProjectLayers dtb_u_u548) dtb_u_u549)) (fun (dtb_u_u550 : B_dData_dUnit.t_Unit) -> (Base_dDiag.C_Check_OkC (dtb_u_u549)))))

# 646 "Vuna/Compiler/Loader/Flatten.vuna"
let v_withImportSpan = (fun (dtb_u_u551 : Frontend_dAst.t_Import) (dtb_u_u552 : Base_dDiag.t_Diagnostic) -> (if ((Base_dSource.v_spanFile (Frontend_dAst.v_importSpan dtb_u_u551)) = "") then dtb_u_u552 else ((Base_dDiag.v_withFallbackSpan (Frontend_dAst.v_importSpan dtb_u_u551)) dtb_u_u552)))

# 651 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loaderFuel = 1048576

# 677 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_nsTakeLocal = (fun (dtb_u_u553 : int) (dtb_u_u554 : string B_dData_dList.t_List) -> (match dtb_u_u554 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u555, dtb_u_u556) -> (if (dtb_u_u553 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb_u_u555, ((v_nsTakeLocal (dtb_u_u553 - 1)) dtb_u_u556))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 668 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_pathPrefixOf = (fun (dtb_u_u557 : string) (dtb_u_u560 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u561 : string) (dtb_u_u562 : string B_dData_dList.t_List) (dtb_u_u563 : int) -> (if (dtb_u_u563 < 1) then (let dtb_u_u565 = B_dData_dMaybe.C_Maybe_Nothing in (Obj.repr ((fun (dtb_u_u566 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u565)))) else (Obj.repr ((fun (dtb_u_u571 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u574 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect dtb_u_u557) dtb_u_u560) (Base_dSource.v_joinDots ((v_nsTakeLocal dtb_u_u563) dtb_u_u562))) dtb_u_u561) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) dtb_u_u571) in (if (v_notEmpty (B_dData_dPair.v_firstOf dtb_u_u574)) then (let dtb_u_u576 = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal dtb_u_u563) dtb_u_u562)); B_dData_dPair.f_Pair_second = dtb_u_u563 })) in dtb_u_u576) else ((Obj.magic (((((v_pathPrefixOf dtb_u_u557) dtb_u_u560) dtb_u_u561) dtb_u_u562) (dtb_u_u563 - 1))) dtb_u_u571))))))))
# 668 "Vuna/Compiler/Loader/Flatten.vuna"
and v_pathPrefixOf_u_udirect = (fun (nFs : string) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (segs : string B_dData_dList.t_List) (n : int) _u_ueffTok -> (if (n < 1) then (let dtb_u_u565 = B_dData_dMaybe.C_Maybe_Nothing in dtb_u_u565) else (let dtb_u_u574 = (((((((Loader_dModules.v_collectModuleFiles_u_udirect nFs) roots) (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs))) importerPkg) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) _u_ueffTok) in (if (v_notEmpty (B_dData_dPair.v_firstOf dtb_u_u574)) then (let dtb_u_u576 = (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Base_dSource.v_joinDots ((v_nsTakeLocal n) segs)); B_dData_dPair.f_Pair_second = n })) in dtb_u_u576) else ((Obj.magic (((((v_pathPrefixOf nFs) roots) importerPkg) segs) (n - 1))) _u_ueffTok)))))

# 681 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_nsDropLocal = (fun (dtb_u_u578 : int) (dtb_u_u579 : string B_dData_dList.t_List) -> (match dtb_u_u579 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u580, dtb_u_u581) -> (if (dtb_u_u578 <= 0) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u580, dtb_u_u581)) else ((v_nsDropLocal (dtb_u_u578 - 1)) dtb_u_u581))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 654 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_loadAll = (fun (dtb_u_u582 : string) (dtb_u_u585 : int) (dtb_u_u586 : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (dtb_u_u587 : string) (dtb_u_u588 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u589 : string B_dData_dList.t_List) (dtb_u_u590 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (if (dtb_u_u585 <= 0) then (let dtb_u_u592 = (Base_dDiag.v_icFuel "loader") in (Obj.repr ((fun (dtb_u_u593 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u592)))) else (match dtb_u_u590 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u595 = (Base_dDiag.C_Check_OkC (dtb_u_u588)) in (Obj.repr ((fun (dtb_u_u596 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u595))))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u597, dtb_u_u598) -> (Obj.repr ((fun (dtb_u_u603 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u606 = ((((((((v_loadModule_u_udirect dtb_u_u582) (dtb_u_u585 - 1)) dtb_u_u586) dtb_u_u587) dtb_u_u588) dtb_u_u589) dtb_u_u597) dtb_u_u603) in (match dtb_u_u606 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u607) -> (let dtb_u_u609 = (Base_dDiag.C_Check_ErrC (dtb_u_u607)) in dtb_u_u609)
  | Base_dDiag.C_Check_OkC (dtb_u_u611) -> ((Obj.magic (((((((v_loadAll dtb_u_u582) (dtb_u_u585 - 1)) dtb_u_u586) dtb_u_u587) dtb_u_u611) dtb_u_u589) dtb_u_u598)) dtb_u_u603)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
# 685 "Vuna/Compiler/Loader/Flatten.vuna"
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
# 654 "Vuna/Compiler/Loader/Flatten.vuna"
and v_loadAll_u_udirect = (fun (nFs : string) (fuel : int) (roots : Frontend_dPackages_dPkg.t_Root B_dData_dList.t_List) (importerPkg : string) (modules : Loader_dModules.t_Module B_dData_dList.t_List) (stack : string B_dData_dList.t_List) (imports : Frontend_dAst.t_Import B_dData_dList.t_List) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u592 = (Base_dDiag.v_icFuel "loader") in dtb_u_u592) else (match imports with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u595 = (Base_dDiag.C_Check_OkC (modules)) in dtb_u_u595)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u597, dtb_u_u598) -> (let dtb_u_u606 = ((((((((v_loadModule_u_udirect nFs) (fuel - 1)) roots) importerPkg) modules) stack) dtb_u_u597) _u_ueffTok) in (match dtb_u_u606 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u607) -> (let dtb_u_u609 = (Base_dDiag.C_Check_ErrC (dtb_u_u607)) in dtb_u_u609)
  | Base_dDiag.C_Check_OkC (dtb_u_u611) -> ((Obj.magic (((((((v_loadAll nFs) (fuel - 1)) roots) importerPkg) dtb_u_u611) stack) dtb_u_u598)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
# 685 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 784 "Vuna/Compiler/Loader/Flatten.vuna"
let v_entryScopeOf = (fun (dtb_u_u773 : string) (dtb_u_u774 : string) -> (let dtb_u_u775 = (((B_dData_dList.v_foldl (fun (dtb_u_u776 : string) (dtb_u_u777 : string) -> dtb_u_u777)) dtb_u_u774) ((B_dData_dString.v_split "/") dtb_u_u774)) in (if ((B_dData_dString.v_endsWith ".vuna") dtb_u_u775) then (((B_dData_dString.v_substring 0) ((B_dData_dNat.v_minus (B_dData_dString.v_byteLength dtb_u_u775)) 5)) dtb_u_u775) else (if (dtb_u_u775 = "") then dtb_u_u773 else dtb_u_u775))))

# 796 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 796 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 779 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject = (fun (dtb_u_u871 : string) (dtb_u_u874 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u875 : string) -> ((((v_loadProjectWithPreloaded dtb_u_u871) dtb_u_u874) dtb_u_u875) B_dData_dList.C_List_Nil))

# 779 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProject_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) _u_ueffTok -> ((Obj.magic ((((v_loadProjectWithPreloaded nFs) ctx) entry) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 847 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded = (fun (dtb_u_u876 : string) (dtb_u_u879 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u880 : string B_dData_dList.t_List) (dtb_u_u881 : Loader_dModules.t_Module B_dData_dList.t_List) -> (let dtb_u_u882 = ((B_dData_dList.v_map (fun (dtb_u_u896 : string) -> { Frontend_dAst.f_Import_importName = dtb_u_u896; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) dtb_u_u880) in (Obj.repr ((fun (dtb_u_u887 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u890 = ((((((((v_loadAll_u_udirect dtb_u_u876) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u879)) (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u879)) dtb_u_u881) B_dData_dList.C_List_Nil) dtb_u_u882) dtb_u_u887) in (let dtb_u_u892 = (match dtb_u_u890 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u894) -> (Base_dDiag.C_Check_ErrC (dtb_u_u894))
  | Base_dDiag.C_Check_OkC (dtb_u_u895) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots dtb_u_u879)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb_u_u895; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u879); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName dtb_u_u879); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u892)))))))

# 847 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModulesWithPreloaded_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) (preloaded : Loader_dModules.t_Module B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u882 = ((B_dData_dList.v_map (fun (dtb_u_u896 : string) -> { Frontend_dAst.f_Import_importName = dtb_u_u896; Frontend_dAst.f_Import_importIsQualified = false; Frontend_dAst.f_Import_importAlias = B_dData_dMaybe.C_Maybe_Nothing; Frontend_dAst.f_Import_importRef = Frontend_dAst.v_noNodeRef })) names) in (let dtb_u_u890 = ((((((((v_loadAll_u_udirect nFs) v_loaderFuel) (Frontend_dPackages_dPkg.v_contextRoots ctx)) (Frontend_dPackages_dPkg.v_contextPackageName ctx)) preloaded) B_dData_dList.C_List_Nil) dtb_u_u882) _u_ueffTok) in (let dtb_u_u892 = (match dtb_u_u890 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u894) -> (Base_dDiag.C_Check_ErrC (dtb_u_u894))
  | Base_dDiag.C_Check_OkC (dtb_u_u895) -> ((v_withLayerCheck (Frontend_dPackages_dPkg.v_contextRoots ctx)) { Loader_dModules.f_Project_projectEntryDecls = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectImplicitImports = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectModules = dtb_u_u895; Loader_dModules.f_Project_projectEntryPkg = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFixities = B_dData_dList.C_List_Nil; Loader_dModules.f_Project_projectEntryName = (Frontend_dPackages_dPkg.v_contextPackageName ctx); Loader_dModules.f_Project_projectEntryFacts = Frontend_dCst.v_emptyFixityFacts })
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u892))))

# 844 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules = (fun (dtb_u_u897 : string) (dtb_u_u900 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u901 : string B_dData_dList.t_List) -> ((((v_loadProjectModulesWithPreloaded dtb_u_u897) dtb_u_u900) dtb_u_u901) B_dData_dList.C_List_Nil))

# 844 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectModules_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (names : string B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic ((((v_loadProjectModulesWithPreloaded nFs) ctx) names) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 866 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 866 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 862 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource = (fun (dtb_u_u977 : string) (dtb_u_u980 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u981 : string) (dtb_u_u982 : string) -> (((((v_loadProjectSourceWithPreloaded dtb_u_u977) dtb_u_u980) dtb_u_u981) dtb_u_u982) B_dData_dList.C_List_Nil))

# 862 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadProjectSource_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> ((Obj.magic (((((v_loadProjectSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 916 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 916 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 912 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource = (fun (dtb_u_u1068 : string) (dtb_u_u1071 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1072 : string) (dtb_u_u1073 : string) -> (((((v_loadModuleSourceWithPreloaded dtb_u_u1068) dtb_u_u1071) dtb_u_u1072) dtb_u_u1073) B_dData_dList.C_List_Nil))

# 912 "Vuna/Compiler/Loader/Flatten.vuna"
let v_loadModuleSource_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> ((Obj.magic (((((v_loadModuleSourceWithPreloaded nFs) ctx) label) source) B_dData_dList.C_List_Nil)) _u_ueffTok))

# 984 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 984 "Vuna/Compiler/Loader/Flatten.vuna"
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

# 972 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn = (fun (dtb_u_u1132 : string) (dtb_u_u1135 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1136 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1137 : string) (dtb_u_u1138 : string) -> (Obj.repr ((fun (dtb_u_u1143 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1146 = (((((v_parseFileWithPathMode_u_udirect dtb_u_u1132) Frontend_dParser_dSupport.C_ParseMode_PmTool) dtb_u_u1137) dtb_u_u1138) dtb_u_u1143) in (match dtb_u_u1146 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1147) -> (let dtb_u_u1149 = (Base_dDiag.C_Check_ErrC (dtb_u_u1147)) in dtb_u_u1149)
  | Base_dDiag.C_Check_OkC (dtb_u_u1151) -> ((Obj.magic (((((v_fixitiesFromParsed dtb_u_u1132) dtb_u_u1135) dtb_u_u1136) dtb_u_u1137) (B_dData_dPair.v_firstOf dtb_u_u1151))) dtb_u_u1143)
  | _ -> failwith "DT: impossible branch"
))))))

# 972 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSourceIn_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (modules0 : Loader_dModules.t_Module B_dData_dList.t_List) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1146 = (((((v_parseFileWithPathMode_u_udirect nFs) Frontend_dParser_dSupport.C_ParseMode_PmTool) label) source) _u_ueffTok) in (match dtb_u_u1146 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1147) -> (let dtb_u_u1149 = (Base_dDiag.C_Check_ErrC (dtb_u_u1147)) in dtb_u_u1149)
  | Base_dDiag.C_Check_OkC (dtb_u_u1151) -> ((Obj.magic (((((v_fixitiesFromParsed nFs) ctx) modules0) label) (B_dData_dPair.v_firstOf dtb_u_u1151))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 1012 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource = (fun (dtb_u_u1152 : string) (dtb_u_u1155 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1156 : string) (dtb_u_u1157 : string) -> (Obj.repr ((fun (dtb_u_u1162 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1165 = ((((((v_fixitiesForSourceIn_u_udirect dtb_u_u1152) dtb_u_u1155) B_dData_dList.C_List_Nil) dtb_u_u1156) dtb_u_u1157) dtb_u_u1162) in (let dtb_u_u1167 = (match dtb_u_u1165 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1169) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1169))
  | Base_dDiag.C_Check_OkC (dtb_u_u1170) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb_u_u1170)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1167))))))

# 1012 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fixitiesForSource_u_udirect = (fun (nFs : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (label : string) (source : string) _u_ueffTok -> (let dtb_u_u1165 = ((((((v_fixitiesForSourceIn_u_udirect nFs) ctx) B_dData_dList.C_List_Nil) label) source) _u_ueffTok) in (let dtb_u_u1167 = (match dtb_u_u1165 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1169) -> (Base_dDiag.C_Check_ErrC (dtb_u_u1169))
  | Base_dDiag.C_Check_OkC (dtb_u_u1170) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_secondOf dtb_u_u1170)))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u1167)))

# 1137 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_fixityOpsOf = (fun (dtb_u_u1171 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> (match dtb_u_u1171 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1172, dtb_u_u1173) -> (B_dData_dList.C_List__x58__x58_ ((dtb_u_u1172).Frontend_dAst.f_FixityDecl_fixityOp, (v_fixityOpsOf dtb_u_u1173)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1101 "Vuna/Compiler/Loader/Flatten.vuna"
let v_visibleFixityOps = (fun (dtb_u_u1174 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1175 : Frontend_dAst.t_Import B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u1176 : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule dtb_u_u1174) (Frontend_dAst.v_importName dtb_u_u1176)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1177) -> (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb_u_u1177))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))) dtb_u_u1175))

# 1154 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameSuffixIn = (fun (dtb_u_u1178 : string) (dtb_u_u1179 : string B_dData_dList.t_List) -> (match dtb_u_u1179 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1180, dtb_u_u1181) -> (if (if (dtb_u_u1180 = dtb_u_u1178) then true else ((B_dData_dString.v_endsWith ("." ^ dtb_u_u1178)) dtb_u_u1180)) then true else ((v_anyNameSuffixIn dtb_u_u1178) dtb_u_u1181))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1149 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyOpDeclared = (fun (dtb_u_u1182 : string B_dData_dList.t_List) (dtb_u_u1183 : string B_dData_dList.t_List) -> (match dtb_u_u1182 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1184, dtb_u_u1185) -> (if ((v_anyNameSuffixIn dtb_u_u1184) dtb_u_u1183) then true else ((v_anyOpDeclared dtb_u_u1185) dtb_u_u1183))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1174 "Vuna/Compiler/Loader/Flatten.vuna"
let[@tail_mod_cons] rec v_traitMethodNames = (fun (dtb_u_u1186 : Frontend_dAst.t_TraitMethod B_dData_dList.t_List) -> (match dtb_u_u1186 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1187, dtb_u_u1188) -> (B_dData_dList.C_List__x58__x58_ ((dtb_u_u1187).Frontend_dAst.f_TraitMethod_traitMethodName, (v_traitMethodNames dtb_u_u1188)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1164 "Vuna/Compiler/Loader/Flatten.vuna"
let v_definedNamesOfDecl = (fun (dtb_u_u1189 : Frontend_dAst.t_Decl) -> (match dtb_u_u1189 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u1190, dtb_u_u1191, dtb_u_u1192, dtb_u_u1193) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1190, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u1194, dtb_u_u1195, dtb_u_u1196, dtb_u_u1197) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1194, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u1198, dtb_u_u1199, dtb_u_u1200) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1198, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DSig (dtb_u_u1201, dtb_u_u1202, dtb_u_u1203, dtb_u_u1204) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1201, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u1205, dtb_u_u1206, dtb_u_u1207, dtb_u_u1208) -> B_dData_dList.C_List_Nil
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u1209, dtb_u_u1210, dtb_u_u1211, dtb_u_u1212, dtb_u_u1213) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1209, (v_traitMethodNames dtb_u_u1212)))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u1214, dtb_u_u1215, dtb_u_u1216, dtb_u_u1217, dtb_u_u1218, dtb_u_u1219, dtb_u_u1220, dtb_u_u1221) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1214, B_dData_dList.C_List_Nil))
  | Frontend_dAst.C_Decl_DData (dtb_u_u1222, dtb_u_u1223, dtb_u_u1224, dtb_u_u1225, dtb_u_u1226, dtb_u_u1227, dtb_u_u1228, dtb_u_u1229, dtb_u_u1230) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1222, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1160 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_definedNamesOf = (fun (dtb_u_u1231 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u1231 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1232, dtb_u_u1233) -> ((B_dData_dList.v_append (v_definedNamesOfDecl dtb_u_u1232)) (v_definedNamesOf dtb_u_u1233))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1143 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesDeclaredFixity = (fun (dtb_u_u1234 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1235 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1236 : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule dtb_u_u1235) (Frontend_dAst.v_importName dtb_u_u1236)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1237) -> ((v_anyOpDeclared (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb_u_u1237))) (v_definedNamesOf dtb_u_u1234))
  | _ -> failwith "DT: impossible branch"
))

# 1178 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyNameIn = (fun (dtb_u_u1238 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1239 : string B_dData_dList.t_List) -> (match dtb_u_u1239 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1240, dtb_u_u1241) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1240) dtb_u_u1238) then true else ((v_anyNameIn dtb_u_u1238) dtb_u_u1241))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1131 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importProvidesUsedFixity = (fun (dtb_u_u1242 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1243 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1244 : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule dtb_u_u1243) (Frontend_dAst.v_importName dtb_u_u1244)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1245) -> ((v_anyNameIn dtb_u_u1242) (v_fixityOpsOf (Loader_dModules.v_moduleFixitiesOf dtb_u_u1245)))
  | _ -> failwith "DT: impossible branch"
))

# 1190 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyInstanceDecl = (fun (dtb_u_u1246 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (match dtb_u_u1246 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1247, dtb_u_u1248) -> (match dtb_u_u1247 with
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u1249, dtb_u_u1250, dtb_u_u1251, dtb_u_u1252) -> true
  | _ -> (v_anyInstanceDecl dtb_u_u1248)
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1184 "Vuna/Compiler/Loader/Flatten.vuna"
let v_moduleDeclaresInstance = (fun (dtb_u_u1253 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1254 : Frontend_dAst.t_Import) -> (match ((Loader_dModules.v_findModule dtb_u_u1253) (Frontend_dAst.v_importName dtb_u_u1254)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1255) -> (v_anyInstanceDecl (Loader_dModules.v_moduleDeclsOf dtb_u_u1255))
  | _ -> failwith "DT: impossible branch"
))

# 1198 "Vuna/Compiler/Loader/Flatten.vuna"
let v_importRemovalEdit = (fun (dtb_u_u1256 : Frontend_dAst.t_Import) -> { Base_dDiag.f_DiagEdit_editSpan = (Frontend_dAst.v_importSpan dtb_u_u1256); Base_dDiag.f_DiagEdit_editNewText = "" })

# 1121 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportDiag = (fun (dtb_u_u1257 : Frontend_dAst.t_Import) -> ((Base_dDiag.v_withSuggestion { Base_dDiag.f_Suggestion_suggestionTitle = ("remove unused import " ^ (dtb_u_u1257).Frontend_dAst.f_Import_importName); Base_dDiag.f_Suggestion_suggestionApplicability = Base_dDiag.C_Applicability_MachineApplicable; Base_dDiag.f_Suggestion_suggestionEdits = (B_dData_dList.C_List__x58__x58_ ((v_importRemovalEdit dtb_u_u1257), B_dData_dList.C_List_Nil)) }) (((Base_dDiagnostics_dWarning.v_warnDiagAt (Frontend_dAst.v_importSpan dtb_u_u1257)) (Base_dDiagnostics_dWarning.C_WarnErr_UnusedImport ((dtb_u_u1257).Frontend_dAst.f_Import_importName))) (B_dData_dVec.C_Vec__x58__x58_ ((dtb_u_u1257).Frontend_dAst.f_Import_importName, B_dData_dVec.C_Vec_Nil)))))

# 1210 "Vuna/Compiler/Loader/Flatten.vuna"
let v_expandGlobalName = (fun (dtb_u_u1258 : string) -> (let dtb_u_u1259 = (Frontend_dReserved.v_classify dtb_u_u1258) in (match dtb_u_u1259 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1260) -> (match dtb_u_u1260 with
  | Frontend_dReserved.C_Reserved_RsFieldSel (dtb_u_u1261, dtb_u_u1262) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1261, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsDoIgnore (dtb_u_u1263) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1263, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsDoBind (dtb_u_u1264) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1264, B_dData_dList.C_List_Nil))
  | Frontend_dReserved.C_Reserved_RsOverCtor (dtb_u_u1265, dtb_u_u1266) -> dtb_u_u1266
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1258, B_dData_dList.C_List_Nil))
)
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1258, B_dData_dList.C_List_Nil))
)))

# 1221 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exportTargetOf = (fun (dtb_u_u1267 : Loader_dModules.t_ExportEntry) -> (dtb_u_u1267).Loader_dModules.f_ExportEntry_target)

# 1225 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_anyTargetIn = (fun (dtb_u_u1268 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1269 : string B_dData_dList.t_List) -> (match dtb_u_u1269 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1270, dtb_u_u1271) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1270) dtb_u_u1268) then true else ((v_anyTargetIn dtb_u_u1268) dtb_u_u1271))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1110 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_unusedImportWarningsGo = (fun (dtb_u_u1272 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1273 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1274 : (string, bool) B_dContainer_dHashMap.t_HashMap) (dtb_u_u1275 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1276 : string B_dData_dList.t_List) (dtb_u_u1277 : Frontend_dAst.t_Import B_dData_dList.t_List) -> (match dtb_u_u1277 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1278, dtb_u_u1279) -> ((Base_dCommon.v_bind ((Loader_dModules.v_exportsOf dtb_u_u1272) (Frontend_dAst.v_importName dtb_u_u1278))) (fun (dtb_u_u1280 : Loader_dModules.t_ExportEntry B_dData_dList.t_List) -> (let dtb_u_u1281 = (if (if (if (if ((B_dData_dList.v_memName (Frontend_dAst.v_importName dtb_u_u1278)) dtb_u_u1276) then true else ((v_anyTargetIn dtb_u_u1273) ((B_dData_dList.v_map v_exportTargetOf) dtb_u_u1280))) then true else (((v_importProvidesUsedFixity dtb_u_u1274) dtb_u_u1272) dtb_u_u1278)) then true else (((v_importProvidesDeclaredFixity dtb_u_u1275) dtb_u_u1272) dtb_u_u1278)) then true else ((v_moduleDeclaresInstance dtb_u_u1272) dtb_u_u1278)) in ((Base_dCommon.v_bind ((((((v_unusedImportWarningsGo dtb_u_u1272) dtb_u_u1273) dtb_u_u1274) dtb_u_u1275) dtb_u_u1276) dtb_u_u1279)) (fun (dtb_u_u1282 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((if dtb_u_u1281 then dtb_u_u1282 else (B_dData_dList.C_List__x58__x58_ ((v_unusedImportDiag dtb_u_u1278), dtb_u_u1282))))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1261 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_patRefNamesGo = (fun (dtb_u_u1283 : Frontend_dAst.t_Pat) (dtb_u_u1284 : string B_dData_dList.t_List) -> (match dtb_u_u1283 with
  | Frontend_dAst.C_Pat_PRecord (dtb_u_u1285, dtb_u_u1286, dtb_u_u1287) -> ((v_fieldPatsGo dtb_u_u1286) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1285, dtb_u_u1284)))
  | Frontend_dAst.C_Pat_PStr (dtb_u_u1288, dtb_u_u1289) -> dtb_u_u1284
  | Frontend_dAst.C_Pat_PInt (dtb_u_u1290, dtb_u_u1291) -> dtb_u_u1284
  | Frontend_dAst.C_Pat_PCon (dtb_u_u1292, dtb_u_u1293, dtb_u_u1294) -> ((v_patRefNamesListGo dtb_u_u1293) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1292, dtb_u_u1284)))
  | Frontend_dAst.C_Pat_PWild (dtb_u_u1295) -> dtb_u_u1284
  | Frontend_dAst.C_Pat_PAs (dtb_u_u1296, dtb_u_u1297, dtb_u_u1298) -> ((v_patRefNamesGo dtb_u_u1297) dtb_u_u1284)
  | Frontend_dAst.C_Pat_PVar (dtb_u_u1299, dtb_u_u1300) -> dtb_u_u1284
  | _ -> failwith "DT: impossible branch"
))
# 1270 "Vuna/Compiler/Loader/Flatten.vuna"
and v_patRefNamesListGo = (fun (dtb_u_u1301 : Frontend_dAst.t_Pat B_dData_dList.t_List) (dtb_u_u1302 : string B_dData_dList.t_List) -> (match dtb_u_u1301 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1303, dtb_u_u1304) -> ((v_patRefNamesListGo dtb_u_u1304) ((v_patRefNamesGo dtb_u_u1303) dtb_u_u1302))
  | B_dData_dList.C_List_Nil -> dtb_u_u1302
  | _ -> failwith "DT: impossible branch"
))
# 1274 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldPatsGo = (fun (dtb_u_u1305 : (string, Frontend_dAst.t_Pat) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1306 : string B_dData_dList.t_List) -> (match dtb_u_u1305 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1307, dtb_u_u1308) -> ((v_fieldPatsGo dtb_u_u1308) ((v_patRefNamesGo (B_dData_dPair.v_secondOf dtb_u_u1307)) dtb_u_u1306))
  | B_dData_dList.C_List_Nil -> dtb_u_u1306
  | _ -> failwith "DT: impossible branch"
))

# 1258 "Vuna/Compiler/Loader/Flatten.vuna"
let v_patRefNames = (fun (dtb_u_u1309 : Frontend_dAst.t_Pat) -> ((v_patRefNamesGo dtb_u_u1309) B_dData_dList.C_List_Nil))

# 1285 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_exprRefNamesGo = (fun (dtb_u_u1310 : Frontend_dAst.t_Expr) (dtb_u_u1311 : string B_dData_dList.t_List) -> (match dtb_u_u1310 with
  | Frontend_dAst.C_Expr_EInterp (dtb_u_u1312, dtb_u_u1313) -> ((v_interpPartRefNamesListGo dtb_u_u1312) dtb_u_u1311)
  | Frontend_dAst.C_Expr_EDo (dtb_u_u1314, dtb_u_u1315) -> ((v_doStmtRefNamesListGo dtb_u_u1314) dtb_u_u1311)
  | Frontend_dAst.C_Expr_ERecUpdate (dtb_u_u1316, dtb_u_u1317, dtb_u_u1318) -> ((v_exprRefNamesGo dtb_u_u1316) ((v_fieldExprsGo dtb_u_u1317) dtb_u_u1311))
  | Frontend_dAst.C_Expr_ERecord (dtb_u_u1319, dtb_u_u1320, dtb_u_u1321) -> ((v_fieldExprsGo dtb_u_u1320) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1319, dtb_u_u1311)))
  | Frontend_dAst.C_Expr_EField (dtb_u_u1322, dtb_u_u1323, dtb_u_u1324) -> ((v_exprRefNamesGo dtb_u_u1322) dtb_u_u1311)
  | Frontend_dAst.C_Expr_EIf (dtb_u_u1325, dtb_u_u1326, dtb_u_u1327, dtb_u_u1328) -> ((v_exprRefNamesGo dtb_u_u1325) ((v_exprRefNamesGo dtb_u_u1326) ((v_exprRefNamesGo dtb_u_u1327) dtb_u_u1311)))
  | Frontend_dAst.C_Expr_ECase (dtb_u_u1329, dtb_u_u1330, dtb_u_u1331) -> ((v_exprRefNamesGo dtb_u_u1329) ((v_altRefNamesListGo dtb_u_u1330) dtb_u_u1311))
  | Frontend_dAst.C_Expr_ELet (dtb_u_u1332, dtb_u_u1333, dtb_u_u1334, dtb_u_u1335) -> ((v_exprRefNamesGo dtb_u_u1333) ((v_bindRefNamesListGo dtb_u_u1332) dtb_u_u1311))
  | Frontend_dAst.C_Expr_EPi (dtb_u_u1336, dtb_u_u1337, dtb_u_u1338, dtb_u_u1339, dtb_u_u1340, dtb_u_u1341) -> ((v_exprRefNamesGo dtb_u_u1339) ((v_exprRefNamesGo dtb_u_u1340) dtb_u_u1311))
  | Frontend_dAst.C_Expr_EApp (dtb_u_u1342, dtb_u_u1343, dtb_u_u1344) -> ((v_exprRefNamesGo dtb_u_u1342) ((v_exprRefNamesListGo dtb_u_u1343) dtb_u_u1311))
  | Frontend_dAst.C_Expr_ELam (dtb_u_u1345, dtb_u_u1346, dtb_u_u1347) -> ((v_exprRefNamesGo dtb_u_u1346) dtb_u_u1311)
  | Frontend_dAst.C_Expr_EFloat (dtb_u_u1348, dtb_u_u1349) -> dtb_u_u1311
  | Frontend_dAst.C_Expr_EStr (dtb_u_u1350, dtb_u_u1351) -> dtb_u_u1311
  | Frontend_dAst.C_Expr_EInt (dtb_u_u1352, dtb_u_u1353) -> dtb_u_u1311
  | Frontend_dAst.C_Expr_EVar (dtb_u_u1354, dtb_u_u1355) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u1354, dtb_u_u1311))
  | _ -> failwith "DT: impossible branch"
))
# 1302 "Vuna/Compiler/Loader/Flatten.vuna"
and v_exprRefNamesListGo = (fun (dtb_u_u1356 : Frontend_dAst.t_Expr B_dData_dList.t_List) (dtb_u_u1357 : string B_dData_dList.t_List) -> (match dtb_u_u1356 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1358, dtb_u_u1359) -> ((v_exprRefNamesListGo dtb_u_u1359) ((v_exprRefNamesGo dtb_u_u1358) dtb_u_u1357))
  | B_dData_dList.C_List_Nil -> dtb_u_u1357
  | _ -> failwith "DT: impossible branch"
))
# 1306 "Vuna/Compiler/Loader/Flatten.vuna"
and v_fieldExprsGo = (fun (dtb_u_u1360 : (string, Frontend_dAst.t_Expr) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u1361 : string B_dData_dList.t_List) -> (match dtb_u_u1360 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1362, dtb_u_u1363) -> ((v_fieldExprsGo dtb_u_u1363) ((v_exprRefNamesGo (B_dData_dPair.v_secondOf dtb_u_u1362)) dtb_u_u1361))
  | B_dData_dList.C_List_Nil -> dtb_u_u1361
  | _ -> failwith "DT: impossible branch"
))
# 1311 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesGo = (fun (dtb_u_u1364 : Frontend_dAst.t_Binding) (dtb_u_u1365 : string B_dData_dList.t_List) -> ((v_patRefNamesGo (dtb_u_u1364).Frontend_dAst.f_Binding_bindPat) ((v_bindingValueRefNames (dtb_u_u1364).Frontend_dAst.f_Binding_bindValue) ((v_bindingSigRefNames (dtb_u_u1364).Frontend_dAst.f_Binding_bindSig) dtb_u_u1365))))
# 1316 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingValueRefNames = (fun (dtb_u_u1366 : Frontend_dAst.t_BindingValue) (dtb_u_u1367 : string B_dData_dList.t_List) -> (match dtb_u_u1366 with
  | Frontend_dAst.C_BindingValue_BClauses (dtb_u_u1368) -> ((v_clauseRefNamesListGo dtb_u_u1368) dtb_u_u1367)
  | Frontend_dAst.C_BindingValue_BVal (dtb_u_u1369) -> ((v_exprRefNamesGo dtb_u_u1369) dtb_u_u1367)
  | _ -> failwith "DT: impossible branch"
))
# 1321 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindingSigRefNames = (fun (dtb_u_u1370 : Frontend_dAst.t_BindingSig B_dData_dMaybe.t_Maybe) (dtb_u_u1371 : string B_dData_dList.t_List) -> (match dtb_u_u1370 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1372) -> ((v_exprRefNamesGo (dtb_u_u1372).Frontend_dAst.f_BindingSig_sigType) dtb_u_u1371)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u1371
  | _ -> failwith "DT: impossible branch"
))
# 1325 "Vuna/Compiler/Loader/Flatten.vuna"
and v_bindRefNamesListGo = (fun (dtb_u_u1373 : Frontend_dAst.t_Binding B_dData_dList.t_List) (dtb_u_u1374 : string B_dData_dList.t_List) -> (match dtb_u_u1373 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1375, dtb_u_u1376) -> ((v_bindRefNamesListGo dtb_u_u1376) ((v_bindRefNamesGo dtb_u_u1375) dtb_u_u1374))
  | B_dData_dList.C_List_Nil -> dtb_u_u1374
  | _ -> failwith "DT: impossible branch"
))
# 1330 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesGo = (fun (dtb_u_u1377 : Frontend_dAst.t_Alt) (dtb_u_u1378 : string B_dData_dList.t_List) -> ((v_patRefNamesGo (dtb_u_u1377).Frontend_dAst.f_Alt_altPat) ((v_exprRefNamesGo (dtb_u_u1377).Frontend_dAst.f_Alt_altBody) dtb_u_u1378)))
# 1333 "Vuna/Compiler/Loader/Flatten.vuna"
and v_altRefNamesListGo = (fun (dtb_u_u1379 : Frontend_dAst.t_Alt B_dData_dList.t_List) (dtb_u_u1380 : string B_dData_dList.t_List) -> (match dtb_u_u1379 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1381, dtb_u_u1382) -> ((v_altRefNamesListGo dtb_u_u1382) ((v_altRefNamesGo dtb_u_u1381) dtb_u_u1380))
  | B_dData_dList.C_List_Nil -> dtb_u_u1380
  | _ -> failwith "DT: impossible branch"
))
# 1338 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesGo = (fun (dtb_u_u1383 : Frontend_dAst.t_LocalClause) (dtb_u_u1384 : string B_dData_dList.t_List) -> ((v_patRefNamesListGo (dtb_u_u1383).Frontend_dAst.f_LocalClause_lcPats) ((v_exprRefNamesGo (dtb_u_u1383).Frontend_dAst.f_LocalClause_lcBody) dtb_u_u1384)))
# 1341 "Vuna/Compiler/Loader/Flatten.vuna"
and v_clauseRefNamesListGo = (fun (dtb_u_u1385 : Frontend_dAst.t_LocalClause B_dData_dList.t_List) (dtb_u_u1386 : string B_dData_dList.t_List) -> (match dtb_u_u1385 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1387, dtb_u_u1388) -> ((v_clauseRefNamesListGo dtb_u_u1388) ((v_clauseRefNamesGo dtb_u_u1387) dtb_u_u1386))
  | B_dData_dList.C_List_Nil -> dtb_u_u1386
  | _ -> failwith "DT: impossible branch"
))
# 1346 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesGo = (fun (dtb_u_u1389 : Frontend_dAst.t_DoStmt) (dtb_u_u1390 : string B_dData_dList.t_List) -> (match dtb_u_u1389 with
  | Frontend_dAst.C_DoStmt_DLet (dtb_u_u1391, dtb_u_u1392) -> ((v_bindRefNamesListGo dtb_u_u1391) dtb_u_u1390)
  | Frontend_dAst.C_DoStmt_DExpr (dtb_u_u1393, dtb_u_u1394) -> ((v_exprRefNamesGo dtb_u_u1393) dtb_u_u1390)
  | Frontend_dAst.C_DoStmt_DBind (dtb_u_u1395, dtb_u_u1396, dtb_u_u1397) -> ((v_patRefNamesGo dtb_u_u1395) ((v_exprRefNamesGo dtb_u_u1396) dtb_u_u1390))
  | _ -> failwith "DT: impossible branch"
))
# 1351 "Vuna/Compiler/Loader/Flatten.vuna"
and v_doStmtRefNamesListGo = (fun (dtb_u_u1398 : Frontend_dAst.t_DoStmt B_dData_dList.t_List) (dtb_u_u1399 : string B_dData_dList.t_List) -> (match dtb_u_u1398 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1400, dtb_u_u1401) -> ((v_doStmtRefNamesListGo dtb_u_u1401) ((v_doStmtRefNamesGo dtb_u_u1400) dtb_u_u1399))
  | B_dData_dList.C_List_Nil -> dtb_u_u1399
  | _ -> failwith "DT: impossible branch"
))
# 1356 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesGo = (fun (dtb_u_u1402 : Frontend_dAst.t_InterpPart) (dtb_u_u1403 : string B_dData_dList.t_List) -> (match dtb_u_u1402 with
  | Frontend_dAst.C_InterpPart_IPHole (dtb_u_u1404) -> ((v_exprRefNamesGo dtb_u_u1404) dtb_u_u1403)
  | Frontend_dAst.C_InterpPart_IPText (dtb_u_u1405) -> dtb_u_u1403
  | _ -> failwith "DT: impossible branch"
))
# 1360 "Vuna/Compiler/Loader/Flatten.vuna"
and v_interpPartRefNamesListGo = (fun (dtb_u_u1406 : Frontend_dAst.t_InterpPart B_dData_dList.t_List) (dtb_u_u1407 : string B_dData_dList.t_List) -> (match dtb_u_u1406 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1408, dtb_u_u1409) -> ((v_interpPartRefNamesListGo dtb_u_u1409) ((v_interpPartRefNamesGo dtb_u_u1408) dtb_u_u1407))
  | B_dData_dList.C_List_Nil -> dtb_u_u1407
  | _ -> failwith "DT: impossible branch"
))

# 1282 "Vuna/Compiler/Loader/Flatten.vuna"
let v_exprRefNames = (fun (dtb_u_u1410 : Frontend_dAst.t_Expr) -> ((v_exprRefNamesGo dtb_u_u1410) B_dData_dList.C_List_Nil))

# 1246 "Vuna/Compiler/Loader/Flatten.vuna"
let v_ctorRefNames = (fun (dtb_u_u1411 : Frontend_dAst.t_Ctor) -> (v_exprRefNames (dtb_u_u1411).Frontend_dAst.f_Ctor_ctorType))

# 1250 "Vuna/Compiler/Loader/Flatten.vuna"
let v_fieldRefNames = (fun (dtb_u_u1412 : Frontend_dAst.t_Field) -> (v_exprRefNames (dtb_u_u1412).Frontend_dAst.f_Field_fieldType))

# 1254 "Vuna/Compiler/Loader/Flatten.vuna"
let v_traitMethodRefNames = (fun (dtb_u_u1413 : Frontend_dAst.t_TraitMethod) -> (v_exprRefNames (dtb_u_u1413).Frontend_dAst.f_TraitMethod_traitMethodType))

# 1231 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_declRefNames = (fun (dtb_u_u1414 : Frontend_dAst.t_Decl) -> (match dtb_u_u1414 with
  | Frontend_dAst.C_Decl_DFun (dtb_u_u1415, dtb_u_u1416, dtb_u_u1417, dtb_u_u1418) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_patRefNames) dtb_u_u1416)) (v_exprRefNames dtb_u_u1417))
  | Frontend_dAst.C_Decl_DExtern (dtb_u_u1419, dtb_u_u1420, dtb_u_u1421, dtb_u_u1422) -> (v_exprRefNames dtb_u_u1421)
  | Frontend_dAst.C_Decl_DAxiom (dtb_u_u1423, dtb_u_u1424, dtb_u_u1425) -> (v_exprRefNames dtb_u_u1424)
  | Frontend_dAst.C_Decl_DSig (dtb_u_u1426, dtb_u_u1427, dtb_u_u1428, dtb_u_u1429) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb_u_u1427)) (v_exprRefNames dtb_u_u1428))
  | Frontend_dAst.C_Decl_DInstance (dtb_u_u1430, dtb_u_u1431, dtb_u_u1432, dtb_u_u1433) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb_u_u1430)) ((B_dData_dList.v_append (v_exprRefNames dtb_u_u1431)) ((B_dData_dList.v_concatMap v_declRefNames) dtb_u_u1432)))
  | Frontend_dAst.C_Decl_DTrait (dtb_u_u1434, dtb_u_u1435, dtb_u_u1436, dtb_u_u1437, dtb_u_u1438) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_exprRefNames) dtb_u_u1436)) ((B_dData_dList.v_concatMap v_traitMethodRefNames) dtb_u_u1437))
  | Frontend_dAst.C_Decl_DRecord (dtb_u_u1439, dtb_u_u1440, dtb_u_u1441, dtb_u_u1442, dtb_u_u1443, dtb_u_u1444, dtb_u_u1445, dtb_u_u1446) -> ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_fieldRefNames) dtb_u_u1441)) dtb_u_u1442)
  | Frontend_dAst.C_Decl_DData (dtb_u_u1447, dtb_u_u1448, dtb_u_u1449, dtb_u_u1450, dtb_u_u1451, dtb_u_u1452, dtb_u_u1453, dtb_u_u1454, dtb_u_u1455) -> ((B_dData_dList.v_append (v_exprRefNames dtb_u_u1449)) ((B_dData_dList.v_append ((B_dData_dList.v_concatMap v_ctorRefNames) dtb_u_u1450)) dtb_u_u1451))
  | _ -> failwith "DT: impossible branch"
))

# 1203 "Vuna/Compiler/Loader/Flatten.vuna"
let v_declGlobalNames = (fun (dtb_u_u1456 : Frontend_dAst.t_Decl) -> ((B_dData_dList.v_concatMap v_expandGlobalName) (v_declRefNames dtb_u_u1456)))

# 1072 "Vuna/Compiler/Loader/Flatten.vuna"
let v_unusedImportWarnings = (fun (dtb_u_u1457 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1458 : Frontend_dAst.t_Import B_dData_dList.t_List) (dtb_u_u1459 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1460 : Frontend_dAst.t_Decl B_dData_dList.t_List) (dtb_u_u1461 : string B_dData_dList.t_List) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.names") (fun (dtb_u_u1462 : int) -> (let dtb_u_u1463 = ((B_dData_dList.v_concatMap v_declRefNames) dtb_u_u1460) in (let dtb_u_u1464 = (if ((B_dData_dList.v_memName "interp") dtb_u_u1463) then true else ((B_dData_dList.v_memName Base_dIntrinsics.v_interpMethodName) dtb_u_u1463)) in (let dtb_u_u1465 = ((B_dData_dList.v_concatMap v_declGlobalNames) dtb_u_u1459) in (let dtb_u_u1466 = (if dtb_u_u1464 then dtb_u_u1465 else ((B_dData_dList.v_filter (fun (dtb_u_u1473 : string) -> (dtb_u_u1473 <> Base_dIntrinsics.v_interpMethodName))) dtb_u_u1465)) in (let dtb_u_u1467 = (B_dContainer_dHashMap.v_ofNames dtb_u_u1466) in (let dtb_u_u1468 = (B_dContainer_dHashMap.v_ofNames ((v_visibleFixityOps dtb_u_u1457) dtb_u_u1458)) in ((Base_dObs.v_obsCheck "vuna.resolve.warn.sources") (fun (dtb_u_u1469 : int) -> ((Base_dObs.v_obsCheck "vuna.resolve.warn.imports") (fun (dtb_u_u1470 : int) -> (let dtb_u_u1471 = (B_dContainer_dHashMap.v_ofNames ((B_dData_dList.v_filter (fun (dtb_u_u1472 : string) -> ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u1472) dtb_u_u1468))) dtb_u_u1463)) in ((((((v_unusedImportWarningsGo dtb_u_u1457) dtb_u_u1467) dtb_u_u1471) dtb_u_u1459) dtb_u_u1461) dtb_u_u1458)))))))))))))))

# 1058 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveModuleGo = (fun (dtb_u_u1474 : bool) (dtb_u_u1475 : Loader_dModules.t_Module) (dtb_u_u1476 : Loader_dModules.t_Module B_dData_dList.t_List) (dtb_u_u1477 : Frontend_dAst.t_Decl B_dData_dList.t_List Base_dDiag.t_Check) -> ((Base_dCommon.v_bind dtb_u_u1477) (fun (dtb_u_u1478 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> (let dtb_u_u1479 = (B_dData_dList.C_List__x58__x58_ ({ Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf dtb_u_u1475); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf dtb_u_u1475); Loader_dModules.f_Module_moduleImportsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u1478; Loader_dModules.f_Module_moduleExportsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf dtb_u_u1475); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf dtb_u_u1475); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf dtb_u_u1475); Loader_dModules.f_Module_moduleExportIndexOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleFixFactsOf }, dtb_u_u1476)) in (let dtb_u_u1480 = ((Base_dObs.v_obsPure "vuna.resolve.ns") (fun (dtb_u_u1485 : int) -> ((((Loader_dResolve.v_namespacesOfWith dtb_u_u1474) dtb_u_u1479) dtb_u_u1478) (Loader_dModules.v_moduleAllImportsOf dtb_u_u1475)))) in ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.module") (fun (dtb_u_u1481 : int) -> ((((((Loader_dResolve.v_resolveProgram dtb_u_u1479) (Loader_dModules.v_moduleNameOf dtb_u_u1475)) (Loader_dModules.v_moduleNameOf dtb_u_u1475)) dtb_u_u1480) (Loader_dModules.v_moduleAllImportsOf dtb_u_u1475)) dtb_u_u1478)))) (fun (dtb_u_u1482 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (dtb_u_u1483 : int) -> (((((v_unusedImportWarnings dtb_u_u1479) (dtb_u_u1475).Loader_dModules.f_Module_moduleImportsOf) dtb_u_u1482) dtb_u_u1478) (Loader_dModules.v_moduleReexportsOf dtb_u_u1475))))) (fun (dtb_u_u1484 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { Loader_dModules.f_Module_moduleNameOf = (Loader_dModules.v_moduleNameOf dtb_u_u1475); Loader_dModules.f_Module_modulePackageOf = (Loader_dModules.v_modulePackageOf dtb_u_u1475); Loader_dModules.f_Module_moduleImportsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleImportsOf; Loader_dModules.f_Module_moduleImplicitImportsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleImplicitImportsOf; Loader_dModules.f_Module_moduleDeclsOf = dtb_u_u1482; Loader_dModules.f_Module_moduleExportsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleExportsOf; Loader_dModules.f_Module_moduleFixitiesOf = (Loader_dModules.v_moduleFixitiesOf dtb_u_u1475); Loader_dModules.f_Module_moduleReexportsOf = (Loader_dModules.v_moduleReexportsOf dtb_u_u1475); Loader_dModules.f_Module_moduleOpaqueOf = (Loader_dModules.v_moduleOpaqueOf dtb_u_u1475); Loader_dModules.f_Module_moduleExportIndexOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleExportIndexOf; Loader_dModules.f_Module_moduleFixFactsOf = (dtb_u_u1475).Loader_dModules.f_Module_moduleFixFactsOf }; B_dData_dPair.f_Pair_second = dtb_u_u1484 })))))))))))

# 1044 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_resolveModulesKeep = (fun (dtb_u_u1486 : bool) (dtb_u_u1487 : string B_dData_dList.t_List) (dtb_u_u1488 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) (dtb_u_u1489 : Loader_dModules.t_Module B_dData_dList.t_List) -> (match dtb_u_u1489 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1490, dtb_u_u1491) -> (if ((B_dData_dList.v_memName (Loader_dModules.v_moduleNameOf dtb_u_u1490)) dtb_u_u1487) then ((Base_dCommon.v_bind ((((v_resolveModulesKeep dtb_u_u1486) dtb_u_u1487) dtb_u_u1488) dtb_u_u1491)) (fun (dtb_u_u1492 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u1490, (B_dData_dPair.v_firstOf dtb_u_u1492))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1492) })))) else ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (dtb_u_u1493 : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf (dtb_u_u1490).Loader_dModules.f_Module_moduleFixFactsOf) dtb_u_u1488)) (Loader_dModules.v_moduleDeclsOf dtb_u_u1490))))) (fun (dtb_u_u1494 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModuleGo dtb_u_u1486) dtb_u_u1490) dtb_u_u1491) ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (dtb_u_u1495 : int) -> ((Loader_dExpand.v_expandDecls (Loader_dModules.v_moduleNameOf dtb_u_u1490)) dtb_u_u1494))))) (fun (dtb_u_u1496 : (Loader_dModules.t_Module, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep dtb_u_u1486) dtb_u_u1487) dtb_u_u1488) dtb_u_u1491)) (fun (dtb_u_u1497 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u1496), (B_dData_dPair.v_firstOf dtb_u_u1497))); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append (B_dData_dPair.v_secondOf dtb_u_u1496)) (B_dData_dPair.v_secondOf dtb_u_u1497)) })))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = B_dData_dList.C_List_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 1036 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectKeeping = (fun (dtb_u_u1498 : bool) (dtb_u_u1499 : string B_dData_dList.t_List) (dtb_u_u1500 : Loader_dModules.t_Project) -> (match dtb_u_u1500 with
  | { Loader_dModules.f_Project_projectEntryDecls = dtb_u_u1501; Loader_dModules.f_Project_projectEntryImports = dtb_u_u1502; Loader_dModules.f_Project_projectImplicitImports = dtb_u_u1503; Loader_dModules.f_Project_projectModules = dtb_u_u1504; Loader_dModules.f_Project_projectEntryPkg = dtb_u_u1505; Loader_dModules.f_Project_projectEntryFixities = dtb_u_u1506; Loader_dModules.f_Project_projectEntryName = dtb_u_u1507; Loader_dModules.f_Project_projectEntryFacts = dtb_u_u1508 } -> (let dtb_u_u1509 = ((v_dedupeFixitiesOf dtb_u_u1504) dtb_u_u1506) in ((Base_dCommon.v_bind (Loader_dFixity.v_checkUniqueFixities dtb_u_u1509)) (fun (dtb_u_u1510 : Frontend_dAst.t_FixityDecl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.reorder") (fun (dtb_u_u1511 : int) -> ((Loader_dFixity.v_reorderProgram ((Loader_dFixity.v_tableOf dtb_u_u1508) dtb_u_u1510)) dtb_u_u1501)))) (fun (dtb_u_u1512 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.expand") (fun (dtb_u_u1513 : int) -> ((Loader_dExpand.v_expandDecls dtb_u_u1507) dtb_u_u1512)))) (fun (dtb_u_u1514 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.entry") (fun (dtb_u_u1515 : int) -> (((((Loader_dResolve.v_resolveEntry dtb_u_u1498) dtb_u_u1504) dtb_u_u1505) ((B_dData_dList.v_append dtb_u_u1502) dtb_u_u1503)) dtb_u_u1514)))) (fun (dtb_u_u1516 : Frontend_dAst.t_Decl B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dObs.v_obsCheck "vuna.resolve.warn") (fun (dtb_u_u1517 : int) -> (((((v_unusedImportWarnings dtb_u_u1504) dtb_u_u1502) dtb_u_u1516) dtb_u_u1514) B_dData_dList.C_List_Nil)))) (fun (dtb_u_u1518 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((((v_resolveModulesKeep dtb_u_u1498) dtb_u_u1499) dtb_u_u1510) dtb_u_u1504)) (fun (dtb_u_u1519 : (Loader_dModules.t_Module B_dData_dList.t_List, Base_dDiag.t_Diagnostic B_dData_dList.t_List) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((B_dData_dList.v_append dtb_u_u1518) (B_dData_dPair.v_secondOf dtb_u_u1519)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u1516; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf dtb_u_u1519) } })))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 1024 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProject = (fun (dtb_u_u1520 : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping false) B_dData_dList.C_List_Nil) dtb_u_u1520))

# 1028 "Vuna/Compiler/Loader/Flatten.vuna"
let v_resolveProjectWith = (fun (dtb_u_u1521 : bool) (dtb_u_u1522 : Loader_dModules.t_Project) -> (((v_resolveProjectKeeping dtb_u_u1521) B_dData_dList.C_List_Nil) dtb_u_u1522))
