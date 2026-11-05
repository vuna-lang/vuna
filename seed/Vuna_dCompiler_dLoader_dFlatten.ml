open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry = C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry of (string) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dSourceFile)

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema = "vuna-ast-cache 6"

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir = ((fun base -> ((if (base = "") then "/tmp" else base) ^ "/vuna-cache/ast")) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) "TMPDIR")))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dastLane = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> ((fun v -> ((((v_Vuna_dCompiler_dLoader_dFlatten_dastLane dtb__1) mc1) mc2) (v - ((if mc2 = 0 then failwith "division by zero" else v / mc2) * mc2)))) ((mc3 * mc1) + dtb__0))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHash = (fun s -> ((fun cs -> ((((((((v_Vuna_dCompiler_dLoader_dFlatten_dastLane cs) 33) 1021) 0) + (((((v_Vuna_dCompiler_dLoader_dFlatten_dastLane cs) 131) 1019) 7) * 1024)) + (((((v_Vuna_dCompiler_dLoader_dFlatten_dastLane cs) 257) 1013) 13) * 1048576)) + (((((v_Vuna_dCompiler_dLoader_dFlatten_dastLane cs) 65599) 1009) 29) * 1073741824)) + (((((v_Vuna_dCompiler_dLoader_dFlatten_dastLane cs) 16777619) 997) 61) * 1099511627776))) (Base_dList.dtp_unpack s)))

let v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf = (fun path src -> (bi_strFromInt (v_Vuna_dCompiler_dLoader_dFlatten_dastStrongHash (String.concat "" [v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSchema; "\t"; path; "\t"; src]))))

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSource = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry (dtb__2, dtb__3) -> dtb__2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheFile = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry (dtb__4, dtb__5) -> dtb__5
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dreadAstCache = (fun cpath -> (dtp_unmarshal (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) cpath))))

let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((Base_dList.v_Base_dList_dconcatMap (fun imp -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf dtb__6)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))) imports))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> ((fun key -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__8) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__8) (((Base_dHashMap.v_Base_dHashMap_dinsert key) 1) mc1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__7 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((Base_dString.v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> (String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export private name "; name; " (names starting with _ are module-private)"]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (match dtb__15 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (if (dtb__17 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__20))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__16))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (if (dtb__24 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__24, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__24, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__16))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__30, dtb__31, dtb__32, dtb__33) -> (if (dtb__30 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__32))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__16))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__16)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (match dtb__34 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__36, dtb__37, dtb__38, dtb__39) -> (if (dtb__36 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__35))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__40, dtb__41, dtb__42, dtb__43) -> (if (dtb__40 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__35))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__44, dtb__45, dtb__46) -> (if (dtb__44 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__35))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__47, dtb__48, dtb__49, dtb__50) -> (if (dtb__47 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__35))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__35)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (if ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__51) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__51))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__52))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__53, dtb__54) -> (match dtb__53 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__55, dtb__56, dtb__57) -> (if (dtb__55 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__54))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (match dtb__58 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__63) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__67) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__67))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (if (dtb__68 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__68)))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__59))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__74, dtb__75, dtb__76, dtb__77) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__76) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__78))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__59)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__59)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__79) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__80) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("ctor", dtb__79, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__79), ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__80))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (if (if ((match dtb__81 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__83
  | _ -> failwith "DT: impossible branch"
) = "ctor") then ((match dtb__81 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__87, dtb__88, dtb__89, dtb__90) -> dtb__90
  | _ -> failwith "DT: impossible branch"
) = mc0) else false) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__81, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__82))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__82))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__91) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__91, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__91), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__91) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__94)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__98) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__98, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__98), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__98) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__98, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__104, dtb__105, dtb__106, dtb__107) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__104) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__104, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__104), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__104) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__106)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__108, dtb__109, dtb__110, dtb__111) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__112, dtb__113, dtb__114, dtb__115) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__112) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__112, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__112), "")), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__116, dtb__117, dtb__118) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__116) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__116, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__116), "")), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__119, dtb__120, dtb__121, dtb__122) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__119) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__119, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__119), "")), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__123, dtb__124, dtb__125, dtb__126) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__123) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__123, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__123), "")), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> ((fun key -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__128) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__128) (((Base_dHashMap.v_Base_dHashMap_dinsert key) 1) mc1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__127, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" [(match dtb__127 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__130, dtb__131, dtb__132, dtb__133) -> dtb__130
  | _ -> failwith "DT: impossible branch"
); "|"; (match dtb__127 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__134, dtb__135, dtb__136, dtb__137) -> dtb__135
  | _ -> failwith "DT: impossible branch"
)]))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__138, dtb__139) -> (match dtb__138 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (if (dtb__140 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__139))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__139)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__147) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> (match dtb__148 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__147) dtb__153)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__146))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (match dtb__157 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__158, dtb__159, dtb__160) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> (match dtb__161 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__162, dtb__163, dtb__164) -> (if (if (if (dtb__158 = "type") then (dtb__162 = "ctor") else false) then (dtb__159 = dtb__163) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__159) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__165) -> (match dtb__165 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__166, dtb__167, dtb__168) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__166, mc0, dtb__167, dtb__168)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", (match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__169, dtb__170, dtb__171, dtb__172) -> dtb__171
  | _ -> failwith "DT: impossible branch"
), ""))))))))
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (match dtb__173 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__174), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__176, dtb__177, dtb__178, dtb__179) -> dtb__176
  | _ -> failwith "DT: impossible branch"
), (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__180, dtb__181, dtb__182, dtb__183) -> dtb__182
  | _ -> failwith "DT: impossible branch"
), (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__184, dtb__185, dtb__186, dtb__187) -> dtb__187
  | _ -> failwith "DT: impossible branch"
)))))))) (Base_dPair.v_Base_dPair_dsecondOf p))))
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> (match dtb__188 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__189, dtb__190) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("ctor", ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__190), ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__189)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__191), ""))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__193) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((match dtb__192 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__194, dtb__195, dtb__196, dtb__197) -> dtb__194
  | _ -> failwith "DT: impossible branch"
), base, (match dtb__192 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__198, dtb__199, dtb__200, dtb__201) -> dtb__200
  | _ -> failwith "DT: impossible branch"
), (match dtb__192 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__202, dtb__203, dtb__204, dtb__205) -> dtb__205
  | _ -> failwith "DT: impossible branch"
))), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (match dtb__193 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__208
  | _ -> failwith "DT: impossible branch"
), "")), Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((match dtb__192 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__210, dtb__211, dtb__212, dtb__213) -> dtb__210
  | _ -> failwith "DT: impossible branch"
), base, (match dtb__192 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__214, dtb__215, dtb__216, dtb__217) -> dtb__216
  | _ -> failwith "DT: impossible branch"
), (match dtb__192 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__218, dtb__219, dtb__220, dtb__221) -> dtb__221
  | _ -> failwith "DT: impossible branch"
))), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__222) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (match dtb__222 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__223, dtb__224, dtb__225, dtb__226) -> dtb__225
  | _ -> failwith "DT: impossible branch"
), "")), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (match dtb__227 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__229) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__230) -> (match vr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__231) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dList.v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__232) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__232) dtb__228) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__227))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__235, dtb__236, dtb__237, dtb__238) -> dtb__237
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dfirstOf p))))
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__239) -> (match dtb__239 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__241) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__240), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__240) dtb__241)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))
  | _ -> ((fun mprefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__242) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__242)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__234) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__243) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__234, (match dtb__243 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__244, dtb__245, dtb__246, dtb__247) -> dtb__246
  | _ -> failwith "DT: impossible branch"
), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (match dtb__243 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__248, dtb__249, dtb__250, dtb__251) -> dtb__250
  | _ -> failwith "DT: impossible branch"
)) es)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": type "; dtb__234; " is not exported by "; dtb__242])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__233))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__252, dtb__253) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__252) dtb__253)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__254, dtb__255) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__254) dtb__255)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__256, dtb__257) -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix mc3) dtb__256) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc1; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__257); ": module "; dtb__256; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__258) -> ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__258)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__259, dtb__260) -> (if (if ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__261, dtb__262, dtb__263, dtb__264) -> dtb__261
  | _ -> failwith "DT: impossible branch"
) = (match dtb__259 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__265, dtb__266, dtb__267, dtb__268) -> dtb__265
  | _ -> failwith "DT: impossible branch"
)) then ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__269, dtb__270, dtb__271, dtb__272) -> dtb__270
  | _ -> failwith "DT: impossible branch"
) = (match dtb__259 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__273, dtb__274, dtb__275, dtb__276) -> dtb__274
  | _ -> failwith "DT: impossible branch"
)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind mc0) dtb__260))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__277, dtb__278) -> (if (if (if ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__279, dtb__280, dtb__281, dtb__282) -> dtb__279
  | _ -> failwith "DT: impossible branch"
) = (match dtb__277 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__283, dtb__284, dtb__285, dtb__286) -> dtb__283
  | _ -> failwith "DT: impossible branch"
)) then ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__287, dtb__288, dtb__289, dtb__290) -> dtb__288
  | _ -> failwith "DT: impossible branch"
) = (match dtb__277 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__291, dtb__292, dtb__293, dtb__294) -> dtb__292
  | _ -> failwith "DT: impossible branch"
)) else false) then ((match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__295, dtb__296, dtb__297, dtb__298) -> dtb__297
  | _ -> failwith "DT: impossible branch"
) <> (match dtb__277 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__299, dtb__300, dtb__301, dtb__302) -> dtb__301
  | _ -> failwith "DT: impossible branch"
)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport mc0) dtb__278))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e e2 -> (if (if (if ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__303, dtb__304, dtb__305, dtb__306) -> dtb__303
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__307, dtb__308, dtb__309, dtb__310) -> dtb__307
  | _ -> failwith "DT: impossible branch"
)) then ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__311, dtb__312, dtb__313, dtb__314) -> dtb__312
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__315, dtb__316, dtb__317, dtb__318) -> dtb__316
  | _ -> failwith "DT: impossible branch"
)) else false) then ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__319, dtb__320, dtb__321, dtb__322) -> dtb__321
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__323, dtb__324, dtb__325, dtb__326) -> dtb__325
  | _ -> failwith "DT: impossible branch"
)) else false) then ((match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__327, dtb__328, dtb__329, dtb__330) -> dtb__330
  | _ -> failwith "DT: impossible branch"
) = (match e2 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__331, dtb__332, dtb__333, dtb__334) -> dtb__334
  | _ -> failwith "DT: impossible branch"
)) else false))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__335, dtb__336, dtb__337, dtb__338) -> dtb__335
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__339, dtb__340, dtb__341, dtb__342) -> dtb__340
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__343, dtb__344, dtb__345, dtb__346) -> dtb__345
  | _ -> failwith "DT: impossible branch"
); "|"; (match e with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__347, dtb__348, dtb__349, dtb__350) -> dtb__350
  | _ -> failwith "DT: impossible branch"
)]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__351, dtb__352) -> ((fun key -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup key) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__353) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__352) mc1) mc2)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__352) (((Base_dHashMap.v_Base_dHashMap_dinsert key) 1) mc1)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__351, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__351))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Base_dList_dNil)) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__354, dtb__355) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__354) dtb__355) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": duplicate export "; (match dtb__354 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__356, dtb__357, dtb__358, dtb__359) -> dtb__357
  | _ -> failwith "DT: impossible branch"
)]))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__355))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__360, dtb__361) -> ("module:" ^ dtb__360)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__362, dtb__363) -> ("typeall:" ^ dtb__362)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__364, dtb__365) -> ("bare:" ^ dtb__364)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__366, dtb__367) -> (match dtb__366 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> (if (mc0 = dtb__368) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf mc0) dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__370, dtb__371) -> (match dtb__370 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__372, dtb__373) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__372) dtb__371) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__373)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__371))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__374, dtb__375) -> dtb__374
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__376, dtb__377) -> dtb__376
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__378, dtb__379) -> dtb__378
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((Base_dList.v_Base_dList_dmap (fun i -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__380) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": duplicate export "; dtb__380])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__381, dtb__382) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__381)) (fun es -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__382)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dList.v_Base_dList_dappend es) tail)))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__383) -> (match dtb__383 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__384, dtb__385, dtb__386, dtb__387) -> (if (dtb__384 = mc0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__387); ": module name mismatch: source declares "; dtb__384]))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__388) -> (match dtb__388 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__389, dtb__390, dtb__391, dtb__392) -> (if dtb__390 then ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports mc0) mc1) mc4) mc3) dtb__391)) (fun es -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc1) es)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinArrows (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Base_dList_dCons (name, stack)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__393, dtb__394) -> (match dtb__394 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport ("Prelude", false, Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["ambiguous implicit Prelude (found in: "; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinArrows ((Base_dList.v_Base_dList_dmap (fun c -> (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)))) mc1)); ")"])))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots importerPkg -> (match (((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__395, dtb__396) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((Base_dList.v_Base_dList_dfilter (fun c -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName (Base_dPair.v_Base_dPair_dsecondOf c)) <> importerPkg))) dtb__395))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots importerPkg currentName imports -> (if (currentName = "Prelude") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (if ((Base_dList.v_Base_dList_dmemName "Prelude") (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__397, dtb__398) -> (match dtb__397 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__399, dtb__400, dtb__401, dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf dtb__406)) dtb__403)) (fun decls2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dandThen ((((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__399, dtb__400, dtb__401, dtb__402, decls2, dtb__404, dtb__405, dtb__406)), dtb__398))) dtb__399) dtb__399) (Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls2)) ((Base_dList.v_Base_dList_dappend dtb__401) dtb__402)) decls2)) (fun d -> ((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__399) dtb__400) dtb__405) d)))) (fun d1 -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__398)) (fun d2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__399, dtb__400, dtb__401, dtb__402, d1, dtb__404, dtb__405, dtb__406)), d2))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__407, dtb__408, dtb__409, dtb__410, dtb__411, dtb__412, dtb__413) -> ((fun entryTable -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram entryTable) dtb__407)) (fun decls2 -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dLoader_dResolve.v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__410) dtb__411) dtb__412) ((Base_dList.v_Base_dList_dappend dtb__408) dtb__409)) decls2)) (fun entryDecls -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__410)) (fun modules2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))))) (Vuna_dCompiler_dLoader_dFixity.v_Vuna_dCompiler_dLoader_dFixity_dtableOf (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__413) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__410) ((Base_dList.v_Base_dList_dappend dtb__408) dtb__409))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__414, dtb__415) -> (if (dtb__414 = 47) then dtb__415 else (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash dtb__415))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((Base_dList.v_Base_dList_dlength after) = (Base_dList.v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((Base_dString.v_Base_dString_dstartsWith "/") path) then (Base_dBool.v_Base_dBool_dnot ((Base_dString.v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash rev))) (Base_dList.v_Base_dList_dreverse chars))) (Base_dList.dtp_unpack path)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) path)) then 0 else ((fun _u -> (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) path))) ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath path)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache = (fun cpath src parsed -> ((fun _u -> ((fun _u -> parsed) (Base_dIO.v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFileAtomic dtio_0 dtio_1) cpath) (dtp_marshal (C_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry_Vuna_dCompiler_dLoader_dFlatten_dAstCacheEntry (src, parsed))))))) (v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir)))

let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun path src -> ((fun cpath -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) cpath)) then ((fun entry -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dastCacheSource entry) = src) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_dastCacheFile entry))) else (match ((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) src) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__416) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [path; ": "; dtb__416])))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__417) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache cpath) src) dtb__417)))
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dLoader_dFlatten_dreadAstCache cpath)) else (match ((Vuna_dCompiler_dFrontend_dParser.v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) src) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__418) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [path; ": "; dtb__418])))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__419) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dFlatten_dstoreAstCache cpath) src) dtb__419)))
  | _ -> failwith "DT: impossible branch"
))) (String.concat "" [v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir; "/"; ((v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf path) src)])))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel roots importerPkg modules stack imports -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__420, dtb__421) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule (fuel - 1)) roots) importerPkg) modules) stack) (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__420))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) importerPkg) modules2) stack) dtb__421)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel roots importerPkg modules stack name -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__422) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((Base_dList.v_Base_dList_dmemName name) stack) then ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) path)))) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__423, dtb__424, dtb__425, dtb__426) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__423)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__424)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__424)) (fun implicit -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (Base_dList.C_Base_dList_dList_Base_dList_dCons (name, stack))) ((Base_dList.v_Base_dList_dappend dtb__424) implicit))) (fun modules2 -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__423) dtb__424) dtb__426)) (fun exports -> ((fun visible -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (name, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__424, implicit, dtb__426, exports, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root), visible)), modules2))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__425) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules2) ((Base_dList.v_Base_dList_dappend dtb__424) implicit)))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dPair.v_Base_dPair_dsecondOf found))) (Base_dPair.v_Base_dPair_dfirstOf found)))) else ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx entry -> (if (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) entry)) then ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath entry) (Base_dIO.v_Base_dIO_drunIO ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) entry)))) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__427, dtb__428, dtb__429, dtb__430) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__428)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__428)) (fun implicit -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Base_dList.v_Base_dList_dappend dtb__428) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__430, dtb__428, implicit, modules, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__429))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__431) -> (match dtb__431 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__432, dtb__433, dtb__434, dtb__435) -> ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__427)
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (entry))) entry)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx names -> ((fun entryImports -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) entryImports)) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil, modules, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (n, false, Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx label source -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__436, dtb__437, dtb__438, dtb__439) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__437)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__437)) (fun implicit -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Base_dList.v_Base_dList_dappend dtb__437) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__439, dtb__437, implicit, modules, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__438))))))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__440) -> (match dtb__440 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__441, dtb__442, dtb__443, dtb__444) -> ((Vuna_dCompiler_dLoader_dDiagnostics.v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (Vuna_dCompiler_dLoader_dDiagnostics.C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__436)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun ctx label source -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__445, dtb__446, dtb__447, dtb__448) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__449) -> (match dtb__449 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__450, dtb__451, dtb__452, dtb__453) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__450) dtb__446)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__450) dtb__446)) (fun implicit -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Base_dList.v_Base_dList_dappend dtb__446) implicit))) (fun modules -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules) dtb__450) dtb__445) dtb__446) dtb__448)) (fun exports -> ((fun visible -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__446, implicit, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__450, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), dtb__446, implicit, dtb__448, exports, (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), visible)), modules)), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), Base_dList.C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__447) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((Base_dList.v_Base_dList_dappend dtb__446) implicit)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) label) source)
  | _ -> failwith "DT: impossible branch"
)) dtb__445)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun ctx modules0 label source -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSourceFile (dtb__454, dtb__455, dtb__456, dtb__457) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__458) -> (match dtb__458 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__459, dtb__460, dtb__461, dtb__462) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__459) dtb__455)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__459) dtb__455)) (fun implicit -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Base_dList.v_Base_dList_dappend dtb__455) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__456) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((Base_dList.v_Base_dList_dappend dtb__455) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) dtb__455)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__455)) (fun implicit -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Base_dList.v_Base_dList_dappend dtb__455) implicit))) (fun modules -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((Base_dList.v_Base_dList_dappend dtb__456) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((Base_dList.v_Base_dList_dappend dtb__455) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)) dtb__454)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun ctx label source -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn ctx) Base_dList.C_Base_dList_dList_Base_dList_dNil) label) source)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.v_Base_dPair_dsecondOf p))))))
