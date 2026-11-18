open Vuna_runtime
# 58 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dparseWith = (fun mode path toks -> (match (((Base_dData_dObs_dSpan.v_Base_dData_dObs_dSpan_dobsSpan "vuna.parse.syntax") "vuna.phase") (fun _u -> (((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecoveringTokens path) mode) toks))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__0) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSpanFileIfEmpty path) dtb__0)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__1) -> ((fun parsed -> ((fun errs -> (match errs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (parsed))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__2, dtb__3) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithChildren dtb__3) dtb__2)))
  | _ -> failwith "DT: impossible branch"
)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__1))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__1))
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode = (fun nFs nEnv nProcess mode path src -> (match (((Base_dData_dObs_dSpan.v_Base_dData_dObs_dSpan_dobsSpan "vuna.parse.lex") "vuna.phase") (fun _u -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dlexSource src))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__4) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSpanFileIfEmpty path) dtb__4))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__5) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (((v_Vuna_dCompiler_dLoader_dFlatten_dparseWith mode) path) dtb__5))
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun nFs nEnv nProcess _uarity7 _uarity8 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmStrict) _uarity7) _uarity8))

# 71 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf) modules))

# 92 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfixityDeclKey = (fun d -> ((fun sp -> (String.concat "" [(d).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp; "@"; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp); ":"; (bi_strFromInt (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp)); ":"; (bi_strFromInt (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp))])) (d).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan))

# 80 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, dtb__7) -> ((fun key -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) key) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__8) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__7) mc1) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__7) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) key) 1) mc1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__6, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dfixityDeclKey dtb__6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 101 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith "_") name))

# 104 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> ((((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagAt sp) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhLoad) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

# 111 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (match dtb__9 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> (if (dtb__11 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__11; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__14) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (if (dtb__20 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__20; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__20, Base_dData_dList.C_Base_dData_dList_dList_Nil)) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (if (dtb__28 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__28; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__31) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 122 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__35, dtb__36, dtb__37, dtb__38) -> (if (dtb__35 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__34))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__39, dtb__40, dtb__41, dtb__42) -> (if (dtb__39 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__34))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__43, dtb__44, dtb__45) -> (if (dtb__43 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__34))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__46, dtb__47, dtb__48, dtb__49) -> (if (dtb__46 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__34))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__34)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 131 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__50, dtb__51) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__50) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__50))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__51))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__54; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__55; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__56 } -> (if (dtb__54 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__54)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__53))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 143 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__59; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) })) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc0))) dtb__62))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__58))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> (if (dtb__68 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__68; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 }, ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__58))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__58))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap (fun m -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__76; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) })) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc0))) dtb__79))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__58))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__58)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__81; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__81); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1) }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__82)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__83; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) dtb__83); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1) }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) mc1) dtb__84)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (match dtb__85 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (dtb__87 = mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__87; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__87); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__87) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__90)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__86) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> (if (dtb__96 = mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__96; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__96); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__96) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__96, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__86) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108) -> (if (dtb__104 = mc2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__104; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__104); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__104) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__107)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__86) mc2))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__86) mc2)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, dtb__110) -> (if (if ((dtb__109).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__109).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = mc0) else false) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__109, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__110))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__110))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (if (dtb__113 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__112))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__112)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot target)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__122 } -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__122) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (match dtb__123 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__124; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__125; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__126; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__127; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__128; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__129; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__130; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__131; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__132; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__133 } -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__122) dtb__128)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__121))
  | _ -> failwith "DT: impossible branch"
))

# 204 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__134) -> (match dtb__134 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__135; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__136; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__137 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__138) -> (match dtb__138 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__139; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__140; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__141 } -> (if (if (if (dtb__135 = "type") then (dtb__139 = "ctor") else false) then (dtb__136 = dtb__140) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__136) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142) -> (match dtb__142 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__143; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__144; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__145 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__143; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__144; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__145 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))))
)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__146) -> (match dtb__146 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__147; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__148 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__147); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

# 262 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (match dtb__149 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__151) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc1))) dtb__154)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__150))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__160, dtb__161, dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> (if (dtb__160 = mc1) then ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__160) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__160, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__150)) else (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__150))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__168) ((Base_dData_dList.v_Base_dData_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc1))) dtb__171)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__150))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__150)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 249 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }))))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))))
)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__175, dtb__176) -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousConstructorExport (name))) name)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = (dtb__173).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = (dtb__173).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed prefix) name) decls)))

# 243 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__177) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__177); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_drenameExportEntry = (fun public e -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = public; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent })

# 303 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_drenameTypeEntry = (fun public e -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = public; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" })

# 316 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disEmptyEntries = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> false
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> ((fun values -> ((fun types -> ((fun entries -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disEmptyEntries entries) then (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (entries)))) ((Base_dData_dList.v_Base_dData_dList_dappend values) types))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dLoader_dFlatten_drenameTypeEntry base)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes es) base)))) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dLoader_dFlatten_drenameExportEntry base)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) base))))))

# 358 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__180) = mc1) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf dtb__181) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (match dtb__182 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__184, dtb__185, dtb__186) -> (if (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf mc0) dtb__184) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf mc2) dtb__184)) then (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo mc0) dtb__183) mc2) else (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo mc0) dtb__183) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__184; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__185; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__186 }, mc2))))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo mc0) dtb__183) mc2)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf = (fun imports items -> ((Base_dData_dList.v_Base_dData_dList_dappend imports) (Base_dData_dList.v_Base_dData_dList_dreverse (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo imports) items) Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 369 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__187, dtb__188) -> (match dtb__188 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> dtb__187
  | _ -> (String.concat "" [dtb__187; ", "; (v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames dtb__188)])
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 363 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix = (fun imports prefix -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (prefix))) prefix)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, dtb__190) -> (match dtb__190 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__189))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (prefix, (v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames nd_uscrut2)))) prefix) (v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames nd_uscrut2))
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dqualifierCandidates imports) prefix)))

# 279 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__191; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__192 } -> (match dtb__191 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match vr with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__193) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__194) -> (match vr with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__195) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((fun mprefix -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix imports) mprefix)) (fun m -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) m) dtb__192) name) sp)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__191))
)
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 } -> (match dtb__196 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries prefix) decls) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__198) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__198))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = name; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = tgt; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))))
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((fun mprefix -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix imports) mprefix)) (fun m -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__197) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__199) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__197; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__199).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (dtb__199).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) es)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__197, m))) dtb__197) m)
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__196))
)
  | _ -> failwith "DT: impossible branch"
))

# 392 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry = (fun path target -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "module"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = path; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" })

# 396 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__200, dtb__201) -> (if (if ((dtb__200).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then (Base_dData_dBool.v_Base_dData_dBool_dnot ((Base_dData_dList.v_Base_dData_dList_dmemName (dtb__200).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) mc0)) else false) then ((v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers mc0) dtb__201) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__200, ((v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers mc0) dtb__201))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__202, dtb__203) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__202) dtb__203)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__204, dtb__205, dtb__206) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__204) dtb__206)) (fun es -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers dtb__205) es)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__207, dtb__208) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__207) dtb__208)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__209, dtb__210, dtb__211) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix mc3) dtb__209)) (fun m -> (match dtb__210 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) m)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__212) -> (if (dtb__212 = dtb__209) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry dtb__209) m), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry dtb__209) m), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry dtb__212) m), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__213, dtb__214) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix mc3) dtb__213)) (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) m)))
  | _ -> failwith "DT: impossible branch"
))

# 405 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent]))

# 408 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, dtb__216) -> ((fun key -> (match ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dlookup Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) key) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__217) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__216) mc1) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__216) ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dinsert Base_dData_dString.v_Hashable_uString) key) 1) mc1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__215, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__215))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 402 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) ((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dfromList Base_dData_dString.v_Hashable_uString) Base_dData_dList.C_Base_dData_dList_dList_Nil)) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 425 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__218)) (fun es -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__219)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend es) tail)))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))
))

# 431 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__220) -> (match dtb__220 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__221; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__222; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__223; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__224; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__225; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__226; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__227 } -> (if (dtb__221 = mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 dtb__227) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNameMismatch (dtb__221))) dtb__221))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 436 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__228, dtb__229) -> (match (dtb__228).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityOpaque -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName dtb__228)), ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf mc0) dtb__229)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityTransparent -> ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf mc0) dtb__229)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityAbstract -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((":" ^ ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName dtb__228))), ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf mc0) dtb__229)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix = ":"

# 446 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName = (fun name -> (if ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix) name) then (((dtp_substring (bi_strLength v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix)) ((bi_strLength name) - (bi_strLength v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix))) name) else name))

# 453 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName = (fun name -> ((Base_dData_dString.v_Base_dData_dString_dstartsWith v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix) name))

# 470 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__230, dtb__231) -> true
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportSpecToItem = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__232, dtb__233, dtb__234) -> (match dtb__233 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMOnly (dtb__235) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__232, dtb__235, dtb__234))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMAll -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__232, dtb__234))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMNone -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__232, dtb__234))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__236, dtb__237) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__236, dtb__237))
  | _ -> failwith "DT: impossible branch"
))

# 456 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun modules prefix hdr imports decls extraExports extraReexports -> ((fun newItems -> ((fun explicit -> (if (v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty newItems) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> explicit
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__238) -> (match dtb__238 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__239; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__240; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__241; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__242; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__243; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__244; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__245 } -> (if dtb__240 then (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 dtb__245) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_DuplicateExport ("module header"))) "module header") else explicit)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) hdr) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__246) -> (match dtb__246 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__247; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__248; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__249; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__250; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__251; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__252; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__253 } -> (if dtb__248 then (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports modules) prefix) decls) imports) dtb__249) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) hdr))) (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports modules) prefix) decls) imports) newItems))) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dFlatten_dexportSpecToItem) extraExports)) extraReexports)))

# 480 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (name, stack)))))

# 502 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, dtb__255) -> (match dtb__255 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = "Prelude"; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithAbsent Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dNoSourceReason_NsPackageGraph)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousPrelude ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName (Base_dData_dPair.v_Base_dData_dPair_dsecondOf c)))) mc1))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows ((Base_dData_dList.v_Base_dData_dList_dmap (fun c -> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName (Base_dData_dPair.v_Base_dData_dPair_dsecondOf c)))) mc1))))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun nFs roots importerPkg -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) roots) "Prelude") importerPkg) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName (Base_dData_dPair.v_Base_dData_dPair_dsecondOf c)) <> importerPkg))) allowed)))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf collected)))))

# 488 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun nFs roots importerPkg currentName imports -> (if (currentName = "Prelude") then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if ((Base_dData_dList.v_Base_dData_dList_dmemName "Prelude") (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom nFs) roots) importerPkg))))

# 511 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck = (fun roots project -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dLayers.v_Vuna_dCompiler_dLoader_dLayers_dcheckProjectLayers roots) project)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (project)))))

# 515 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan = (fun imp e -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) = "") then e else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) e)))

# 536 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__256, dtb__257) -> (if (mc0 <= 0) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__256, ((v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal (mc0 - 1)) dtb__257))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dpathPrefixOf = (fun nFs roots importerPkg segs n -> (if (n < 1) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing) else (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) roots) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal n) segs))) importerPkg) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun collected -> (if (v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty (Base_dData_dPair.v_Base_dData_dPair_dfirstOf collected)) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal n) segs)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = n }))) else (((((v_Vuna_dCompiler_dLoader_dFlatten_dpathPrefixOf nFs) roots) importerPkg) segs) (n - 1)))))))

# 540 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dnsDropLocal = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259) -> (if (mc0 <= 0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__258, dtb__259)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dnsDropLocal (mc0 - 1)) dtb__259))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 519 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun nFs nEnv nProcess fuel roots importerPkg modules stack imports -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "loader")) else (match imports with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (modules)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) dtb__260)) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__262) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__262)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__263) -> (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) dtb__263) stack) dtb__261)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 544 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun nFs nEnv nProcess fuel roots importerPkg modules stack imp -> ((fun name -> (if (fuel <= 0) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "loader")) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__264) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (modules)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName name) stack) then ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan imp)) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) else (if (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile nFs) roots) name) importerPkg) (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan)) (fun foundR -> (match foundR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__265) -> (match (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__265)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__266) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dpathPrefixOf nFs) roots) importerPkg) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) ((Base_dData_dList.v_Base_dData_dList_dlength (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) - 1))) (fun prefixR -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__267) -> (match dtb__267 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__268; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__269 } -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__268; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan })) (fun modsR -> (match modsR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__270) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__270)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__271) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__271) dtb__268) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__265)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__272) -> (match (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndex dtb__271) dtb__268) ((v_Vuna_dCompiler_dLoader_dFlatten_dnsDropLocal dtb__269) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__265)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__273) -> (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule nFs) nEnv) nProcess) (fuel - 1)) roots) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__272)) dtb__271) stack) { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__273; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = true; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__265)))
  | _ -> failwith "DT: impossible branch"
)) prefixR)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__274) -> ((fun path -> ((fun root -> ((fun _u -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) path)) (fun text -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__275) -> (match dtb__275 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__276; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__277; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__278; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__279; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__280; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__281; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__282 } -> ((fun imports1 -> ((fun providers -> ((fun modules1 -> ((fun imports -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__276) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__283) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__283)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__284) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__285) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__285)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__286) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) roots) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root)) name) imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__287) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__287)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__288) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) (fuel - 1)) roots) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root)) modules1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (name, stack))) ((Base_dData_dList.v_Base_dData_dList_dappend imports) dtb__288))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__289) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__289)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__290) -> ((fun imports2 -> (match (((((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports dtb__290) name) dtb__276) imports2) dtb__279) dtb__280) dtb__281) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__291) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__291)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__292) -> ((fun visible -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = name; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = imports2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__288; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__279; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__292; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = visible; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = ((Base_dData_dList.v_Base_dData_dList_dappend providers) ((Base_dData_dList.v_Base_dData_dList_dappend ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader imports2) dtb__276)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames imports2) dtb__281))); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf name) dtb__282); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf dtb__292) }, dtb__290)))))) dtb__278)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports dtb__290) imports))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf imports1) dtb__281))) modules)) Base_dData_dList.C_Base_dData_dList_dList_Nil)) dtb__277)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__293) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__293)))
  | _ -> failwith "DT: impossible branch"
)) parsed)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("parse-module=" ^ name)) else 0))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__274))) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__274))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan imp)) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_InvalidModuleName (name))) name)))))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName imp)))

# 628 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded = (fun nFs nEnv nProcess ctx entry preloaded -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsFileExists nFs) entry)) (fun exists -> (if exists then (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((Base_dEffect_dFs.v_Base_dEffect_dFs_dfsReadFile nFs) entry)) (fun text -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) entry) text)) (fun parsed -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__294) -> (match dtb__294 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__295; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__296; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__297; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__298; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__299; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__300; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__301 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun imports1 -> ((fun preloaded1 -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") imports1) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__302) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__302)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__303) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "") imports1)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__304) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__304)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__305) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) preloaded1) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Base_dData_dList.v_Base_dData_dList_dappend imports1) dtb__305))) (fun modulesR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__306) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__306))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__307) -> ((fun imports2 -> ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__298; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = imports2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__305; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__307; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__297 })) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports dtb__307) imports1))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) preloaded)) dtb__296)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__308) -> (match dtb__308 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__309; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__310; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__311; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__312; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__313; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__314; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__315 } -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__315)) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleHeaderInEntryFile (entry))) entry)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__295)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__316) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__316)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))) else ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_EntryFileNotFound (entry))) entry))))))

# 621 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun nFs nEnv nProcess ctx entry -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 667 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded = (fun nFs nEnv nProcess ctx names preloaded -> ((fun entryImports -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dData_dList.C_Base_dData_dList_dList_Nil) entryImports)) (fun modulesR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__317) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__317))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__318) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__318; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = Base_dData_dList.C_Base_dData_dList_dList_Nil })
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun n -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } })) names)))

# 664 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun nFs nEnv nProcess ctx names -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 686 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded = (fun nFs nEnv nProcess ctx label source preloaded -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool) label) source)) (fun parsed -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__319) -> (match dtb__319 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__320; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__321; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__322; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__323; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__324; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__325; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__326 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((fun imports1 -> ((fun preloaded1 -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") imports1) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__327) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__327)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__328) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "") imports1)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__329) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__329)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__330) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) preloaded1) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Base_dData_dList.v_Base_dData_dList_dappend imports1) dtb__330))) (fun modulesR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__332) -> ((fun imports2 -> ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__323; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = imports2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__330; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__332; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__322 })) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports dtb__332) imports1))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) preloaded)) dtb__321)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__333) -> (match dtb__333 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__334; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__335; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__336; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__337; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__338; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__339; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__340 } -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleHeaderInEntrySource (label))) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__320)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__341) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__341)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 682 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun nFs nEnv nProcess ctx label source -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 726 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded = (fun nFs nEnv nProcess ctx label source preloaded -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool) label) source)) (fun parsed -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__342) -> (match dtb__342 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__343; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__344; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__345; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__346; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__347; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__348; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__349 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__350) -> (match dtb__350 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__351; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__352; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__353; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__354; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__355; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__356; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__357 } -> ((fun imports1 -> ((fun providers -> ((fun preloaded1 -> ((fun imports -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__351) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__358) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__358)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__359) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__351) imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__360) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__360)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__361) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) preloaded1) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Base_dData_dList.v_Base_dData_dList_dappend imports) dtb__361))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__362) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__362)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__363) -> ((fun imports2 -> (match (((((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports dtb__363) dtb__351) dtb__343) imports2) dtb__346) dtb__347) dtb__348) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__364) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__364)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__365) -> ((fun visible -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = Base_dData_dList.C_Base_dData_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = imports2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__361; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__351; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = imports2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__361; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__346; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__365; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = visible; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = ((Base_dData_dList.v_Base_dData_dList_dappend providers) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames imports2) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__353) dtb__348))); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf dtb__351) dtb__349); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf dtb__365) }, dtb__363)); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = Base_dData_dList.C_Base_dData_dList_dList_Nil }))) dtb__345)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports dtb__363) imports))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf imports1) dtb__348))) preloaded)) Base_dData_dList.C_Base_dData_dList_dList_Nil)) dtb__344)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)
  | _ -> failwith "DT: impossible branch"
)) dtb__343)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__366) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__366)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 722 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun nFs nEnv nProcess ctx label source -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 771 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun nFs nEnv nProcess ctx modules0 label source -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool) label) source)) (fun parsed -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__367) -> (match dtb__367 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__368; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__369; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__370; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__371; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__372; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__373; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__374 } -> ((fun imports1 -> ((fun modules1 -> ((fun imports -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__375) -> (match dtb__375 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__376; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__377; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__378; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__379; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__380; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__381; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__382 } -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__376) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__383) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__383)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__384) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__376) imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__385) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__385)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__386) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) modules1) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Base_dData_dList.v_Base_dData_dList_dappend imports) dtb__386))) (fun modulesR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__387) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__387))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__388) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__388; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dData_dList.v_Base_dData_dList_dappend dtb__370) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__388) ((Base_dData_dList.v_Base_dData_dList_dappend ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports dtb__388) imports)) dtb__386)))) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__389) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__389)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__390) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__391) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__391)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__392) -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) modules1) Base_dData_dList.C_Base_dData_dList_dList_Nil) ((Base_dData_dList.v_Base_dData_dList_dappend imports) dtb__392))) (fun modulesR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__393) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__393))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__394) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__394; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dData_dList.v_Base_dData_dList_dappend dtb__370) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__394) ((Base_dData_dList.v_Base_dData_dList_dappend ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dnormalizeImports dtb__394) imports)) dtb__392)))) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__368)) ((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf imports1) dtb__373))) modules0)) dtb__369)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__395) -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__395)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 816 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun nFs nEnv nProcess ctx label source -> (((Base_dTrait_dMonad.v_Base_dTrait_dMonad_d_x62__x62__x61_ Base_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn nFs) nEnv) nProcess) ctx) Base_dData_dList.C_Base_dData_dList_dList_Nil) label) source)) (fun pairR -> ((Base_dTrait_dApplicative.v_Base_dTrait_dApplicative_dpure Base_dEffect_dCore.v_Applicative_uBase_uEffect_uCore_uEff_ur) (match pairR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__396) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__396))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__397) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__397)))
  | _ -> failwith "DT: impossible branch"
)))))

# 883 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan = (fun sp -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp) + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) - ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp) - 1)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) - ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp) - 1)) })

# 897 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName = (fun n -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName n) then (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets n) else (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical n) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__398) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__398, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (n, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 904 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 908 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__399, dtb__400) -> (if ((((Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dmember Base_dData_dString.v_Hashable_uString) Base_dData_dString.v_Eq_uString) dtb__399) mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn mc0) dtb__400))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 874 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__401, dtb__402) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__401))) (fun es -> ((fun used -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo mc0) mc1) mc2) dtb__402)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((if used then more else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((((Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAtMod (fun d -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSuggestion { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionTitle = ("remove unused import " ^ (dtb__401).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionEdits = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editSpan = (v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan (dtb__401).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editNewText = "" }, Base_dData_dList.C_Base_dData_dList_dList_Nil)) }) d))) (dtb__401).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_UnusedImport ((dtb__401).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName))) (Base_dData_dVec.C_Base_dData_dVec_dVec_VCons ((dtb__401).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName, Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))), more)))))))) (if ((Base_dData_dList.v_Base_dData_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__401)) mc2) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn mc1) ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf) es))))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 941 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__403, dtb__404, dtb__405) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__403, ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames (Base_dData_dPair.v_Base_dData_dPair_dsecondOf f)))) dtb__404)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__406, dtb__407) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__408, dtb__409) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__410, dtb__411, dtb__412) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__410, ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) dtb__411)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__413) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__414, dtb__415, dtb__416) -> (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames dtb__415)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__417, dtb__418) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 951 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__419, dtb__420, dtb__421) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames) dtb__420)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__422, dtb__423, dtb__424) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__422)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__423))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__425, dtb__426, dtb__427) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__426, (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__425)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__428, dtb__429, dtb__430) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__428, (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__429)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__431, dtb__432) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__431, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__433, dtb__434, dtb__435, dtb__436) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__433, ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__434)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__435))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__437, dtb__438) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__437)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__439, dtb__440, dtb__441, dtb__442) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__439, ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__440)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__441))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__443, dtb__444) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames) dtb__443)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__445, dtb__446, dtb__447) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__445)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dData_dPair.v_Base_dData_dPair_dsecondOf f)))) dtb__446))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__448, dtb__449, dtb__450) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__448, ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dData_dPair.v_Base_dData_dPair_dsecondOf f)))) dtb__449)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__451, dtb__452, dtb__453) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__451)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__454, dtb__455, dtb__456, dtb__457) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__454)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__455)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__456)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__458, dtb__459, dtb__460) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__458)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames) dtb__459))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__461, dtb__462) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames) dtb__461)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__463, dtb__464, dtb__465, dtb__466) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames) dtb__463)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__464))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__470)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__471))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__473, dtb__474, dtb__475) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__473)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__474))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__476, dtb__477, dtb__478) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__477)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__479, dtb__480) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__481, dtb__482) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__483, dtb__484) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__485, dtb__486) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__485, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 979 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames = (fun p -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))))
# 983 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames = (fun p -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p))) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p))))
# 987 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__487, dtb__488) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__487)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__489, dtb__490, dtb__491) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames dtb__489)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__490))
  | _ -> failwith "DT: impossible branch"
))
# 992 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__492) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__492)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__493) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 929 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames = (fun c -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (c).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType))

# 933 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames = (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType))

# 937 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames = (fun m -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType))

# 914 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__494, dtb__495, dtb__496, dtb__497) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) dtb__495)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__496))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__498, dtb__499, dtb__500, dtb__501) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__500)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__502, dtb__503, dtb__504) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__503)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__505, dtb__506, dtb__507, dtb__508) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__506)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__507))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__509, dtb__510, dtb__511, dtb__512) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__509)) ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__510)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames) dtb__511)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__513, dtb__514, dtb__515, dtb__516, dtb__517) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__515)) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames) dtb__516))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__518, dtb__519, dtb__520, dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames) dtb__520)) dtb__521)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__526, dtb__527, dtb__528, dtb__529, dtb__530, dtb__531, dtb__532, dtb__533, dtb__534) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__528)) ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames) dtb__529)) dtb__530))
  | _ -> failwith "DT: impossible branch"
))

# 868 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource = (fun decls -> ((fun names -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName "interp") names) then true else ((Base_dData_dList.v_Base_dData_dList_dmemName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName) names))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames) decls)))

# 890 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames = (fun d -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName) (v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames d)))

# 854 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings = (fun modules imports decls sourceDecls reexports -> ((fun names0 -> ((fun names -> ((fun nameSet -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo modules) nameSet) reexports) imports)) (Base_dContainer_dHashMap.v_Base_dContainer_dHashMap_dofNames names))) (if (v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource sourceDecls) then names0 else ((Base_dData_dList.v_Base_dData_dList_dfilter (fun n -> (n <> Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName))) names0)))) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames) decls)))

# 841 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__535, dtb__536) -> (match dtb__535 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__543; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__544; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__545; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__546 } -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__537) mc1) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) mc1) mc2) dtb__536)) (fun p2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__543; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__544; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__545; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__546 }, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p2))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p2) })))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf mc2)) dtb__541)) (fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLoader_dExpand.v_Vuna_dCompiler_dLoader_dExpand_dexpandDecls decls2)) (fun decls3 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = decls3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__543; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__544; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__545; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__546 }, dtb__536))) dtb__537) dtb__537) ((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith mc0) decls3)) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__539) dtb__540)) decls3)) (fun d1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = decls3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__543; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__544; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__545; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__546 }, dtb__536))) dtb__539) d1) decls3) dtb__544)) (fun warns -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) mc1) mc2) dtb__536)) (fun p2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = d1; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__543; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__544; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__545; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__546 }, (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p2))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((Base_dData_dList.v_Base_dData_dList_dappend warns) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p2)) })))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Base_dData_dList.C_Base_dData_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 834 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__547; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__548; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__549; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__550; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__551; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__552 } -> ((fun projectFixities -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dcheckUniqueFixities projectFixities)) (fun fixes -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf fixes)) dtb__547)) (fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLoader_dExpand.v_Vuna_dCompiler_dLoader_dExpand_dexpandDecls decls2)) (fun decls3 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry mc0) dtb__550) dtb__551) ((Base_dData_dList.v_Base_dData_dList_dappend dtb__548) dtb__549)) decls3)) (fun entryDecls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings dtb__550) dtb__548) entryDecls) decls3) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (fun entryWarns -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) mc1) fixes) dtb__550)) (fun p2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend entryWarns) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p2)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = entryDecls; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p2) } }))))))))))))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dData_dList.v_Base_dData_dList_dappend ((Base_dData_dList.v_Base_dData_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf) dtb__550)) dtb__552)))
  | _ -> failwith "DT: impossible branch"
))

# 826 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun project -> (((v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping false) Base_dData_dList.C_Base_dData_dList_dList_Nil) project))

# 830 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith = (fun release project -> (((v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping release) Base_dData_dList.C_Base_dData_dList_dList_Nil) project))
