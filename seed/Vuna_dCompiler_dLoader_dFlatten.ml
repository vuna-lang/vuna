open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry = C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dSourceFile)

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema = "vuna-ast-cache 7"

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "TMPDIR")) (fun base -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((if (base = "") then "/tmp" else base) ^ "/vuna-cache/ast"))))

let v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf = (fun path src -> (Vuna_dCompiler_dHash.v_Vuna_dCompiler_dHash_dcontentAddress (String.concat "" [v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema; "\t"; path; "\t"; src])))

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSource = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheFile = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dreadAstCache = (fun cpath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dreadFramedEff v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema) cpath)) (fun framed -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match framed with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__4)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dattachParsePath = (fun path e -> (if ((Base_dString.v_Base_dString_dstartsWith (path ^ ":")) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagText e)) then e else ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithLabel { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelText = path; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelStyle = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dLabelStyle_LabelContext; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelProvenance = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing }) e)))

let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((Base_dList.v_Base_dList_dconcatMap (fun imp -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf dtb__5)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) imports))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__7) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__7) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__6, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (dtb__6).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_fixityOp)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> ((((((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagAt sp) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dPhase_PhLoad) Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCategory_CatPackage) "") (String.concat "" [prefix; ": cannot export private name "; name; " (names starting with _ are module-private)"])))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (match dtb__9 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> (if (dtb__11 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__11; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__14) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (if (dtb__20 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__20, Base_dList.C_Base_dList_dList_Nil)) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__28, dtb__29, dtb__30, dtb__31) -> (if (dtb__28 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__28; Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__30) })) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__10)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__32 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__34, dtb__35, dtb__36, dtb__37) -> (if (dtb__34 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__33))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__38, dtb__39, dtb__40, dtb__41) -> (if (dtb__38 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__33))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__42, dtb__43, dtb__44) -> (if (dtb__42 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__33))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__45, dtb__46, dtb__47, dtb__48) -> (if (dtb__45 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__33))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__33)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__49) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__49))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__50))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (match dtb__51 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodName = dtb__53; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType = dtb__54; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodSpan = dtb__55 } -> (if (dtb__53 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__52))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match dtb__56 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> { Base_dPair.f_Base_dPair_dPair_first = dtb__58; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) })) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc0))) dtb__61))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__57))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> (if (dtb__67 = mc0) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__67; Base_dPair.f_Base_dPair_dPair_second = dtb__67 }, ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__57))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__57))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__75, dtb__76, dtb__77, dtb__78) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun m -> { Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) })) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc0))) dtb__77))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__57))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__57)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__79) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__80) else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__79; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__79); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1) }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__80))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__81) then (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) mc1) dtb__82) else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__81; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) dtb__81); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1) }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) mc1) dtb__82))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (match dtb__83 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__85, dtb__86, dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> (if (dtb__85 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__85; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__85); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__85) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__88)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__84) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> (if (dtb__94 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__94; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__94); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__94) (Base_dList.C_Base_dList_dList_Cons (dtb__94, Base_dList.C_Base_dList_dList_Nil))))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__84) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__102, dtb__103, dtb__104, dtb__105) -> (if (dtb__102 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__102; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__102); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__102) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__104)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__84) mc2))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__84) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if (if ((dtb__106).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then ((dtb__106).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__106, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__107))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__107))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__108) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__108; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__108); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries prefix) dtb__108) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__111)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__117) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__117; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__117); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__117) (Base_dList.C_Base_dList_dList_Cons (dtb__117, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__125, dtb__126, dtb__127, dtb__128) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__125) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__125; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__125); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__125) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__127)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__129, dtb__130, dtb__131, dtb__132) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__133, dtb__134, dtb__135, dtb__136) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__133) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__133; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__133); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__137, dtb__138, dtb__139) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__137) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__137; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__137); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__140, dtb__141, dtb__142, dtb__143) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__140) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__140; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__140); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__144, dtb__145, dtb__146, dtb__147) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__144) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__144; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__144); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__148, dtb__149) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__150) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__149) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__149) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__148, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" [(dtb__148).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; "|"; (dtb__148).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public; "|"; (dtb__148).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target]))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match dtb__151 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160) -> (if (dtb__153 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__152))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__152)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot target)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__161; Base_dPair.f_Base_dPair_dPair_second = dtb__162 } -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__162) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__163) -> (match dtb__163 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__164; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__165; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__166; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__167; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__168; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__169; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__170; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__171; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__172; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__173 } -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__162) dtb__168)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__161))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__174) -> (match dtb__174 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__175; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__176; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__177 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__178) -> (match dtb__178 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__179; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__180; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__181 } -> (if (if (if (dtb__175 = "type") then (dtb__179 = "ctor") else false) then (dtb__176 = dtb__180) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__176) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__182) -> (match dtb__182 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = dtb__183; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = dtb__184; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = dtb__185 } -> (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = dtb__183; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = mc0; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = dtb__184; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = dtb__185 }, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))))
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__186) -> (match dtb__186 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__187; Base_dPair.f_Base_dPair_dPair_second = dtb__188 } -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__187); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match dtb__189 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__191, dtb__192, dtb__193, dtb__194, dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__191) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc1))) dtb__194)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__190))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204, dtb__205, dtb__206, dtb__207) -> (if (dtb__200 = mc1) then ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__200) (Base_dList.C_Base_dList_dList_Cons (dtb__200, Base_dList.C_Base_dList_dList_Nil)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__190)) else (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__190))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__208, dtb__209, dtb__210, dtb__211) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__208) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc1))) dtb__210)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__190))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__190)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }))))) (Base_dPair.v_Base_dPair_dsecondOf p))))
)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__212, dtb__213) -> (match dtb__213 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__214, dtb__215) -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousConstructorExport (name))) name)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "ctor"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = (dtb__212).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = (dtb__212).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed prefix) name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__216) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refKind = "val"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refTarget = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__216); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportRef_refParent = "" }))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (if ((Base_dList.v_Base_dList_dlength ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) base)) > 1) then ((((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt2 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousConstructorInExport (base, m))) base) m) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__217) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__218) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (dtb__217).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = base; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__217).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (dtb__217).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }, (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = base; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__218).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, Base_dList.C_Base_dList_dList_Nil))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (dtb__217).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = base; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__217).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (dtb__217).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__219) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = base; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__219).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, Base_dList.C_Base_dList_dList_Nil))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__220; Base_dPair.f_Base_dPair_dPair_second = dtb__221 } -> (match dtb__220 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__222) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__223) -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__224) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (mprefix))) mprefix)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__225) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__225) dtb__221) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__220))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__226; Base_dPair.f_Base_dPair_dPair_second = dtb__227 } -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else (match (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries prefix) decls) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__228) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__228))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_CannotExportUnknownName (name))) name)
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = name; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = tgt; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) ((Base_dPair.v_Base_dPair_dsecondOf p)).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)) (Base_dPair.v_Base_dPair_dfirstOf p))))
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((fun mprefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (mprefix))) mprefix)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__229) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__229)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__227) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__230) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "type"; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = dtb__227; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (dtb__230).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = "" }, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (dtb__230).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) es)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt2 sp) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_TypeNotExported (dtb__227, dtb__229))) dtb__227) dtb__229)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__226))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__231, dtb__232) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__231) dtb__232)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__233, dtb__234) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__233) dtb__234)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__235, dtb__236) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix mc3) dtb__235) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 dtb__236) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNotImported (dtb__235))) dtb__235)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__237) -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__237)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__238, dtb__239) -> (if (if ((mc0).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (dtb__238).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) then ((mc0).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = (dtb__238).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind mc0) dtb__239))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__240, dtb__241) -> (if ((mc0).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = "ctor") then false else (if (if (if ((mc0).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (dtb__240).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) then ((mc0).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = (dtb__240).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) else false) then ((mc0).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target <> (dtb__240).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport mc0) dtb__241)))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e e2 -> (if (if (if ((e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind = (e2).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind) then ((e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public = (e2).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) else false) then ((e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target = (e2).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target) else false) then ((e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent = (e2).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent) else false))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_kind; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target; "|"; (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_parent]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__242, dtb__243) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__244) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__243) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__243) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__242, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__242))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__245) dtb__246) then ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateExport ((dtb__245).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public))) (dtb__245).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_public) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__246))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__247, dtb__248) -> ("module:" ^ dtb__247)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__249, dtb__250) -> ("typeall:" ^ dtb__249)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__251, dtb__252) -> ("bare:" ^ dtb__251)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__253, dtb__254) -> (match dtb__253 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__255; Base_dPair.f_Base_dPair_dPair_second = dtb__256 } -> (if (mc0 = dtb__255) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf mc0) dtb__254))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__257, dtb__258) -> (match dtb__257 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__259; Base_dPair.f_Base_dPair_dPair_second = dtb__260 } -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__259) dtb__258) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__260)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__258))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__261, dtb__262) -> dtb__261
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__263, dtb__264) -> dtb__263
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__265, dtb__266) -> dtb__265
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((Base_dList.v_Base_dList_dmap (fun i -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i) })) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__267) -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_DuplicateExport (dtb__267))) dtb__267)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__268, dtb__269) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__268)) (fun es -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__269)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((Base_dList.v_Base_dList_dappend es) tail)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__270) -> (match dtb__270 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__271; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__272; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__273; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__274 } -> (if (dtb__271 = mc0) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)) else (((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1 dtb__274) (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_ModuleNameMismatch (dtb__271))) dtb__271))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__275) -> (match dtb__275 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__276; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__277; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__278; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__279 } -> (if dtb__277 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports mc0) mc1) mc4) mc3) dtb__278)) (fun es -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc1) es)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (es)))))) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinArrows (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons (name, stack)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__280, dtb__281) -> (match dtb__281 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = "Prelude"; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 } }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dRn.v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1 (Vuna_dCompiler_dDiagnostics_dRn.C_Vuna_dCompiler_dDiagnostics_dRn_dRnErr_AmbiguousPrelude ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinArrows ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)))) mc1))))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinArrows ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)))) mc1)))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots importerPkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) (fun collected -> ((fun allowed -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)) <> importerPkg))) allowed)))) (Base_dPair.v_Base_dPair_dfirstOf collected)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots importerPkg currentName imports -> (if (currentName = "Prelude") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else (if ((Base_dList.v_Base_dList_dmemName "Prelude") (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_drootPrivilegedOf = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__282, dtb__283) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__282) = mc1) then (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootPrivileged dtb__282) else ((v_Vuna_dCompiler_dLoader_dFlatten_drootPrivilegedOf dtb__283) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimporterPrivileged = (fun roots selfPriv importerPkg -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_drootPrivilegedOf roots) importerPkg) then true else (if (importerPkg = "") then selfPriv else false)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhostModuleIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__284, dtb__285) -> (if ((Base_dList.v_Base_dList_dmemName mc1) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootHostModules dtb__284)) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhostModuleIn dtb__285) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__286, dtb__287) -> (if (dtb__286 = 47) then dtb__287 else (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash dtb__287))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath path))) (fun _u -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) path)))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache = (fun cpath src parsed -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir) (fun astDir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath astDir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) cpath) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dframeEncode v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema) (dtp_marshal (C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry (src, parsed)))))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) parsed))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dparseAndStoreAt = (fun cpath path src -> (match ((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecovering path) src) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__288) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((v_Vuna_dCompiler_dLoader_dFlatten_dattachParsePath path) dtb__288))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__289) -> ((fun parsed -> ((fun errs -> (match errs with
  | Base_dList.C_Base_dList_dList_Nil -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) (fun _heta0 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (_heta0)))) (((v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache cpath) src) parsed))
  | Base_dList.C_Base_dList_dList_Cons (dtb__290, dtb__291) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithChildren dtb__291) dtb__290))))
  | _ -> failwith "DT: impossible branch"
)) (Base_dPair.v_Base_dPair_dsecondOf dtb__289))) (Base_dPair.v_Base_dPair_dfirstOf dtb__289))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun path src -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir) (fun astDir -> ((fun cpath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dLoader_dFlatten_dreadAstCache cpath)) (fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__292) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSource dtb__292) = src) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dLoader_dFlatten_dastCacheFile dtb__292)))) else (((v_Vuna_dCompiler_dLoader_dFlatten_dparseAndStoreAt cpath) path) src))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_dparseAndStoreAt cpath) path) src)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [astDir; "/"; ((v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf path) src)])))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel roots selfPriv importerPkg modules stack imports -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "loader")) else (match imports with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (modules)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__293, dtb__294) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule (fuel - 1)) roots) selfPriv) importerPkg) modules) stack) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__293))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__295) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__295)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__296) -> (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) selfPriv) importerPkg) dtb__296) stack) dtb__294)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel roots selfPriv importerPkg modules stack name -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicFuel "loader")) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__297) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (modules)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((Base_dList.v_Base_dList_dmemName name) stack) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack))) else (if (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhostModuleIn roots) name) then (Base_dBool.v_Base_dBool_dnot (((v_Vuna_dCompiler_dLoader_dFlatten_dimporterPrivileged roots) selfPriv) importerPkg)) else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_HostModulePrivileged (name))) name)) else (if (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun foundR -> (match foundR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__298) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__298)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__299) -> ((fun path -> ((fun root -> ((fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) path)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) text)) (fun parsed -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__300) -> (match dtb__300 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__301; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__302; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__303; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__304 } -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__301) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__305) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__305)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__306) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__302) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__307)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__308) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__302)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__309) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__309)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__310) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) selfPriv) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (Base_dList.C_Base_dList_dList_Cons (name, stack))) ((Base_dList.v_Base_dList_dappend dtb__302) dtb__310))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__311) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__311)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__312) -> (match (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports dtb__312) name) dtb__301) dtb__302) dtb__304) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__313) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__313)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__314) -> ((fun visible -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = name; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__302; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__310; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__304; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__314; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootTrustUnsafe root); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = visible; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader dtb__302) dtb__301) }, dtb__312)))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__303) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__312) ((Base_dList.v_Base_dList_dappend dtb__302) dtb__310)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__315) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__315)))
  | _ -> failwith "DT: impossible branch"
)) parsed)))))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("parse-module=" ^ name)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__299))) (Base_dPair.v_Base_dPair_dfirstOf dtb__299))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName (name))) name)))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded = (fun ctx entry preloaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) entry)) (fun text -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath entry) text)) (fun parsed -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__316) -> (match dtb__316 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__317; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__318; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__319; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__320 } -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__318) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__321) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__321)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__322) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__318)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__323) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__323)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__324) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__318) dtb__324))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__325) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__325))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__326) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__320; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__318; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__324; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__326; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = false; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__319 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__327) -> (match dtb__327 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__328; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__329; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__330; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__331 } -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile (entry))) entry))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__317)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__332) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__332)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound (entry))) entry))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx entry -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded ctx) entry) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded = (fun ctx names preloaded -> ((fun entryImports -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) entryImports)) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__333) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__333))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__334) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__334; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = true; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))))) ((Base_dList.v_Base_dList_dmap (fun n -> { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName = n; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importIsQualified = false; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importAlias = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 } })) names)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx names -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded ctx) names) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded = (fun ctx label source preloaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun parsed -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__335) -> (match dtb__335 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__336; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__337; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__338; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__339 } -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__337) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__340) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__340)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__341) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__337)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__342) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__342)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__343) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__337) dtb__343))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__344) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__344))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__345) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__339; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__337; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__343; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__345; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = false; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__338 }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__346) -> (match dtb__346 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__347; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__348; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__349; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__350 } -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource (label))) label))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__336)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__351) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__351)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx label source -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded ctx) label) source) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded = (fun ctx label source preloaded -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun parsed -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__352) -> (match dtb__352 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__353; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__354; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__355; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__356 } -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__357) -> (match dtb__357 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__358; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__359; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__360; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__361 } -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__358) dtb__354) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__362) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__362)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__363) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__358) dtb__354)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__364) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__364)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__365) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__354) dtb__365))) (fun modulesR -> (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__366)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__367) -> (match (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports dtb__367) dtb__358) dtb__353) dtb__354) dtb__356) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__368) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__368)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__369) -> ((fun visible -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = Base_dList.C_Base_dList_dList_Nil; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__354; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__365; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__358; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__354; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__365; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__356; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__369; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = visible; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames dtb__354) dtb__360) }, dtb__367)); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx); Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = false; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = Base_dList.C_Base_dList_dList_Nil })))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__355) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__367) ((Base_dList.v_Base_dList_dappend dtb__354) dtb__365)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded ctx) label) source) preloaded)
  | _ -> failwith "DT: impossible branch"
)) dtb__353)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__370) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__370)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun ctx label source -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded ctx) label) source) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun ctx modules0 label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun parsed -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__371) -> (match dtb__371 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileModDecl = dtb__372; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileImports = dtb__373; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileFixities = dtb__374; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dSourceFile_sourceFileDecls = dtb__375 } -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__376) -> (match dtb__376 with
  | { Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclName = dtb__377; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclHasExportList = dtb__378; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclExportItems = dtb__379; Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dModDecl_modDeclSpan = dtb__380 } -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__377) dtb__373) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__381) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__381)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__382) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__377) dtb__373)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__383) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__383)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__384) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__373) dtb__384))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__385) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__385))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__386) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__386; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__374) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__386) ((Base_dList.v_Base_dList_dappend dtb__373) dtb__384)))) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) dtb__373) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__387) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__387)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__388) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__373)) (fun implicitR -> (match implicitR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__389) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__389)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__390) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPrivileged ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__373) dtb__390))) (fun modulesR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match modulesR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__391) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__391))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__392) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__392; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__374) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__392) ((Base_dList.v_Base_dList_dappend dtb__373) dtb__390)))) }))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__372)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__393) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__393)))
  | _ -> failwith "DT: impossible branch"
)) parsed))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun ctx label source -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn ctx) Base_dList.C_Base_dList_dList_Nil) label) source)) (fun pairR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pairR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__394))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__395) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dPair.v_Base_dPair_dsecondOf dtb__395)))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan = (fun sp -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanFile sp); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dspanStartLine sp) + 1); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 1 })

let v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName = (fun n -> (if (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName n) then (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets n) else (match (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical n) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__396) -> (Base_dList.C_Base_dList_dList_Cons (dtb__396, Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dList.C_Base_dList_dList_Cons (n, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf = (fun e -> (e).Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dExportEntry_target)

let rec v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__397, dtb__398) -> (if ((((Base_dHashMap.v_Base_dHashMap_dmember Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) dtb__397) mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn mc0) dtb__398))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__399, dtb__400) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__399))) (fun es -> ((fun used -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo mc0) mc1) mc2) dtb__400)) (fun more -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((if used then more else (Base_dList.C_Base_dList_dList_Cons (((((Vuna_dCompiler_dDiagnostics_dWarning.v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnDiagAtMod (fun d -> ((Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dwithSuggestion { Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionTitle = ("remove unused import " ^ (dtb__399).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionApplicability = Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dApplicability_MachineApplicable; Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dSuggestion_suggestionEdits = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editSpan = (v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan (dtb__399).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan); Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagEdit_editNewText = "" }, Base_dList.C_Base_dList_dList_Nil)) }) d))) (dtb__399).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importSpan) (Vuna_dCompiler_dDiagnostics_dWarning.C_Vuna_dCompiler_dDiagnostics_dWarning_dWarnErr_UnusedImport ((dtb__399).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName))) (Base_dVec.C_Base_dVec_dVec_Cons ((dtb__399).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dImport_importName, Base_dVec.C_Base_dVec_dVec_Nil))), more)))))))) (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__399)) mc2) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn mc1) ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf) es))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames = (fun p -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__401, dtb__402) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__403, dtb__404, dtb__405) -> (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames dtb__404)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__406) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__407, dtb__408, dtb__409) -> (Base_dList.C_Base_dList_dList_Cons (dtb__407, ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) dtb__408)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__410, dtb__411) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__412, dtb__413) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__414, dtb__415, dtb__416) -> (Base_dList.C_Base_dList_dList_Cons (dtb__414, ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__415)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames = (fun e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__417, dtb__418) -> (Base_dList.C_Base_dList_dList_Cons (dtb__417, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__419, dtb__420) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__421, dtb__422) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__423, dtb__424) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__425, dtb__426, dtb__427) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__426)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__428, dtb__429, dtb__430) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__428)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__429))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__434)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__435))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__437, dtb__438, dtb__439, dtb__440) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames) dtb__437)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__438))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__441, dtb__442) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames) dtb__441)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__443, dtb__444, dtb__445) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__443)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames) dtb__444))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__446, dtb__447, dtb__448, dtb__449) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__446)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__447)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__448)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__450, dtb__451, dtb__452) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__450)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__453, dtb__454, dtb__455) -> (Base_dList.C_Base_dList_dList_Cons (dtb__453, ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__454)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__456, dtb__457, dtb__458) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__456)) ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__457))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__459, dtb__460) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames) dtb__459)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__461, dtb__462, dtb__463, dtb__464) -> (Base_dList.C_Base_dList_dList_Cons (dtb__461, ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__462)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__463))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__465, dtb__466) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__465)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__467, dtb__468, dtb__469, dtb__470) -> (Base_dList.C_Base_dList_dList_Cons (dtb__467, ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__468)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__469))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__471, dtb__472) -> (Base_dList.C_Base_dList_dList_Cons (dtb__471, Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__473, dtb__474, dtb__475) -> (Base_dList.C_Base_dList_dList_Cons (dtb__473, (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__474)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__476, dtb__477, dtb__478) -> (Base_dList.C_Base_dList_dList_Cons (dtb__477, (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__476)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__479, dtb__480, dtb__481) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__479)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__480))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__482, dtb__483, dtb__484) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames) dtb__483)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames = (fun p -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames (Base_dPair.v_Base_dPair_dfirstOf p))) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf p))))
and v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames = (fun p -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) (Base_dPair.v_Base_dPair_dfirstOf p))) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (Base_dPair.v_Base_dPair_dsecondOf p))))
and v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames = (fun s -> (match s with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DBind (dtb__485, dtb__486, dtb__487) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames dtb__485)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__486))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_DExpr (dtb__488, dtb__489) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__488)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames = (fun p -> (match p with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__490) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__491) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__491)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames = (fun c -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (c).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dCtor_ctorType))

let v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames = (fun f -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (f).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dField_fieldType))

let v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames = (fun m -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames (m).Vuna_dCompiler_dFrontend_dAst.f_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_traitMethodType))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames = (fun d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__492, dtb__493, dtb__494, dtb__495, dtb__496, dtb__497, dtb__498, dtb__499, dtb__500) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__494)) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames) dtb__495)) dtb__496))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505, dtb__506, dtb__507, dtb__508) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames) dtb__503)) dtb__504)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__509, dtb__510, dtb__511, dtb__512) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames) dtb__511)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__513, dtb__514, dtb__515, dtb__516) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__513)) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__514)) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames) dtb__515)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__517, dtb__518, dtb__519, dtb__520) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames) dtb__518)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__519))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__521, dtb__522, dtb__523) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__522)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__524, dtb__525, dtb__526, dtb__527) -> (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__526)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__528, dtb__529, dtb__530, dtb__531) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames) dtb__529)) (v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames dtb__530))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource = (fun decls -> ((fun names -> (if ((Base_dList.v_Base_dList_dmemName "interp") names) then true else ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName) names))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames = (fun d -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName) (v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames d)))

let v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings = (fun modules imports decls sourceDecls reexports -> ((fun names0 -> ((fun names -> ((fun nameSet -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo modules) nameSet) reexports) imports)) (Base_dHashMap.v_Base_dHashMap_dofNames names))) (if (v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource sourceDecls) then names0 else ((Base_dList.v_Base_dList_dfilter (fun n -> (n <> Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName))) names0)))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__532, dtb__533) -> (match dtb__532 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__534; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__535; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__536; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__543 } -> (if ((Base_dList.v_Base_dList_dmemName dtb__534) mc0) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) dtb__533)) (fun p2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__534; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__535; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__536; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = dtb__538; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__543 }, (Base_dPair.v_Base_dPair_dfirstOf p2))); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf p2) })))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf dtb__542)) dtb__538)) (fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__534; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__535; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__536; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = decls2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__543 }, dtb__533))) dtb__534) dtb__534) (Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls2)) ((Base_dList.v_Base_dList_dappend dtb__536) dtb__537)) decls2)) (fun d -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__534) dtb__535) dtb__540) dtb__541) d)) (fun d1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__534; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__535; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__536; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = decls2; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__543 }, dtb__533))) dtb__536) d1) decls2) dtb__543)) (fun warns -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) dtb__533)) (fun p2 -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleNameOf = dtb__534; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_modulePackageOf = dtb__535; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImportsOf = dtb__536; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleImplicitImportsOf = dtb__537; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleDeclsOf = d1; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleExportsOf = dtb__539; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleCapabilities = dtb__540; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleTrustUnsafe = dtb__541; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleFixitiesOf = dtb__542; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dModule_moduleReexportsOf = dtb__543 }, (Base_dPair.v_Base_dPair_dfirstOf p2))); Base_dPair.f_Base_dPair_dPair_second = ((Base_dList.v_Base_dList_dappend warns) (Base_dPair.v_Base_dPair_dsecondOf p2)) })))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = Base_dList.C_Base_dList_dList_Nil; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryDecls = dtb__544; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryImports = dtb__545; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectImplicitImports = dtb__546; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModules = dtb__547; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryPkg = dtb__548; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryCapabilities = dtb__549; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryTrustUnsafe = dtb__550; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectModulesComplete = dtb__551; Vuna_dCompiler_dLoader_dModules.f_Vuna_dCompiler_dLoader_dModules_dProject_projectEntryFixities = dtb__552 } -> ((fun entryTable -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram entryTable) dtb__544)) (fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__547) dtb__548) dtb__549) dtb__550) ((Base_dList.v_Base_dList_dappend dtb__545) dtb__546)) decls2)) (fun entryDecls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings dtb__547) dtb__545) entryDecls) decls2) Base_dList.C_Base_dList_dList_Nil)) (fun entryWarns -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) dtb__547)) (fun p2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustPoints dtb__548) dtb__550) dtb__551) entryDecls) (Base_dPair.v_Base_dPair_dfirstOf p2))) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = ((Base_dList.v_Base_dList_dappend entryWarns) (Base_dPair.v_Base_dPair_dsecondOf p2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = entryDecls; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dfirstOf p2) } }))))))))))))) (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__552) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__547) ((Base_dList.v_Base_dList_dappend dtb__545) dtb__546))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun project -> ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping Base_dList.C_Base_dList_dList_Nil) project))
