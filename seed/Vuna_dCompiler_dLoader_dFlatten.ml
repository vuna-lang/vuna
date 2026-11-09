open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry = C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dSourceFile)

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema = "vuna-ast-cache 7"

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir = ((fun base -> ((if (base = "") then "/tmp" else base) ^ "/vuna-cache/ast")) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR")))

let v_Vuna_dCompiler_dLoader_dFlatten_dastLaneStep = (fun acc mult modulus ch -> ((fun v -> (v - ((if modulus = 0 then failwith "division by zero" else v / modulus) * modulus))) ((acc * mult) + ch)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHashGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHashGo dtb__1) ((((v_Vuna_dCompiler_dLoader_dFlatten_dastLaneStep mc1) 33) 1021) dtb__0)) ((((v_Vuna_dCompiler_dLoader_dFlatten_dastLaneStep mc2) 131) 1019) dtb__0)) ((((v_Vuna_dCompiler_dLoader_dFlatten_dastLaneStep mc3) 257) 1013) dtb__0)) ((((v_Vuna_dCompiler_dLoader_dFlatten_dastLaneStep mc4) 65599) 1009) dtb__0)) ((((v_Vuna_dCompiler_dLoader_dFlatten_dastLaneStep mc5) 16777619) 997) dtb__0))
  | Base_dList.C_Base_dList_dList_Nil -> ((((mc1 + (mc2 * 1024)) + (mc3 * 1048576)) + (mc4 * 1073741824)) + (mc5 * 1099511627776))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHash = (fun s -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHashGo (Base_dList.dtp_unpack s)) 0) 7) 13) 29) 61))

let v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf = (fun path src -> (bi_strFromInt (v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHash (String.concat "" [v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema; "\t"; path; "\t"; src]))))

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSource = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheFile = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry (dtb__4, dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dreadAstCache = (fun cpath -> (match ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dreadFramed v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema) cpath) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((dtp_unmarshal dtb__6)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((Base_dList.v_Base_dList_dconcatMap (fun imp -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf dtb__7)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))) imports))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__9) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__9) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__8, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_FixityDecl (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__11
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> (String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export private name "; name; " (names starting with _ are module-private)"]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (match dtb__16 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> (if (dtb__18 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__18, ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__21))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__17))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31, dtb__32) -> (if (dtb__26 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__26, (Base_dList.C_Base_dList_dList_Cons (dtb__26, Base_dList.C_Base_dList_dList_Nil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__17))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__33, dtb__34, dtb__35, dtb__36) -> (if (dtb__33 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__33, ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__35))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__17))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__17)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (match dtb__37 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__39, dtb__40, dtb__41, dtb__42) -> (if (dtb__39 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__38))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__43, dtb__44, dtb__45, dtb__46) -> (if (dtb__43 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__38))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__47, dtb__48, dtb__49) -> (if (dtb__47 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__38))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__50, dtb__51, dtb__52, dtb__53) -> (if (dtb__50 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__38))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__38)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__54) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__54))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__55))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (match dtb__56 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_TraitMethod (dtb__58, dtb__59, dtb__60) -> (if (dtb__58 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__58)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__57))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (match dtb__61 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__63, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c))))) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc0))) dtb__66))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__62))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> (if (dtb__71 = mc0) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__71, dtb__71)), ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__62))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__62))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__78, dtb__79, dtb__80, dtb__81) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap (fun m -> (Base_dPair.C_Base_dPair_dPair_Pair (dtb__78, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m))))) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc0))) dtb__80))) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__62))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames mc0) dtb__62)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__82) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__83) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("ctor", dtb__82, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__82), ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__83))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__84, dtb__85) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__84) then (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) mc1) dtb__85) else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("ctor", dtb__84, (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dctorCanonical mc0) mc1) dtb__84), ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1))), (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) mc1) dtb__85))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> (match dtb__86 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (dtb__88 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__88, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__88), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__88) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__91)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__87) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> (if (dtb__96 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__96, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__96), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__96) (Base_dList.C_Base_dList_dList_Cons (dtb__96, Base_dList.C_Base_dList_dList_Nil))))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__87) mc2))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__103, dtb__104, dtb__105, dtb__106) -> (if (dtb__103 = mc2) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__103, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__103), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__103) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__105)))))) else (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__87) mc2))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries mc0) dtb__87) mc2)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (if (if ((match dtb__107 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__109
  | _ -> failwith "DT: impossible branch"
) = "ctor") then ((match dtb__107 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__113, dtb__114, dtb__115, dtb__116) -> dtb__116
  | _ -> failwith "DT: impossible branch"
) = mc0) else false) then (Base_dList.C_Base_dList_dList_Cons (dtb__107, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__108))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__108))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__117) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__117, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__117), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries prefix) dtb__117) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__120)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__125) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__125, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__125), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__125) (Base_dList.C_Base_dList_dList_Cons (dtb__125, Base_dList.C_Base_dList_dList_Nil))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__132, dtb__133, dtb__134, dtb__135) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__132) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__132, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__132), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__132) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__134)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DInstance (dtb__136, dtb__137, dtb__138, dtb__139) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__140, dtb__141, dtb__142, dtb__143) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__140) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("val", dtb__140, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__140), "")), Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DAxiom (dtb__144, dtb__145, dtb__146) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__144) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("val", dtb__144, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__144), "")), Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__147, dtb__148, dtb__149, dtb__150) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__147) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("val", dtb__147, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__147), "")), Base_dList.C_Base_dList_dList_Nil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DFun (dtb__151, dtb__152, dtb__153, dtb__154) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__151) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("val", dtb__151, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__151), "")), Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__155, dtb__156) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__157) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__156) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__156) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__155, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" [(match dtb__155 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__158, dtb__159, dtb__160, dtb__161) -> dtb__158
  | _ -> failwith "DT: impossible branch"
); "|"; (match dtb__155 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__162, dtb__163, dtb__164, dtb__165) -> dtb__163
  | _ -> failwith "DT: impossible branch"
); "|"; (match dtb__155 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__166, dtb__167, dtb__168, dtb__169) -> dtb__168
  | _ -> failwith "DT: impossible branch"
)]))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match dtb__170 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178) -> (if (dtb__172 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__171))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__171)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__179, dtb__180) -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__180) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__181) -> (match dtb__181 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__180) dtb__186)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__179))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__191) -> (match dtb__191 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef (dtb__192, dtb__193, dtb__194) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__195) -> (match dtb__195 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef (dtb__196, dtb__197, dtb__198) -> (if (if (if (dtb__192 = "type") then (dtb__196 = "ctor") else false) then (dtb__193 = dtb__197) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__193) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__199) -> (match dtb__199 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef (dtb__200, dtb__201, dtb__202) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__200, mc0, dtb__201, dtb__202)), Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef ("type", (match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__203, dtb__204, dtb__205, dtb__206) -> dtb__205
  | _ -> failwith "DT: impossible branch"
), ""))))))))
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__207) -> (match dtb__207 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__208, dtb__209) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef ("type", ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__208), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (match dtb__210 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries mc0) dtb__212) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName c) = mc1))) dtb__215)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__211))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> (if (dtb__220 = mc1) then ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__220) (Base_dList.C_Base_dList_dList_Cons (dtb__220, Base_dList.C_Base_dList_dList_Nil)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__211)) else (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__211))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__227, dtb__228, dtb__229, dtb__230) -> ((Base_dList.v_Base_dList_dappend (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) dtb__227) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) ((Base_dList.v_Base_dList_dfilter (fun m -> ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m) = mc1))) dtb__229)))) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__211))
  | _ -> (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed mc0) mc1) dtb__211)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__231, dtb__232, dtb__233, dtb__234) -> dtb__231
  | _ -> failwith "DT: impossible branch"
), (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__235, dtb__236, dtb__237, dtb__238) -> dtb__237
  | _ -> failwith "DT: impossible branch"
), (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__239, dtb__240, dtb__241, dtb__242) -> dtb__242
  | _ -> failwith "DT: impossible branch"
)))))))) (Base_dPair.v_Base_dPair_dsecondOf p))))
)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__243, dtb__244) -> (match dtb__244 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": ambiguous constructor export "; name; " (write T(..) or qualify it)"])))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef ("ctor", (match dtb__243 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__247, dtb__248, dtb__249, dtb__250) -> dtb__249
  | _ -> failwith "DT: impossible branch"
), (match dtb__243 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__251, dtb__252, dtb__253, dtb__254) -> dtb__254
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed prefix) name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__255) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_ExportRef ("val", ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__255), ""))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (if ((Base_dList.v_Base_dList_dlength ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors es) base)) > 1) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": ambiguous constructor "; base; " in "; m; "; export T(..) instead"]))) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__256) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__257) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ((match dtb__256 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__258, dtb__259, dtb__260, dtb__261) -> dtb__258
  | _ -> failwith "DT: impossible branch"
), base, (match dtb__256 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__262, dtb__263, dtb__264, dtb__265) -> dtb__264
  | _ -> failwith "DT: impossible branch"
), (match dtb__256 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__266, dtb__267, dtb__268, dtb__269) -> dtb__269
  | _ -> failwith "DT: impossible branch"
))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", base, (match dtb__257 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__270, dtb__271, dtb__272, dtb__273) -> dtb__272
  | _ -> failwith "DT: impossible branch"
), "")), Base_dList.C_Base_dList_dList_Nil))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ((match dtb__256 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__274, dtb__275, dtb__276, dtb__277) -> dtb__274
  | _ -> failwith "DT: impossible branch"
), base, (match dtb__256 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__278, dtb__279, dtb__280, dtb__281) -> dtb__280
  | _ -> failwith "DT: impossible branch"
), (match dtb__256 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__282, dtb__283, dtb__284, dtb__285) -> dtb__285
  | _ -> failwith "DT: impossible branch"
))), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__286) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", base, (match dtb__286 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__287, dtb__288, dtb__289, dtb__290) -> dtb__289
  | _ -> failwith "DT: impossible branch"
), "")), Base_dList.C_Base_dList_dList_Nil))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__291, dtb__292) -> (match dtb__291 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__293) -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__294) -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__295) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__296) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__296) dtb__292) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__291))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__297, dtb__298) -> (match dtb__297 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else (match (((v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries prefix) decls) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__299) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__299))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__300, dtb__301, dtb__302, dtb__303) -> dtb__302
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dfirstOf p))))
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((fun mprefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__304) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__304)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__298) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__305) -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry ("type", dtb__298, (match dtb__305 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__306, dtb__307, dtb__308, dtb__309) -> dtb__308
  | _ -> failwith "DT: impossible branch"
), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (match dtb__305 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__310, dtb__311, dtb__312, dtb__313) -> dtb__312
  | _ -> failwith "DT: impossible branch"
)) es)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": type "; dtb__298; " is not exported by "; dtb__304])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__297))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__314, dtb__315) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__314) dtb__315)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__316, dtb__317) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__316) dtb__317)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__318, dtb__319) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix mc3) dtb__318) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc1; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__319); ": module "; dtb__318; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__320) -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__320)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__321, dtb__322) -> (if (if ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__323, dtb__324, dtb__325, dtb__326) -> dtb__323
  | _ -> failwith "DT: impossible branch"
) = (match dtb__321 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__327, dtb__328, dtb__329, dtb__330) -> dtb__327
  | _ -> failwith "DT: impossible branch"
)) then ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__331, dtb__332, dtb__333, dtb__334) -> dtb__332
  | _ -> failwith "DT: impossible branch"
) = (match dtb__321 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__335, dtb__336, dtb__337, dtb__338) -> dtb__336
  | _ -> failwith "DT: impossible branch"
)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind mc0) dtb__322))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__339, dtb__340) -> (if ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__341, dtb__342, dtb__343, dtb__344) -> dtb__341
  | _ -> failwith "DT: impossible branch"
) = "ctor") then false else (if (if (if ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__345, dtb__346, dtb__347, dtb__348) -> dtb__345
  | _ -> failwith "DT: impossible branch"
) = (match dtb__339 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__349, dtb__350, dtb__351, dtb__352) -> dtb__349
  | _ -> failwith "DT: impossible branch"
)) then ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__353, dtb__354, dtb__355, dtb__356) -> dtb__354
  | _ -> failwith "DT: impossible branch"
) = (match dtb__339 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__357, dtb__358, dtb__359, dtb__360) -> dtb__358
  | _ -> failwith "DT: impossible branch"
)) else false) then ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__361, dtb__362, dtb__363, dtb__364) -> dtb__363
  | _ -> failwith "DT: impossible branch"
) <> (match dtb__339 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__365, dtb__366, dtb__367, dtb__368) -> dtb__367
  | _ -> failwith "DT: impossible branch"
)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport mc0) dtb__340)))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e e2 -> (if (if (if ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__369, dtb__370, dtb__371, dtb__372) -> dtb__369
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__373, dtb__374, dtb__375, dtb__376) -> dtb__373
  | _ -> failwith "DT: impossible branch"
)) then ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__377, dtb__378, dtb__379, dtb__380) -> dtb__378
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__381, dtb__382, dtb__383, dtb__384) -> dtb__382
  | _ -> failwith "DT: impossible branch"
)) else false) then ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__385, dtb__386, dtb__387, dtb__388) -> dtb__387
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__389, dtb__390, dtb__391, dtb__392) -> dtb__391
  | _ -> failwith "DT: impossible branch"
)) else false) then ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__393, dtb__394, dtb__395, dtb__396) -> dtb__396
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__397, dtb__398, dtb__399, dtb__400) -> dtb__400
  | _ -> failwith "DT: impossible branch"
)) else false))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__401, dtb__402, dtb__403, dtb__404) -> dtb__401
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__405, dtb__406, dtb__407, dtb__408) -> dtb__406
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__409, dtb__410, dtb__411, dtb__412) -> dtb__411
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__413, dtb__414, dtb__415, dtb__416) -> dtb__416
  | _ -> failwith "DT: impossible branch"
)]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__417, dtb__418) -> ((fun key -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__419) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__418) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__418) ((((Base_dHashMap.v_Base_dHashMap_dinsert Base_dString.v_Hashable_uString) key) 1) mc1)) (Base_dList.C_Base_dList_dList_Cons (dtb__417, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__417))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__420, dtb__421) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__420) dtb__421) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": duplicate export "; (match dtb__420 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_ExportEntry (dtb__422, dtb__423, dtb__424, dtb__425) -> dtb__423
  | _ -> failwith "DT: impossible branch"
)]))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__421))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__426, dtb__427) -> ("module:" ^ dtb__426)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__428, dtb__429) -> ("typeall:" ^ dtb__428)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__430, dtb__431) -> ("bare:" ^ dtb__430)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__432, dtb__433) -> (match dtb__432 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__434, dtb__435) -> (if (mc0 = dtb__434) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf mc0) dtb__433))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__436, dtb__437) -> (match dtb__436 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__438, dtb__439) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__438) dtb__437) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__439)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__437))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XModule (dtb__440, dtb__441) -> dtb__440
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XTypeAll (dtb__442, dtb__443) -> dtb__442
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_XBare (dtb__444, dtb__445) -> dtb__444
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((Base_dList.v_Base_dList_dmap (fun i -> (Base_dPair.C_Base_dPair_dPair_Pair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__446) -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [prefix; ": duplicate export "; dtb__446])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__447, dtb__448) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__447)) (fun es -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__448)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok (((Base_dList.v_Base_dList_dappend es) tail)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__449) -> (match dtb__449 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl (dtb__450, dtb__451, dtb__452, dtb__453) -> (if (dtb__450 = mc0) then (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" [mc0; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__453); ": module name mismatch: source declares "; dtb__450]))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__454) -> (match dtb__454 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl (dtb__455, dtb__456, dtb__457, dtb__458) -> (if dtb__456 then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports mc0) mc1) mc4) mc3) dtb__457)) (fun es -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc1) es)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok (es)))))) else (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinArrows (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons (name, stack)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__459, dtb__460) -> (match dtb__460 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import ("Prelude", false, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))), Base_dList.C_Base_dList_dList_Nil))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["ambiguous implicit Prelude (found in: "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinArrows ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)))) mc1)); ")"])))
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots importerPkg -> (match (((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__461, dtb__462) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)) <> importerPkg))) dtb__461))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots importerPkg currentName imports -> (if (currentName = "Prelude") then (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)) else (if ((Base_dList.v_Base_dList_dmemName "Prelude") (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__463, dtb__464) -> (match dtb__463 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473) -> (if ((Base_dList.v_Base_dList_dmemName dtb__465) mc0) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) dtb__464)) (fun d2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__465, dtb__466, dtb__467, dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473)), d2)))))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf dtb__473)) dtb__469)) (fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__465, dtb__466, dtb__467, dtb__468, decls2, dtb__470, dtb__471, dtb__472, dtb__473)), dtb__464))) dtb__465) dtb__465) (Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls2)) ((Base_dList.v_Base_dList_dappend dtb__467) dtb__468)) decls2)) (fun d -> (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__465) dtb__466) dtb__471) dtb__472) d)))) (fun d1 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) dtb__464)) (fun d2 -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__465, dtb__466, dtb__467, dtb__468, d1, dtb__470, dtb__471, dtb__472, dtb__473)), d2)))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Project (dtb__474, dtb__475, dtb__476, dtb__477, dtb__478, dtb__479, dtb__480, dtb__481, dtb__482) -> ((fun entryTable -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram entryTable) dtb__474)) (fun decls2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__477) dtb__478) dtb__479) dtb__480) ((Base_dList.v_Base_dList_dappend dtb__475) dtb__476)) decls2)) (fun entryDecls -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep mc0) dtb__477)) (fun modules2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dcheckTrustPoints dtb__478) dtb__480) dtb__481) entryDecls) modules2)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (entryDecls, modules2))))))))))))) (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__482) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__477) ((Base_dList.v_Base_dList_dappend dtb__475) dtb__476))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun project -> ((v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping Base_dList.C_Base_dList_dList_Nil) project))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__483, dtb__484) -> (if (dtb__483 = 47) then dtb__484 else (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash dtb__484))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then 0 else ((fun _u -> (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) path))) ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath path)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache = (fun cpath src parsed -> ((fun _u -> ((fun _u -> parsed) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) cpath) ((Vuna_dCompiler_dCacheFormat.v_Vuna_dCompiler_dCacheFormat_dframeEncode v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema) (dtp_marshal (C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_AstCacheEntry (src, parsed)))))))) (v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir)))

let v_Vuna_dCompiler_dLoader_dFlatten_dparseAndStoreAt = (fun cpath path src -> (match ((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) src) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__485) -> (Base_dResult.C_Base_dResult_dResult_Err ((if ((Base_dString.v_Base_dString_dstartsWith (path ^ ":")) dtb__485) then dtb__485 else (String.concat "" [path; ": "; dtb__485]))))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__486) -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache cpath) src) dtb__486)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun path src -> ((fun cpath -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dreadAstCache cpath) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__487) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSource dtb__487) = src) then (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dLoader_dFlatten_dastCacheFile dtb__487))) else (((v_Vuna_dCompiler_dLoader_dFlatten_dparseAndStoreAt cpath) path) src))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_dparseAndStoreAt cpath) path) src)
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" [v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir; "/"; ((v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf path) src)])))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel roots importerPkg modules stack imports -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (modules))
  | Base_dList.C_Base_dList_dList_Cons (dtb__488, dtb__489) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule (fuel - 1)) roots) importerPkg) modules) stack) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__488))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) importerPkg) modules2) stack) dtb__489)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel roots importerPkg modules stack name -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__490) -> (Base_dResult.C_Base_dResult_dResult_Ok (modules))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if ((Base_dList.v_Base_dList_dmemName name) stack) then ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)))) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_SourceFile (dtb__491, dtb__492, dtb__493, dtb__494) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__491)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__492)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__492)) (fun implicit -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (Base_dList.C_Base_dList_dList_Cons (name, stack))) ((Base_dList.v_Base_dList_dappend dtb__492) implicit))) (fun modules2 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__491) dtb__492) dtb__494)) (fun exports -> ((fun visible -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (name, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__492, implicit, dtb__494, exports, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootTrustUnsafe root), visible)), modules2))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__493) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules2) ((Base_dList.v_Base_dList_dappend dtb__492) implicit)))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dnote ("parse-module=" ^ name)))) (Base_dPair.v_Base_dPair_dsecondOf found))) (Base_dPair.v_Base_dPair_dfirstOf found)))) else ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_InvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded = (fun ctx entry preloaded -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) entry)) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath entry) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) entry)))) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_SourceFile (dtb__495, dtb__496, dtb__497, dtb__498) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__496)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__496)) (fun implicit -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__496) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Project (dtb__498, dtb__496, implicit, modules, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx), false, dtb__497))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__499) -> (match dtb__499 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl (dtb__500, dtb__501, dtb__502, dtb__503) -> ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__495)
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_EntryFileNotFound (entry))) entry)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx entry -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded ctx) entry) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded = (fun ctx names preloaded -> ((fun entryImports -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) entryImports)) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Project (Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, Base_dList.C_Base_dList_dList_Nil, modules, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx), true, Base_dList.C_Base_dList_dList_Nil))))))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Import (n, false, Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))))) names)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx names -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded ctx) names) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded = (fun ctx label source preloaded -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_SourceFile (dtb__504, dtb__505, dtb__506, dtb__507) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__505)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__505)) (fun implicit -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__505) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Project (dtb__507, dtb__505, implicit, modules, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx), false, dtb__506))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__508) -> (match dtb__508 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl (dtb__509, dtb__510, dtb__511, dtb__512) -> ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_ModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__504)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx label source -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded ctx) label) source) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded = (fun ctx label source preloaded -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_SourceFile (dtb__513, dtb__514, dtb__515, dtb__516) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__517) -> (match dtb__517 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl (dtb__518, dtb__519, dtb__520, dtb__521) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__518) dtb__514)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__518) dtb__514)) (fun implicit -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) preloaded) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__514) implicit))) (fun modules -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules) dtb__518) dtb__513) dtb__514) dtb__516)) (fun exports -> ((fun visible -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Project (Base_dList.C_Base_dList_dList_Nil, dtb__514, implicit, (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Module (dtb__518, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), dtb__514, implicit, dtb__516, exports, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx), visible)), modules)), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextTrustUnsafe ctx), false, Base_dList.C_Base_dList_dList_Nil))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__515) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((Base_dList.v_Base_dList_dappend dtb__514) implicit)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded ctx) label) source) preloaded)
  | _ -> failwith "DT: impossible branch"
)) dtb__513)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun ctx label source -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded ctx) label) source) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun ctx modules0 label source -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_SourceFile (dtb__522, dtb__523, dtb__524, dtb__525) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__526) -> (match dtb__526 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_ModDecl (dtb__527, dtb__528, dtb__529, dtb__530) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__527) dtb__523)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__527) dtb__523)) (fun implicit -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__523) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__524) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((Base_dList.v_Base_dList_dappend dtb__523) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) dtb__523)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__523)) (fun implicit -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) Base_dList.C_Base_dList_dList_Nil) ((Base_dList.v_Base_dList_dappend dtb__523) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.C_Base_dPair_dPair_Pair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__524) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((Base_dList.v_Base_dList_dappend dtb__523) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)) dtb__522)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun ctx label source -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn ctx) Base_dList.C_Base_dList_dList_Nil) label) source)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dPair.v_Base_dPair_dsecondOf p))))))
