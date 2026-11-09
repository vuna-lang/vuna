open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx = C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx of ((string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dHashMap.t_Base_dHashMap_dHashMap) * (string Base_dList.t_Base_dList_dList)

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule = (fun modName -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName modName))

let v_Vuna_dCompiler_dCodegen_dSplit_dmainInitPrologue = "let () = Printexc.record_backtrace true\n"

let v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf = (fun pairs -> ((Base_dHashMap.v_Base_dHashMap_dinsertAll pairs) (Base_dHashMap.v_Base_dHashMap_dfromList Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl = (fun t name -> (match ((Base_dHashMap.v_Base_dHashMap_dlookup name) t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit = (fun ownerT u datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (((v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl ownerT) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) = u))) datas))

let v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit = (fun ownerT u defs -> ((Base_dList.v_Base_dList_dfilter (fun d -> (((v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl ownerT) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) = u))) defs))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__1, dtb__2) -> (if (dtb__1 = mc1) then mc0 else (((v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo (mc0 + 1)) mc1) dtb__2))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dposOfName = (fun name units -> (((v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo 1) name) units))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun selfPos -> ((fun depPos -> (if (depPos = 0) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: "; mc1; " references unknown unit `"; dtb__3; "`"]))) else (if (selfPos = 0) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: split unit `"; mc1; "` is not in the module order"]))) else (if (depPos >= selfPos) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: split dependency is not in topological order: "; mc1; " -> "; dtb__3]))) else (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder mc0) mc1) dtb__4))))) ((v_Vuna_dCompiler_dCodegen_dSplit_dposOfName dtb__3) mc0))) ((v_Vuna_dCompiler_dCodegen_dSplit_dposOfName mc1) mc0))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder = (fun ordered self deps -> ((Base_dList.v_Base_dList_dfilter (fun u -> (if (Base_dBool.v_Base_dBool_dnot (u = self)) then ((Base_dList.v_Base_dList_dmemName u) deps) else false))) ordered))

let v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf = (fun ordered self deps -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder ordered) self) deps)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder ordered) self) deps))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit = (fun pairs -> ((Base_dList.v_Base_dList_dmap (fun q -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf q), (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dsecondOf q)))))) pairs))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName = (fun knownModules mname name -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)) knownModules) then (Base_dResult.C_Base_dResult_dResult_Ok (0)) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: module "; mname; " declares `"; name; "` whose module prefix `"; (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"])))) else (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"])))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName mc0) mc1) dtb__5)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) mc1) dtb__6)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__9, dtb__10) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) dtb__9) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__10))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls mc0) dtb__8)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__11 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__13, dtb__14, dtb__15, dtb__16) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (false, dtb__13)), (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__17, dtb__18, dtb__19, dtb__20) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (false, dtb__17)), (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__21)), (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__28)), (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__34, dtb__35, dtb__36, dtb__37) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (true, dtb__34)), (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__38, dtb__39) -> (if dtb__38 then ("type\t" ^ dtb__39) else ("value\t" ^ dtb__39))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName = (fun seen identity -> ((fun name -> ((fun key -> (if (name = "") then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: entry declaration has an empty name")) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"]))) else (if ((Base_dList.v_Base_dList_dmemName key) seen) then (Base_dResult.C_Base_dResult_dResult_Err ((String.concat "" ["DT: internal: duplicate entry declaration `"; name; "`"]))) else (Base_dResult.C_Base_dResult_dResult_Ok (0)))))) (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey identity))) (Base_dPair.v_Base_dPair_dsecondOf identity)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName mc0) dtb__40)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey dtb__40), mc0))) dtb__41)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities decls)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__42))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners mc0) dtb__43)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf mc0) dtb__44)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners mc0) dtb__45)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules = (fun meta modules entryDecls runtime datas -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls (match meta with
  | Vuna_dCompiler_dDriver_dOwner.C_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_SplitMeta (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__48
  | _ -> failwith "DT: impossible branch"
)) modules)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls entryDecls)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners meta) runtime)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners meta) datas))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix = (fun prefix path -> (if (prefix = "") then path else (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "/")) path) then (((dtp_substring (bi_strLength (prefix ^ "/"))) ((bi_strLength path) - (bi_strLength (prefix ^ "/")))) path) else path)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if ((Base_dString.v_Base_dString_dstartsWith (dtb__51 ^ "/")) mc1) then ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix dtb__51) mc1) else ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots dtb__52) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripDotSlash = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "./") path) then (((dtp_substring 2) ((bi_strLength path) - 2)) path) else path))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitLocPath = (fun roots contextDir path -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripDotSlash ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix contextDir) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots roots) path))))

let v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitLookup = (fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)

let v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitStore = (fun _u _u -> 0)

let v_Vuna_dCompiler_dCodegen_dSplit_dstoreModuleFile = (fun store key sf -> ((fun _u -> sf) ((store key) sf)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (match dtb__53 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__55, dtb__56) -> ((fun unit -> (match (mc0 dtb__55) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith mc0) mc1) mc2) dtb__54)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons (dtb__57, tail))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun unitDatas -> ((fun unitDefs -> ((fun qc -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs unitDefs)) (fun groups -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__58
  | _ -> failwith "DT: impossible branch"
)) qc) (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> dtb__67
  | _ -> failwith "DT: impossible branch"
)) unitDatas) groups)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith mc0) mc1) mc2) dtb__54)) (fun tail -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> dtb__81
  | _ -> failwith "DT: impossible branch"
)) unit) (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps parts))) (fun deps -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCodegen_dSplit_dstoreModuleFile mc1) dtb__55) (Vuna_dCompiler_dDriver_dSplit.C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_SplitFile ((unit ^ ".ml"), ((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts) ^ "\n"), deps))), tail))))))))))))) (Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (unit, (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__87
  | _ -> failwith "DT: impossible branch"
), (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95, dtb__96, dtb__97) -> dtb__96
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> dtb__101
  | _ -> failwith "DT: impossible branch"
)) dtb__55) (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> dtb__108
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__118
  | _ -> failwith "DT: impossible branch"
)) dtb__55) (match mc2 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> dtb__123
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule dtb__55))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFileWith = (fun lookup store ctx printResult -> (match (lookup "__entry__") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__130) -> (Base_dResult.C_Base_dResult_dResult_Ok (dtb__130))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun entryUnit -> ((fun entryDefs -> ((fun entryDatas -> ((fun qc -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs entryDefs)) (fun groups -> ((Base_dResult.v_Base_dResult_dandThen (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__131, dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__131
  | _ -> failwith "DT: impossible branch"
)) qc) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> dtb__140
  | _ -> failwith "DT: impossible branch"
)) entryDatas) groups)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook qc) (Base_dPair.C_Base_dPair_dPair_Pair ((match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152, dtb__153, dtb__154) -> dtb__148
  | _ -> failwith "DT: impossible branch"
), (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__155, dtb__156, dtb__157, dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> dtb__157
  | _ -> failwith "DT: impossible branch"
)))) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167, dtb__168, dtb__169, dtb__170) -> dtb__165
  | _ -> failwith "DT: impossible branch"
)) printResult)) (fun hook -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__171, dtb__172, dtb__173, dtb__174, dtb__175, dtb__176, dtb__177, dtb__178) -> dtb__178
  | _ -> failwith "DT: impossible branch"
)) entryUnit) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps parts)) (Base_dPair.v_Base_dPair_dsecondOf hook)))) (fun deps -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dCodegen_dSplit_dstoreModuleFile store) "__entry__") (Vuna_dCompiler_dDriver_dSplit.C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_SplitFile ("Main.ml", (String.concat "" [v_Vuna_dCompiler_dCodegen_dSplit_dmainInitPrologue; (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts); (Base_dPair.v_Base_dPair_dfirstOf hook)]), deps)))))))))))))) (Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_QualCtx (entryUnit, (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__179, dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> dtb__184
  | _ -> failwith "DT: impossible branch"
), (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__187, dtb__188, dtb__189, dtb__190, dtb__191, dtb__192, dtb__193, dtb__194) -> dtb__193
  | _ -> failwith "DT: impossible branch"
))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199, dtb__200, dtb__201, dtb__202) -> dtb__199
  | _ -> failwith "DT: impossible branch"
)) Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__203, dtb__204, dtb__205, dtb__206, dtb__207, dtb__208, dtb__209, dtb__210) -> dtb__204
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218) -> dtb__214
  | _ -> failwith "DT: impossible branch"
)) Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) (match ctx with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx (dtb__219, dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226) -> dtb__221
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwnersWith = (fun lookup store modules printResult runtime allDatas allDefs defPairs dataPairs runtimeText -> ((fun defUnitT -> ((fun dataUnitT -> ((fun ordered -> ((fun ctx -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith lookup) store) ctx) modules)) (fun moduleFiles -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFileWith lookup) store) ctx) printResult)) (fun mainFile -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dDriver_dSplit.C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_SplitFile ("Vuna_runtime.ml", runtimeText, Base_dList.C_Base_dList_dList_Nil)), ((Base_dList.v_Base_dList_dappend moduleFiles) (Base_dList.C_Base_dList_dList_Cons (mainFile, Base_dList.C_Base_dList_dList_Nil)))))))))))) (C_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_SplitGenCtx ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas), allDatas, runtime, (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf defPairs), (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf dataPairs), defUnitT, dataUnitT, ordered)))) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dmap (fun q -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dfirstOf q)))) modules))) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner), Base_dList.C_Base_dList_dList_Nil))))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit dataPairs)))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit defPairs))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFilesWith = (fun lookup store modules entryDecls printResult runtime allDatas allDefs meta runtimeText -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules meta) modules) entryDecls) runtime) allDatas)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs meta) runtime)) (fun defPairs -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> ((((((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwnersWith lookup) store) modules) printResult) runtime) allDatas) allDefs) defPairs) dataPairs) runtimeText))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith = (fun lookup store modules entryDecls prog printResult roots contextDir -> ((fun _u -> ((fun allDatas -> ((fun allDefs -> ((fun meta -> ((fun _u -> ((fun locTbl -> ((fun _u -> ((fun runtimeText -> ((fun _u -> ((Base_dResult.v_Base_dResult_dandThen (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram (Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), allDefs)))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__227, dtb__228) -> ((((((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFilesWith lookup) store) modules) entryDecls) printResult) dtb__227) allDatas) allDefs) meta) runtimeText)
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-runtimeText-done"))) (Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith locTbl))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-deflocs-done"))) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitLocPath roots) contextDir)) allDefs))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-splitmeta-done"))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf modules) entryDecls))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-splitstart")))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram = (fun modules entryDecls prog printResult roots contextDir -> ((((((((v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitLookup) v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitStore) modules) entryDecls) prog) printResult) roots) contextDir))
