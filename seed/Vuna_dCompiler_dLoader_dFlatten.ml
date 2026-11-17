open Vuna_runtime
# 54 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheSchema = "vuna-lex-cache 3"

# 58 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheCodec = "lex-tokens 3"

# 67 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dlexAddrOf = (fun src -> (Vuna_dCompiler_dLoader_dAddr.v_Vuna_dCompiler_dLoader_dAddr_daddrOf (Base_dList.C_Base_dList_dList__x58__x58_ ("lex", (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheSchema, (Base_dList.C_Base_dList_dList__x58__x58_ (v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheCodec, (Base_dList.C_Base_dList_dList__x58__x58_ ((Vuna_dCompiler_dBase_dHash.v_Vuna_dCompiler_dBase_dHash_dcontentAddress src), Base_dList.C_Base_dList_dList_Nil))))))))))

# 71 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dreadLexCache = (fun nFs nEnv nProcess addr -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff nFs) nEnv) nProcess) "lex") v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheCodec) addr)) (fun payload -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match payload with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> (Vuna_dCompiler_dFrontend_dCanonical_dLex.v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecPTokListComplete dtb__0)
  | _ -> failwith "DT: impossible branch"
)))))

# 80 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dstoreLexCache = (fun nFs nEnv nProcess addr toks -> (((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff nFs) nEnv) nProcess) "lex") v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheCodec) addr) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop Vuna_dCompiler_dFrontend_dCanonical_dLex.v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencPTokList) toks)))

# 111 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dparseWith = (fun mode path toks -> (match (((Base_dObs_dSpan.v_Base_dObs_dSpan_dobsSpan "vuna.parse.syntax") "vuna.phase") (fun _u -> (((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecoveringTokens path) mode) toks))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__1) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSpanFileIfEmpty path) dtb__1)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__2) -> ((fun parsed -> ((fun errs -> (match errs with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (parsed))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithChildren dtb__4) dtb__3)))
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__2))) (Base_dPair.v_Base_dPair_dfirstOf dtb__2))
  | _ -> failwith "DT: impossible branch"
))

# 101 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dlexAndStore = (fun nFs nEnv nProcess mode addr path src -> (match (((Base_dObs_dSpan.v_Base_dObs_dSpan_dobsSpan "vuna.parse.lex") "vuna.phase") (fun _u -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dlexSource src))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__5) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSpanFileIfEmpty path) dtb__5))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__6) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dstoreLexCache nFs) nEnv) nProcess) addr) dtb__6)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dLoader_dFlatten_dparseWith mode) path) dtb__6))))
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode = (fun nFs nEnv nProcess mode path src -> ((fun addr -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dreadLexCache nFs) nEnv) nProcess) addr)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dLoader_dFlatten_dparseWith mode) path) dtb__7))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dlexAndStore nFs) nEnv) nProcess) mode) addr) path) src)
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dLoader_dFlatten_dlexAddrOf src)))

# 86 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun nFs nEnv nProcess _uarity7 _uarity8 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmStrict) _uarity7) _uarity8))

# 124 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf) modules))

# 145 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfixityDeclKey = (fun d -> ((fun sp -> (String.concat "" [(d).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp; "@"; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp); ":"; (bi_strFromInt (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp)); ":"; (bi_strFromInt (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp))])) (d).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixitySpan))

# 133 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, dtb__9) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__9) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__9) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dfixityDeclKey dtb__8))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 154 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith "_") name))

# 157 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> ((((((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagAt sp) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dPhase_PhLoad) Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCategory_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

# 164 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__13, dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> (if (dtb__13 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__16) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__12))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (if (dtb__22 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, Base_dList.C_Base_dList_dList_Nil)) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__12))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> (if (dtb__30 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__30; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__33) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__12))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__12)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__35, dtb__36) -> (match dtb__35 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__37, dtb__38, dtb__39, dtb__40) -> (if (dtb__37 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__36))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__41, dtb__42, dtb__43, dtb__44) -> (if (dtb__41 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__36))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__45, dtb__46, dtb__47) -> (if (dtb__45 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__36))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__48, dtb__49, dtb__50, dtb__51) -> (if (dtb__48 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__36))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__36)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__52, dtb__53) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__52) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__52))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__54, dtb__55) -> (match dtb__54 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__56; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__57; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__58 } -> (if (dtb__56 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__55))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = dtb__61; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) })) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc0))) dtb__64))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__60))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> (if (dtb__70 = mc0) then (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = dtb__70; Base_dPair.f_Base_dPair_dPair_second = dtb__70 }, ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__60))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__60))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = dtb__78; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) })) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc0))) dtb__81))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__60))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__60)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__83; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__83); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1) }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__84)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__85, dtb__86) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__85; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) dtb__85); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1) }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) mc1) dtb__86)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (match dtb__87 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (if (dtb__89 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__89; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__89); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__89) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__92)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__88) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> (if (dtb__98 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__98; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__98); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__98) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__98, Base_dList.C_Base_dList_dList_Nil))))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__88) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110) -> (if (dtb__106 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__106; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__106); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__106) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__109)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__88) mc2))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__88) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 248 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, dtb__112) -> (if (if ((dtb__111).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__111).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = mc0) else false) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__111, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__112))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__112))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__113, dtb__114) -> (match dtb__113 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> (if (dtb__115 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__114))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__114)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot target)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__124 } -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__124) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__125) -> (match dtb__125 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__126; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__127; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__128; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__129; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__130; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__131; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__132; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__133; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__134; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__135 } -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__124) dtb__130)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__123))
  | _ -> failwith "DT: impossible branch"
))

# 257 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> (match dtb__136 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__137; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__138; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__139 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__140) -> (match dtb__140 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__141; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__142; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__143 } -> (if (if (if (dtb__137 = "type") then (dtb__141 = "ctor") else false) then (dtb__138 = dtb__142) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__138) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 281 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__144) -> (match dtb__144 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__145; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__146; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__147 } -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__145; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__146; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__147 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 286 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))))
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__148) -> (match dtb__148 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__149; Base_dPair.f_Base_dPair_dPair_second = dtb__150 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__149); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

# 315 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__151, dtb__152) -> (match dtb__151 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__153) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc1))) dtb__156)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__152))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169) -> (if (dtb__162 = mc1) then ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__162) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__162, Base_dList.C_Base_dList_dList_Nil)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__152)) else (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__152))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__170, dtb__171, dtb__172, dtb__173, dtb__174) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__170) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc1))) dtb__173)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__152))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__152)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 302 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }))))) (Base_dPair.v_Base_dPair_dsecondOf p))))
)))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__175, dtb__176) -> (match dtb__176 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__177, dtb__178) -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousConstructorExport (name))) name)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = (dtb__175).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = (dtb__175).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed prefix) name) decls)))

# 296 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__179) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__179); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

# 351 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_drenameExportEntry = (fun public e -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = public; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent })

# 355 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_drenameTypeEntry = (fun public e -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = public; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" })

# 368 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disEmptyEntries = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__180, dtb__181) -> false
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> ((fun values -> ((fun types -> ((fun entries -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disEmptyEntries entries) then (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (entries)))) ((Base_dList.v_Base_dList_dappend values) types))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dLoader_dFlatten_drenameTypeEntry base)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportTypes es) base)))) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dLoader_dFlatten_drenameExportEntry base)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValues es) base))))))

# 410 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (if ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__182) = mc1) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf dtb__183) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__184, dtb__185) -> (match dtb__184 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__186, dtb__187, dtb__188) -> (if (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf mc0) dtb__186) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasImportOf mc2) dtb__186)) then (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo mc0) dtb__185) mc2) else (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo mc0) dtb__185) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__186; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = dtb__187; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = dtb__188 }, mc2))))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo mc0) dtb__185) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf = (fun imports items -> ((Base_dList.v_Base_dList_dappend imports) (Base_dList.v_Base_dList_dreverse (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsGo imports) items) Base_dList.C_Base_dList_dList_Nil))))

# 416 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexpandPathImports = (fun nFs nEnv nProcess fuel roots importerPkg stack modules imports -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = imports; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = modules } }))))

# 427 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__189, dtb__190) -> (match dtb__190 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__189
  | _ -> (String.concat "" [dtb__189; ", "; (v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames dtb__190)])
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 421 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix = (fun imports prefix -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNotImported (prefix))) prefix)
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (match dtb__192 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__191))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousModule (prefix, (v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames nd_uscrut2)))) prefix) (v_Vuna_dCompiler_dLoader_dFlatten_djoinCommaNames nd_uscrut2))
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dqualifierCandidates imports) prefix)))

# 331 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__193; Base_dPair.f_Base_dPair_dPair_second = dtb__194 } -> (match dtb__193 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__196) -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__197) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((fun mprefix -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix imports) mprefix)) (fun m -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) m) dtb__194) name) sp)))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__193))
)
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitLastDot (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__198; Base_dPair.f_Base_dPair_dPair_second = dtb__199 } -> (match dtb__198 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries prefix) decls) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__200) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__200))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = name; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = tgt; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) ((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)) (Base_dPair.v_Base_dPair_dfirstOf p))))
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((fun mprefix -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix imports) mprefix)) (fun m -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__199) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__201) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__199; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__201).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (dtb__201).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) es)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt2 sp) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__199, m))) dtb__199) m)
  | _ -> failwith "DT: impossible branch"
)))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots dtb__198))
)
  | _ -> failwith "DT: impossible branch"
))

# 450 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry = (fun path target -> { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "module"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = path; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" })

# 454 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__202, dtb__203) -> (if (if ((dtb__202).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (dtb__202).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) mc0)) else false) then ((v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers mc0) dtb__203) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__202, ((v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers mc0) dtb__203))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__204, dtb__205) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__204) dtb__205)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__206, dtb__207, dtb__208) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__206) dtb__208)) (fun es -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers dtb__207) es)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__209, dtb__210) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__209) dtb__210)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XNamespace (dtb__211, dtb__212, dtb__213) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix mc3) dtb__211)) (fun m -> (match dtb__212 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) m)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__214) -> (if (dtb__214 = dtb__211) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry dtb__211) m), Base_dList.C_Base_dList_dList_Nil)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry dtb__211) m), (Base_dList.C_Base_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceEntry dtb__214) m), Base_dList.C_Base_dList_dList_Nil)))))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__215, dtb__216) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveImportPrefix mc3) dtb__215)) (fun m -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) m)))
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent]))

# 466 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__217, dtb__218) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__218) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__218) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__217, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__217))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 460 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

# 483 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__220, dtb__221) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__220)) (fun es -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__221)) (fun tail -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend es) tail)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 475 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))
))

# 489 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__222) -> (match dtb__222 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__223; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__224; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__225; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__226; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__227; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__228; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__229 } -> (if (dtb__223 = mc0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)) else (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 dtb__229) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_ModuleNameMismatch (dtb__223))) dtb__223))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 494 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__230, dtb__231) -> (match (dtb__230).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dOpacitySpec_opacityKind with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityOpaque -> (Base_dList.C_Base_dList_dList__x58__x58_ (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName dtb__230)), ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf mc0) dtb__231)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityTransparent -> ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf mc0) dtb__231)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dOpacity_OpacityAbstract -> (Base_dList.C_Base_dList_dList__x58__x58_ ((":" ^ ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName dtb__230))), ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf mc0) dtb__231)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 501 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix = ":"

# 504 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName = (fun name -> (if ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix) name) then (((dtp_substring (bi_strLength v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix)) ((bi_strLength name) - (bi_strLength v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix))) name) else name))

# 510 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix) name))

# 527 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__232, dtb__233) -> true
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportSpecToItem = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESType (dtb__234, dtb__235, dtb__236) -> (match dtb__235 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMOnly (dtb__237) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeSome (dtb__234, dtb__237, dtb__236))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMAll -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__234, dtb__236))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportMembers_EMNone -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__234, dtb__236))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportSpec_ESValue (dtb__238, dtb__239) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__238, dtb__239))
  | _ -> failwith "DT: impossible branch"
))

# 513 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun modules prefix hdr imports decls extraExports extraReexports -> ((fun newItems -> ((fun explicit -> (if (v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty newItems) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> explicit
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__240) -> (match dtb__240 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__241; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__242; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__243; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__244; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__245; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__246; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__247 } -> (if dtb__242 then (((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1 dtb__247) (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_DuplicateExport ("module header"))) "module header") else explicit)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) hdr) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__248) -> (match dtb__248 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__249; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__250; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__251; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__252; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__253; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__254; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__255 } -> (if dtb__250 then (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports modules) prefix) decls) imports) dtb__251) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) hdr))) (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports modules) prefix) decls) imports) newItems))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dFlatten_dexportSpecToItem) extraExports)) extraReexports)))

# 537 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ (name, stack)))))

# 559 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__256, dtb__257) -> (match dtb__257 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = "Prelude"; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithAbsent Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dNoSourceReason_NsPackageGraph)) ((Vuna_dCompiler_dBase_dDiagnostics_dRn.v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dBase_dDiagnostics_dRn.C_Vuna_dCompiler_dBase_dDiagnostics_dRn_dRnErr_AmbiguousPrelude ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)))) mc1))))) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinArrows ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)))) mc1))))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun nFs roots importerPkg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) roots) "Prelude") importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)) <> importerPkg))) allowed)))) (Base_dPair.v_Base_dPair_dfirstOf collected)))))

# 545 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun nFs roots importerPkg currentName imports -> (if (currentName = "Prelude") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else (if ((Base_dList.v_Base_dList_dmemName "Prelude") (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom nFs) roots) importerPkg))))

# 568 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck = (fun roots project -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dLayers.v_Vuna_dCompiler_dLoader_dLayers_dcheckProjectLayers roots) project)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (project)))))

# 572 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan = (fun imp e -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) = "") then e else ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) e)))

# 593 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__258, dtb__259) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__258, ((v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal (mc0 - 1)) dtb__259))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 586 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dpathPrefixOf = (fun nFs roots importerPkg segs n -> (if (n < 1) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles nFs) roots) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal n) segs))) importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) (fun collected -> (if (v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty (Base_dPair.v_Base_dPair_dfirstOf collected)) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots ((v_Vuna_dCompiler_dLoader_dFlatten_dnsTakeLocal n) segs)); Base_dPair.f_Base_dPair_dPair_second = n }))) else (((((v_Vuna_dCompiler_dLoader_dFlatten_dpathPrefixOf nFs) roots) importerPkg) segs) (n - 1)))))))

# 597 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dnsDropLocal = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__260, dtb__261)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dnsDropLocal (mc0 - 1)) dtb__261))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun nFs nEnv nProcess fuel roots importerPkg modules stack imports -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "loader")) else (match imports with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (modules)))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) dtb__262)) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__264) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__264)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__265) -> (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) dtb__265) stack) dtb__263)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
# 601 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun nFs nEnv nProcess fuel roots importerPkg modules stack imp -> ((fun name -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "loader")) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__266) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (modules)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((Base_dList.v_Base_dList_dmemName name) stack) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan imp)) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) else (if (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile nFs) roots) name) importerPkg) (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan)) (fun foundR -> (match foundR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267) -> (match (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__268) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dpathPrefixOf nFs) roots) importerPkg) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) ((Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name)) - 1))) (fun prefixR -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__269) -> (match dtb__269 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__270; Base_dPair.f_Base_dPair_dPair_second = dtb__271 } -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule nFs) nEnv) nProcess) (fuel - 1)) roots) importerPkg) modules) stack) { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__270; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan })) (fun modsR -> (match modsR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__272) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__272)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__273) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__273) dtb__270) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> (match (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dwalkNamespaceIndex dtb__273) dtb__270) ((v_Vuna_dCompiler_dLoader_dFlatten_dnsDropLocal dtb__271) (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dsplitOnDot name))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__275) -> (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule nFs) nEnv) nProcess) (fuel - 1)) roots) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf dtb__274)) dtb__273) stack) { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = dtb__275; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = true; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = (imp).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__267)))
  | _ -> failwith "DT: impossible branch"
)) prefixR)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__276) -> ((fun path -> ((fun root -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) path)) (fun text -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) path) text)) (fun parsed -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__277) -> (match dtb__277 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__278; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__279; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__280; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__281; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__282; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__283; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__284 } -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dexpandPathImports nFs) nEnv) nProcess) (fuel - 1)) roots) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root)) (Base_dList.C_Base_dList_dList__x58__x58_ (name, stack))) modules) dtb__279)) (fun expR -> ((fun nd_uscrut33 -> (match nd_uscrut33 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__285) -> (match dtb__285 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__286; Base_dPair.f_Base_dPair_dPair_second = dtb__287 } -> (match dtb__287 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__288; Base_dPair.f_Base_dPair_dPair_second = dtb__289 } -> ((fun imports -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__278) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__290) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__290)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__291) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__292) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__292)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__293) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) roots) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root)) name) imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__294) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__294)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__295) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) (fuel - 1)) roots) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root)) dtb__289) (Base_dList.C_Base_dList_dList__x58__x58_ (name, stack))) ((Base_dList.v_Base_dList_dappend imports) dtb__295))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__296) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__296)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__297) -> (match (((((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports dtb__297) name) dtb__278) imports) dtb__281) dtb__282) dtb__283) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__298) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__298)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__299) -> ((fun visible -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = name; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName root); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = imports; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__295; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__281; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__299; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = visible; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = ((Base_dList.v_Base_dList_dappend dtb__288) ((Base_dList.v_Base_dList_dappend ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader imports) dtb__278)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames imports) dtb__283))); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf name) dtb__284); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf dtb__299) }, dtb__297)))))) dtb__280)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf dtb__286) dtb__283))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__300) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__300)))
  | _ -> failwith "DT: impossible branch"
)) expR)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__301) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__301)))
  | _ -> failwith "DT: impossible branch"
)) parsed)))))) (if (dtp_debug_on 0) then (dtp_debug_line ("parse-module=" ^ name)) else 0))) (Base_dPair.v_Base_dPair_dsecondOf dtb__276))) (Base_dPair.v_Base_dPair_dfirstOf dtb__276))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan imp)) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_InvalidModuleName (name))) name)))))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName imp)))

# 686 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded = (fun nFs nEnv nProcess ctx entry preloaded -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) entry)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) entry)) (fun text -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath nFs) nEnv) nProcess) entry) text)) (fun parsed -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__302) -> (match dtb__302 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__303; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__304; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__305; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__306; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__307; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__308; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__309 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dexpandPathImports nFs) nEnv) nProcess) 1048575) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Nil) preloaded) dtb__304)) (fun expR -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__310) -> (match dtb__310 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__311; Base_dPair.f_Base_dPair_dPair_second = dtb__312 } -> (match dtb__312 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__313; Base_dPair.f_Base_dPair_dPair_second = dtb__314 } -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__311) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__315) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__315)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__316) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__311)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__317) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__317)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__318) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__314) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__311) dtb__318))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__319) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__319))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__320) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__306; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__311; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__318; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__320; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__305 })
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__321) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__321)))
  | _ -> failwith "DT: impossible branch"
)) expR)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__322) -> (match dtb__322 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__323; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__324; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__325; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__326; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__327; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__328; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__329 } -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_donErrDiag (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan dtb__329)) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleHeaderInEntryFile (entry))) entry)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__303)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__330) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__330)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_EntryFileNotFound (entry))) entry))))))

# 679 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun nFs nEnv nProcess ctx entry -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded nFs) nEnv) nProcess) ctx) entry) Base_dList.C_Base_dList_dList_Nil))

# 725 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded = (fun nFs nEnv nProcess ctx names preloaded -> ((fun entryImports -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) entryImports)) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__332) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__332; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = Base_dList.C_Base_dList_dList_Nil })
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dmap (fun n -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 } })) names)))

# 722 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun nFs nEnv nProcess ctx names -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded nFs) nEnv) nProcess) ctx) names) Base_dList.C_Base_dList_dList_Nil))

# 744 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded = (fun nFs nEnv nProcess ctx label source preloaded -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool) label) source)) (fun parsed -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__333) -> (match dtb__333 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__334; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__335; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__336; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__337; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__338; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__339; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__340 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dexpandPathImports nFs) nEnv) nProcess) 1048575) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Nil) preloaded) dtb__335)) (fun expR -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__341) -> (match dtb__341 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__342; Base_dPair.f_Base_dPair_dPair_second = dtb__343 } -> (match dtb__343 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__344; Base_dPair.f_Base_dPair_dPair_second = dtb__345 } -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__342) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__346) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__346)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__347) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__342)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__348) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__348)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__349) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__345) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__342) dtb__349))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__350) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__350))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__351) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__337; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__342; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__349; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__351; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__336 })
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__352) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__352)))
  | _ -> failwith "DT: impossible branch"
)) expR)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__353) -> (match dtb__353 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__354; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__355; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__356; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__357; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__358; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__359; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__360 } -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiagnostics_dLoader.v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1 (Vuna_dCompiler_dBase_dDiagnostics_dLoader.C_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dLdDiag_ModuleHeaderInEntrySource (label))) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__334)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__361) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__361)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 740 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun nFs nEnv nProcess ctx label source -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) Base_dList.C_Base_dList_dList_Nil))

# 783 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded = (fun nFs nEnv nProcess ctx label source preloaded -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool) label) source)) (fun parsed -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__362) -> (match dtb__362 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__363; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__364; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__365; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__366; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__367; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__368; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__369 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__370) -> (match dtb__370 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__371; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__372; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__373; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__374; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__375; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__376; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__377 } -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dexpandPathImports nFs) nEnv) nProcess) 1048575) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__371, Base_dList.C_Base_dList_dList_Nil))) preloaded) dtb__364)) (fun expR -> ((fun nd_uscrut33 -> (match nd_uscrut33 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__378) -> (match dtb__378 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__379; Base_dPair.f_Base_dPair_dPair_second = dtb__380 } -> (match dtb__380 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__381; Base_dPair.f_Base_dPair_dPair_second = dtb__382 } -> ((fun imports -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__371) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__383) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__383)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__384) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__371) imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__385) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__385)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__386) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__382) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend imports) dtb__386))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__387) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__387)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__388) -> (match (((((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports dtb__388) dtb__371) dtb__363) imports) dtb__366) dtb__367) dtb__368) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__389) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__389)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__390) -> ((fun visible -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = imports; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__386; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__371; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = imports; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__386; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__366; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__390; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = visible; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = ((Base_dList.v_Base_dList_dappend dtb__381) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames imports) ((Base_dList.v_Base_dList_dappend dtb__373) dtb__368))); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = ((v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf dtb__371) dtb__369); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf dtb__390) }, dtb__388)); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = Base_dList.C_Base_dList_dList_Nil }))) dtb__365)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf dtb__379) dtb__368))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__391) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__391)))
  | _ -> failwith "DT: impossible branch"
)) expR)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) preloaded)
  | _ -> failwith "DT: impossible branch"
)) dtb__363)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__392) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__392)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 779 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun nFs nEnv nProcess ctx label source -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded nFs) nEnv) nProcess) ctx) label) source) Base_dList.C_Base_dList_dList_Nil))

# 829 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun nFs nEnv nProcess ctx modules0 label source -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode nFs) nEnv) nProcess) Vuna_dCompiler_dFrontend_dParser_dSupport.C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool) label) source)) (fun parsed -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__393) -> (match dtb__393 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__394; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__395; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__396; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__397; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileExports = dtb__398; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileReexports = dtb__399; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileOpacity = dtb__400 } -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dexpandPathImports nFs) nEnv) nProcess) 1048575) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Nil) modules0) dtb__395)) (fun expR -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__401) -> (match dtb__401 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__402; Base_dPair.f_Base_dPair_dPair_second = dtb__403 } -> (match dtb__403 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__404; Base_dPair.f_Base_dPair_dPair_second = dtb__405 } -> ((fun imports -> ((fun nd_uscrut35 -> (match nd_uscrut35 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__406) -> (match dtb__406 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__407; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__408; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__409; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExports = dtb__410; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclReexports = dtb__411; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclOpacity = dtb__412; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__413 } -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__407) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__414) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__414)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__415) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__407) imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__416) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__416)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__417) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__405) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend imports) dtb__417))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__418) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__418))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__419) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__419; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__396) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__419) ((Base_dList.v_Base_dList_dappend imports) dtb__417)))) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) imports) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__420) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__420)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__421) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) "") imports)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__422) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__422)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__423) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll nFs) nEnv) nProcess) 1048576) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName ctx)) dtb__405) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend imports) dtb__423))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__424) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__424))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__425) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__425; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__396) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__425) ((Base_dList.v_Base_dList_dappend imports) dtb__423)))) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__394)) ((v_Vuna_dCompiler_dLoader_dFlatten_dnamespaceImportsOf dtb__402) dtb__399))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__426) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__426)))
  | _ -> failwith "DT: impossible branch"
)) expR)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__427) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__427)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

# 878 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun nFs nEnv nProcess ctx label source -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn nFs) nEnv) nProcess) ctx) Base_dList.C_Base_dList_dList_Nil) label) source)) (fun pairR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pairR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__428) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__428))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__429) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dsecondOf dtb__429)))
  | _ -> failwith "DT: impossible branch"
)))))

# 944 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan = (fun sp -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanFile sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartLine sp) + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) - ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp) - 1)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartOffset sp) - ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanStartCol sp) - 1)) })

# 958 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName = (fun n -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName n) then (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets n) else (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical n) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__430) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__430, Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList__x58__x58_ (n, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 965 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

# 969 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__431, dtb__432) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__431) mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn mc0) dtb__432))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 935 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__433, dtb__434) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__433))) (fun es -> ((fun used -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo mc0) mc1) mc2) dtb__434)) (fun more -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((if used then more else (Base_dList.C_Base_dList_dList__x58__x58_ (((((Vuna_dCompiler_dBase_dDiagnostics_dWarning.v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAtMod (fun d -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithSuggestion { Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionTitle = ("remove unused import " ^ (dtb__433).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editSpan = (v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan (dtb__433).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan); Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagEdit_editNewText = "" }, Base_dList.C_Base_dList_dList_Nil)) }) d))) (dtb__433).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) (Vuna_dCompiler_dBase_dDiagnostics_dWarning.C_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dWarnErr_UnusedImport ((dtb__433).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName))) (Base_dVec.C_Base_dVec_dVec_VCons ((dtb__433).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName, Base_dVec.C_Base_dVec_dVec_Nil))), more)))))))) (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__433)) mc2) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn mc1) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf) es))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1002 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__435, dtb__436, dtb__437) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__435, ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__436)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__438, dtb__439) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__440, dtb__441) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__442, dtb__443, dtb__444) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__442, ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) dtb__443)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__445) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__446, dtb__447, dtb__448) -> (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames dtb__447)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__449, dtb__450) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 1012 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__451, dtb__452, dtb__453) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames) dtb__452)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__454, dtb__455, dtb__456) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__454)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__455))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__457, dtb__458, dtb__459) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__458, (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__457)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__460, dtb__461, dtb__462) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__460, (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__461)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__463, dtb__464) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__463, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__465, dtb__466, dtb__467, dtb__468) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__465, ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__466)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__467))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__469, dtb__470) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__469)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__471, dtb__472, dtb__473, dtb__474) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__471, ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__472)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__473))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__475, dtb__476) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames) dtb__475)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__477, dtb__478, dtb__479) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__477)) ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__478))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__480, dtb__481, dtb__482) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__480, ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__481)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__483, dtb__484, dtb__485) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__483)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__486, dtb__487, dtb__488, dtb__489) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__486)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__487)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__488)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__490, dtb__491, dtb__492) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__490)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames) dtb__491))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__493, dtb__494) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames) dtb__493)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__495, dtb__496, dtb__497, dtb__498) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames) dtb__495)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__496))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__499, dtb__500, dtb__501, dtb__502, dtb__503, dtb__504) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__502)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__503))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__505, dtb__506, dtb__507) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__505)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__506))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__508, dtb__509, dtb__510) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__509)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__511, dtb__512) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__513, dtb__514) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__515, dtb__516) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__517, dtb__518) -> (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__517, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))
# 1040 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames = (fun p -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames (Base_dPair.v_Base_dPair_dfirstOf p))) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf p))))
# 1044 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames = (fun p -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) (Base_dPair.v_Base_dPair_dfirstOf p))) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf p))))
# 1048 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__519, dtb__520) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__519)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__521, dtb__522, dtb__523) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames dtb__521)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__522))
  | _ -> failwith "DT: impossible branch"
))
# 1053 "Vuna/Compiler/Loader/Flatten.vuna"
and v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__524) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__524)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__525) -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 990 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames = (fun c -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (c).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType))

# 994 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames = (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType))

# 998 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames = (fun m -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType))

# 975 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__526, dtb__527, dtb__528, dtb__529) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) dtb__527)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__528))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__530, dtb__531, dtb__532, dtb__533) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__532)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__534, dtb__535, dtb__536) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__535)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__537, dtb__538, dtb__539, dtb__540) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__538)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__539))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__541, dtb__542, dtb__543, dtb__544) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__541)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__542)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames) dtb__543)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__547)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames) dtb__548))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__550, dtb__551, dtb__552, dtb__553, dtb__554, dtb__555, dtb__556, dtb__557) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames) dtb__552)) dtb__553)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__558, dtb__559, dtb__560, dtb__561, dtb__562, dtb__563, dtb__564, dtb__565, dtb__566) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__560)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames) dtb__561)) dtb__562))
  | _ -> failwith "DT: impossible branch"
))

# 929 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource = (fun decls -> ((fun names -> (if ((Base_dList.v_Base_dList_dmemName "interp") names) then true else ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName) names))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames) decls)))

# 951 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames = (fun d -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName) (v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames d)))

# 915 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings = (fun modules imports decls sourceDecls reexports -> ((fun names0 -> ((fun names -> ((fun nameSet -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo modules) nameSet) reexports) imports)) (Base_dHashMap.v_Base_dHashMap_dofNames names))) (if (v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource sourceDecls) then names0 else ((Base_dList.v_Base_dList_dfilter (fun n -> (n <> Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName))) names0)))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames) decls)))

# 903 "Vuna/Compiler/Loader/Flatten.vuna"
let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__567, dtb__568) -> (match dtb__567 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__569; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__570; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__571; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__572; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__573; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__574; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__575; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__576; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__577; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__578 } -> (if ((Base_dList.v_Base_dList_dmemName dtb__569) mc1) then ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) mc1) mc2) dtb__568)) (fun p2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__569; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__570; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__571; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__572; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__573; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__574; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__575; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__576; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__577; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__578 }, (Base_dPair.v_Base_dPair_dfirstOf p2))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p2) })))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf mc2)) dtb__573)) (fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLoader_dExpand.v_Vuna_dCompiler_dLoader_dExpand_dexpandDecls decls2)) (fun decls3 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__569; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__570; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__571; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__572; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = decls3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__574; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__575; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__576; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__577; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__578 }, dtb__568))) dtb__569) dtb__569) ((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith mc0) decls3)) ((Base_dList.v_Base_dList_dappend dtb__571) dtb__572)) decls3)) (fun d1 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__569; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__570; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__571; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__572; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = decls3; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__574; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__575; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__576; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__577; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__578 }, dtb__568))) dtb__571) d1) decls3) dtb__576)) (fun warns -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) mc1) mc2) dtb__568)) (fun p2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__569; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__570; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__571; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__572; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = d1; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__574; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__575; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__576; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleOpaqueOf = dtb__577; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportIndexOf = dtb__578 }, (Base_dPair.v_Base_dPair_dfirstOf p2))); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend warns) (Base_dPair.v_Base_dPair_dsecondOf p2)) })))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

# 896 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__579; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__580; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__581; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__582; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__583; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__584 } -> ((fun projectFixities -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dcheckUniqueFixities projectFixities)) (fun fixes -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf fixes)) dtb__579)) (fun decls2 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (Vuna_dCompiler_dLoader_dExpand.v_Vuna_dCompiler_dLoader_dExpand_dexpandDecls decls2)) (fun decls3 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry mc0) dtb__582) dtb__583) ((Base_dList.v_Base_dList_dappend dtb__580) dtb__581)) decls3)) (fun entryDecls -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings dtb__582) dtb__580) entryDecls) decls3) Base_dList.C_Base_dList_dList_Nil)) (fun entryWarns -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) mc1) fixes) dtb__582)) (fun p2 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend entryWarns) (Base_dPair.v_Base_dPair_dsecondOf p2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = entryDecls; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf p2) } }))))))))))))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf) dtb__582)) dtb__584)))
  | _ -> failwith "DT: impossible branch"
))

# 888 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun project -> (((v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping false) Base_dList.C_Base_dList_dList_Nil) project))

# 892 "Vuna/Compiler/Loader/Flatten.vuna"
let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith = (fun release project -> (((v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping release) Base_dList.C_Base_dList_dList_Nil) project))
