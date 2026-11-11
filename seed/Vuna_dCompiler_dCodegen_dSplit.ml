open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx = { f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcUsedTbl : (string, int Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefOwnerT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataOwnerT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefUnitT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataUnitT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcOrdered : string Base_dList.t_Base_dList_dList }

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule = (fun modName -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName modName))

let v_Vuna_dCompiler_dCodegen_dSplit_dmainInitPrologue = "let () = Printexc.record_backtrace true\n"

let v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf = (fun pairs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) pairs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl = (fun t name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) t) with
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
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> ((fun selfPos -> ((fun depPos -> (if (depPos = 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" [mc1; " references unknown unit `"; dtb__3; "`"])) else (if (selfPos = 0) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (if (depPos >= selfPos) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["split dependency is not in topological order: "; mc1; " -> "; dtb__3])) else (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder mc0) mc1) dtb__4))))) ((v_Vuna_dCompiler_dCodegen_dSplit_dposOfName dtb__3) mc0))) ((v_Vuna_dCompiler_dCodegen_dSplit_dposOfName mc1) mc0))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder = (fun ordered self deps -> ((Base_dList.v_Base_dList_dfilter (fun u -> (if (Base_dBool.v_Base_dBool_dnot (u = self)) then ((Base_dList.v_Base_dList_dmemName u) deps) else false))) ordered))

let v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf = (fun ordered self deps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder ordered) self) deps)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder ordered) self) deps))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit = (fun pairs -> ((Base_dList.v_Base_dList_dmap (fun q -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf q); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dsecondOf q)) })) pairs))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName = (fun knownModules mname name -> (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)) knownModules) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["DT: internal: module "; mname; " declares `"; name; "` whose module prefix `"; (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["DT: internal: module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__5, dtb__6) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName mc0) mc1) dtb__5)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) mc1) dtb__6)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (match dtb__7 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__9; Base_dPair.f_Base_dPair_dPair_second = dtb__10 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) dtb__9) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__10))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls mc0) dtb__8)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__11 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__13, dtb__14, dtb__15, dtb__16) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__13 }, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__17, dtb__18, dtb__19, dtb__20) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__17 }, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__21 }, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__30 }, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__38, dtb__39, dtb__40, dtb__41) -> (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__38 }, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__12)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> (if dtb__42 then ("type\t" ^ dtb__43) else ("value\t" ^ dtb__43))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName = (fun seen identity -> ((fun name -> ((fun key -> (if (name = "") then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal "entry declaration has an empty name") else (if (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dcontainsDot name) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" ["DT: internal: entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((Base_dList.v_Base_dList_dmemName key) seen) then (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_dicInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)))))) (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey identity))) (Base_dPair.v_Base_dPair_dsecondOf identity)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName mc0) dtb__44)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey dtb__44), mc0))) dtb__45)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities decls)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__46))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners mc0) dtb__47)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf mc0) dtb__48)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners mc0) dtb__49)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules = (fun meta modules entryDecls runtime datas -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules) modules)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls entryDecls)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners meta) runtime)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners meta) datas))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix = (fun prefix path -> (if (prefix = "") then path else (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "/")) path) then (((dtp_substring (bi_strLength (prefix ^ "/"))) ((bi_strLength path) - (bi_strLength (prefix ^ "/")))) path) else path)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if ((Base_dString.v_Base_dString_dstartsWith (dtb__50 ^ "/")) mc1) then ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix dtb__50) mc1) else ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots dtb__51) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripDotSlash = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "./") path) then (((dtp_substring 2) ((bi_strLength path) - 2)) path) else path))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitLocPath = (fun roots contextDir path -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripDotSlash ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix contextDir) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots roots) path))))

let v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitLookup = (fun _u -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)

let v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitStore = (fun _u _u -> 0)

let v_Vuna_dCompiler_dCodegen_dSplit_dstoreModuleFile = (fun store key sf -> ((fun _u -> sf) ((store key) sf)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_danyDefUsesFloat = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__52) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dCodegen_dSplit_danyDefUsesFloat dtb__53)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsicNames) dtb__54) then true else (v_Vuna_dCompiler_dCodegen_dSplit_danyDefUsesFloat dtb__53))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match dtb__55 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__57; Base_dPair.f_Base_dPair_dPair_second = dtb__58 } -> ((fun unit -> (match (mc0 dtb__57) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith mc0) mc1) mc2) dtb__56)) (fun tail -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__59, tail))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun unitDatas -> ((fun unitDefs -> ((fun qc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs unitDefs)) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcUsedTbl) qc) (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas) unitDatas) groups)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith mc0) mc1) mc2) dtb__56)) (fun tail -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcOrdered) unit) (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps parts))) (fun deps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dCodegen_dSplit_dstoreModuleFile mc1) dtb__57) { Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = (unit ^ ".ml"); Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = ((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts) ^ "\n"); Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = deps }), tail))))))))))))) { Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = unit; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefUnitT; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataUnitT })) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefOwnerT) dtb__57) (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDefs))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataOwnerT) dtb__57) (mc2).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule dtb__57))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFileWith = (fun lookup store ctx printResult -> (match (lookup "__entry__") with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__60))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun entryUnit -> ((fun entryDefs -> ((fun entryDatas -> ((fun qc -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs entryDefs)) (fun groups -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcUsedTbl) qc) (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas) entryDatas) groups)) (fun parts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook qc) { Base_dPair.f_Base_dPair_dPair_first = (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas; Base_dPair.f_Base_dPair_dPair_second = (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDefs }) (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDefs) printResult)) (fun hook -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcOrdered) entryUnit) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps parts)) (Base_dPair.v_Base_dPair_dsecondOf hook)))) (fun deps -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dCodegen_dSplit_dstoreModuleFile store) "__entry__") { Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = "Main.ml"; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = (String.concat "" [v_Vuna_dCompiler_dCodegen_dSplit_dmainInitPrologue; (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts); (Base_dPair.v_Base_dPair_dfirstOf hook)]); Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = deps })))))))))))) { Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = entryUnit; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefUnitT; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataUnitT })) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataOwnerT) Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefOwnerT) Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) (ctx).f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDefs))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwnersWith = (fun lookup store modules printResult runtime allDatas allDefs defPairs dataPairs runtimeText -> ((fun defUnitT -> ((fun dataUnitT -> ((fun ordered -> ((fun ctx -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith lookup) store) ctx) modules)) (fun moduleFiles -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFileWith lookup) store) ctx) printResult)) (fun mainFile -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = "Vuna_runtime.ml"; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = runtimeText; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = Base_dList.C_Base_dList_dList_Nil }, ((Base_dList.v_Base_dList_dappend moduleFiles) (Base_dList.C_Base_dList_dList_Cons (mainFile, Base_dList.C_Base_dList_dList_Nil)))))))))))) { f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcUsedTbl = (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas); f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDatas = allDatas; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcAllDefs = runtime; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefOwnerT = (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf defPairs); f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataOwnerT = (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf dataPairs); f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDefUnitT = defUnitT; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcDataUnitT = dataUnitT; f_Vuna_dCompiler_dCodegen_dSplit_dSplitGenCtx_sgcOrdered = ordered })) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dmap (fun q -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dfirstOf q)))) modules))) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner), Base_dList.C_Base_dList_dList_Nil))))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit dataPairs)))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit defPairs))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFilesWith = (fun lookup store modules entryDecls printResult runtime allDatas allDefs meta runtimeText -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules meta) modules) entryDecls) runtime) allDatas)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs meta) runtime)) (fun defPairs -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> ((((((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwnersWith lookup) store) modules) printResult) runtime) allDatas) allDefs) defPairs) dataPairs) runtimeText))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith = (fun lookup store modules entryDecls prog printResult roots contextDir -> ((fun _u -> ((fun allDatas -> ((fun allDefs -> ((fun meta -> ((fun _u -> ((fun locTbl -> ((fun _u -> ((fun usesFloat -> ((fun runtimeText -> ((fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram { Base_dPair.f_Base_dPair_dPair_first = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog); Base_dPair.f_Base_dPair_dPair_second = allDefs })) (fun p -> (match p with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__61; Base_dPair.f_Base_dPair_dPair_second = dtb__62 } -> ((((((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFilesWith lookup) store) modules) entryDecls) printResult) dtb__61) allDatas) allDefs) meta) runtimeText)
  | _ -> failwith "DT: impossible branch"
)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-runtimeText-done"))) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith locTbl) usesFloat))) (v_Vuna_dCompiler_dCodegen_dSplit_danyDefUsesFloat allDefs))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-deflocs-done"))) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitLocPath roots) contextDir)) allDefs))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-splitmeta-done"))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf modules) entryDecls))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) (Vuna_dCompiler_dDebug.v_Vuna_dCompiler_dDebug_dstamp "cg-splitstart")))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram = (fun modules entryDecls prog printResult roots contextDir -> ((((((((v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitLookup) v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitStore) modules) entryDecls) prog) printResult) roots) contextDir))
