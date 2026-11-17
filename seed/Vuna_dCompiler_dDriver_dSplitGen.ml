open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx = { f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcEnv : Vuna_dCompiler_dLowering_dEnv.t_Vuna_dCompiler_dLowering_dEnv_dLwEnv; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDatas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDefs : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtDef Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefOwnerT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataOwnerT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefUnitT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataUnitT : (string, string) Base_dHashMap.t_Base_dHashMap_dHashMap; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcOrdered : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcNormPath : (string) -> string }

# 32 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule = (fun modName -> (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName modName))

# 37 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dmainInitPrologue = "let () = Printexc.record_backtrace true\n"

# 45 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_downerTblOf = (fun pairs -> (((Base_dHashMap.v_Base_dHashMap_dinsertAll Base_dString.v_Hashable_uString) pairs) ((Base_dHashMap.v_Base_dHashMap_dfromList Base_dString.v_Hashable_uString) Base_dList.C_Base_dList_dList_Nil)))

# 48 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_downerOfTbl = (fun t name -> (match ((((Base_dHashMap.v_Base_dHashMap_dlookup Base_dString.v_Hashable_uString) Base_dString.v_Eq_uString) name) t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__0) -> dtb__0
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_ddatasInUnit = (fun ownerT u datas -> ((Base_dList.v_Base_dList_dfilter (fun d -> (((v_Vuna_dCompiler_dDriver_dSplitGen_downerOfTbl ownerT) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) = u))) datas))

# 56 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_ddefsInUnit = (fun ownerT u defs -> ((Base_dList.v_Base_dList_dfilter (fun d -> (((v_Vuna_dCompiler_dDriver_dSplitGen_downerOfTbl ownerT) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) = u))) defs))

# 69 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dknownUnit = (fun units u -> ((Base_dList.v_Base_dList_dmemName u) units))

# 72 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDepsKnown = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__1, dtb__2) -> (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dSplitGen_dknownUnit mc0) dtb__1)) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" [mc1; " references unknown unit `"; dtb__1; "`"])) else (if (Base_dBool.v_Base_dBool_dnot ((v_Vuna_dCompiler_dDriver_dSplitGen_dknownUnit mc0) mc1)) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["split unit `"; mc1; "` is not in the module order"])) else (((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDepsKnown mc0) mc1) dtb__2)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_ddepsInOrder = (fun ordered self deps -> ((Base_dList.v_Base_dList_dfilter (fun u -> (if (Base_dBool.v_Base_dBool_dnot (u = self)) then ((Base_dList.v_Base_dList_dmemName u) deps) else false))) ordered))

# 83 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dunitDepsOf = (fun ordered self deps -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDepsKnown ordered) self) deps)) (fun _u -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dDriver_dSplitGen_ddepsInOrder ordered) self) deps))))))

# 97 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_ddepsKnown = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__3, dtb__4) -> (if ((v_Vuna_dCompiler_dDriver_dSplitGen_dknownUnit mc0) dtb__3) then ((v_Vuna_dCompiler_dDriver_dSplitGen_ddepsKnown mc0) dtb__4) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dcachedUnitOk = (fun mc0 mc1 mc2 -> (match mc2 with
  | { Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = dtb__5; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = dtb__6; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = dtb__7 } -> (if (dtb__5 = (mc1 ^ ".ml")) then ((v_Vuna_dCompiler_dDriver_dSplitGen_ddepsKnown mc0) dtb__7) else false)
  | _ -> failwith "DT: impossible branch"
))

# 102 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dkeepCached = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8) -> (if (((v_Vuna_dCompiler_dDriver_dSplitGen_dcachedUnitOk mc0) mc1) dtb__8) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

# 109 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dcheckSplitAcyclic = (fun files -> (if (Vuna_dCompiler_dDriver_dSplit.v_Vuna_dCompiler_dDriver_dSplit_dsplitGraphAcyclic files) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "split dependency graph has a cycle (unit order is not a DAG)")))

# 128 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dmapToUnit = (fun pairs -> ((Base_dList.v_Base_dList_dmap (fun q -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dPair.v_Base_dPair_dfirstOf q); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dsecondOf q)) })) pairs))

# 134 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclName = (fun knownModules mname name -> (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then (if ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name)) knownModules) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["DT: internal: module "; mname; " declares `"; name; "` whose module prefix `"; (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName name); "` is not a known module (codegen requires Loader-resolved decls)"]))) else (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["DT: internal: module "; mname; " has an unresolved declaration name `"; name; "` (codegen requires Loader-resolved decls)"]))))

# 142 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclNames = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__9, dtb__10) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclName mc0) mc1) dtb__9)) (fun _u -> (((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclNames mc0) mc1) dtb__10)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDecls = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (match dtb__11 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__13; Base_dPair.f_Base_dPair_dPair_second = dtb__14 } -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclNames mc0) dtb__13) (Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames dtb__14))) (fun _u -> ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDecls mc0) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 158 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DSig (dtb__17, dtb__18, dtb__19, dtb__20) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__17 }, (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities dtb__16)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DExtern (dtb__21, dtb__22, dtb__23, dtb__24) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = false; Base_dPair.f_Base_dPair_dPair_second = dtb__21 }, (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities dtb__16)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DData (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__25 }, (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities dtb__16)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DRecord (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__34 }, (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities dtb__16)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_DTrait (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (Base_dList.C_Base_dList_dList__x58__x58_ ({ Base_dPair.f_Base_dPair_dPair_first = true; Base_dPair.f_Base_dPair_dPair_second = dtb__42 }, (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities dtb__16)))
  | _ -> (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities dtb__16)
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclKey = (fun mc0 -> (match mc0 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__47; Base_dPair.f_Base_dPair_dPair_second = dtb__48 } -> (if dtb__47 then ("type\t" ^ dtb__48) else ("value\t" ^ dtb__48))
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclName = (fun seen identity -> ((fun name -> ((fun key -> (if (name = "") then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "entry declaration has an empty name") else (if (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dcontainsDot name) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" ["DT: internal: entry declaration `"; name; "` must not contain a module prefix (codegen requires Loader-resolved decls)"])) else (if ((Base_dList.v_Base_dList_dmemName key) seen) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal (String.concat "" ["duplicate entry declaration `"; name; "`"])) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0)))))) (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclKey identity))) (Base_dPair.v_Base_dPair_dsecondOf identity)))

# 184 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__49, dtb__50) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclName mc0) dtb__49)) (fun _u -> ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclsGo (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclKey dtb__49), mc0))) dtb__50)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDecls = (fun decls -> ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclsGo Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities decls)))

# 195 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDefOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__51, dtb__52) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__51))) (fun _u -> ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDefOwners mc0) dtb__52)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDataOwners = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__53, dtb__54) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf mc0) dtb__53)) (fun _u -> ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDataOwners mc0) dtb__54)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dcheckResolvedModules = (fun meta modules entryDecls runtime datas -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDecls (meta).Vuna_dCompiler_dDriver_dOwner.f_Vuna_dCompiler_dDriver_dOwner_dSplitMeta_smKnownModules) modules)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDecls entryDecls)) (fun _u -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDefOwners meta) runtime)) (fun _u -> ((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDataOwners meta) datas))))))))

# 217 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripPrefix = (fun prefix path -> (if (prefix = "") then path else (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "/")) path) then (((dtp_substring (bi_strLength (prefix ^ "/"))) ((bi_strLength path) - (bi_strLength (prefix ^ "/")))) path) else path)))

# 223 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripRoots = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (if ((Base_dString.v_Base_dString_dstartsWith (dtb__55 ^ "/")) mc1) then ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripPrefix dtb__55) mc1) else ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripRoots dtb__56) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 228 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripDotSlash = (fun path -> (if ((Base_dString.v_Base_dString_dstartsWith "./") path) then (((dtp_substring 2) ((bi_strLength path) - 2)) path) else path))

# 232 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitLocPath = (fun roots contextDir path -> (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripDotSlash ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripPrefix contextDir) ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripRoots roots) path))))

# 238 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dnoUnitLookup = (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 241 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dnoUnitStore = (fun _u _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))

# 322 "Vuna/Compiler/Driver/SplitGen.vuna"
let rec v_Vuna_dCompiler_dDriver_dSplitGen_dsplitModuleFilesWith = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (match dtb__57 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__59; Base_dPair.f_Base_dPair_dPair_second = dtb__60 } -> ((fun unit -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__59)) (fun cached0 -> ((fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__61) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitModuleFilesWith mc0) mc1) mc2) dtb__58)) (fun tailR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match tailR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__62) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__62))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__63) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__61, dtb__63))))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun unitDatas -> ((fun unitDefs -> ((fun qc -> ((fun envU -> (match (((Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked envU) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) unitDefs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) unitDatas)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__65) -> (match ((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitPartsWith (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcNormPath) qc) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared envU)) dtb__65) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__66) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__66)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__67) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitModuleFilesWith mc0) mc1) mc2) dtb__58)) (fun tailR -> (match tailR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__69) -> (match (((v_Vuna_dCompiler_dDriver_dSplitGen_dunitDepsOf (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcOrdered) unit) (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps dtb__67)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__71) -> ((fun sf -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((mc1 dtb__59) sf)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (sf, dtb__69)))))))) { Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = (unit ^ ".ml"); Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = ((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText dtb__67) ^ "\n"); Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = dtb__71 })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvWithUnit unit) (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcEnv))) { Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = unit; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefUnitT; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataUnitT })) (((v_Vuna_dCompiler_dDriver_dSplitGen_ddefsInUnit (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefOwnerT) dtb__59) (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDefs))) (((v_Vuna_dCompiler_dDriver_dSplitGen_ddatasInUnit (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataOwnerT) dtb__59) (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDatas))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dDriver_dSplitGen_dkeepCached (mc2).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcOrdered) unit) cached0))))) (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule dtb__59))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))

# 362 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitMainFileWith = (fun lookup store ctx printResult -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (lookup "__entry__")) (fun cached0 -> ((fun cached -> (match cached with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__72)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun entryUnit -> ((fun entryDefs -> ((fun entryDatas -> ((fun qc -> ((fun envU -> (match (((Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked envU) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName) entryDefs)) ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) entryDatas)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__74) -> (match (Vuna_dCompiler_dLowering_dEntry.v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDefs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__75)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__76) -> (match dtb__76 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiagnostics_dCg.v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dBase_dDiagnostics_dCg.C_Vuna_dCompiler_dBase_dDiagnostics_dCg_dCgErr_NoMain))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> (match ((((Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitPartsWith (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcNormPath) qc) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared envU)) dtb__74) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__78) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__78)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__79) -> (match (((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dgenEntryHook (((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_dmkGenStWith (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcNormPath) qc) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared envU))) dtb__77) printResult) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__80) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__80)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__81) -> (match (((v_Vuna_dCompiler_dDriver_dSplitGen_dunitDepsOf (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcOrdered) entryUnit) ((Base_dList.v_Base_dList_dappend (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps dtb__79)) (Base_dPair.v_Base_dPair_dsecondOf dtb__81))) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__82) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__82)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__83) -> ((fun sf -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((store "__entry__") sf)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (sf)))))) { Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = "Main.ml"; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = (String.concat "" [v_Vuna_dCompiler_dDriver_dSplitGen_dmainInitPrologue; (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText dtb__79); (Base_dPair.v_Base_dPair_dfirstOf dtb__81)]); Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = dtb__83 })
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvWithUnit entryUnit) (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcEnv))) { Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcUnit = entryUnit; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDefs = (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefUnitT; Vuna_dCompiler_dCodegen_dDecl.f_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_qcDatas = (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataUnitT })) (((v_Vuna_dCompiler_dDriver_dSplitGen_ddatasInUnit (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataOwnerT) Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDatas))) (((v_Vuna_dCompiler_dDriver_dSplitGen_ddefsInUnit (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefOwnerT) Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner) (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDefs))) (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dDriver_dSplitGen_dkeepCached (ctx).f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcOrdered) (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner)) cached0)))))

# 294 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitWithOwnersWith = (fun lookup store env modules printResult allDatas allDefs defPairs dataPairs normPath runtimeText -> ((fun defUnitT -> ((fun dataUnitT -> ((fun ordered -> ((fun ctx -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitModuleFilesWith lookup) store) ctx) modules)) (fun moduleFilesR -> (match moduleFilesR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__84) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__84)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__85) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitMainFileWith lookup) store) ctx) printResult)) (fun mainFileR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match mainFileR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__87) -> ((fun files -> (match (v_Vuna_dCompiler_dDriver_dSplitGen_dcheckSplitAcyclic files) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__88) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__88))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__89) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (files))
  | _ -> failwith "DT: impossible branch"
)) (Base_dList.C_Base_dList_dList__x58__x58_ ({ Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitName = "Vuna_runtime.ml"; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitText = runtimeText; Vuna_dCompiler_dDriver_dSplit.f_Vuna_dCompiler_dDriver_dSplit_dSplitFile_splitDeps = Base_dList.C_Base_dList_dList_Nil }, ((Base_dList.v_Base_dList_dappend dtb__85) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__87, Base_dList.C_Base_dList_dList_Nil))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))) { f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcEnv = env; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDatas = allDatas; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcAllDefs = allDefs; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefOwnerT = (v_Vuna_dCompiler_dDriver_dSplitGen_downerTblOf defPairs); f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataOwnerT = (v_Vuna_dCompiler_dDriver_dSplitGen_downerTblOf dataPairs); f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDefUnitT = defUnitT; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcDataUnitT = dataUnitT; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcOrdered = ordered; f_Vuna_dCompiler_dDriver_dSplitGen_dSplitGenCtx_sgcNormPath = normPath })) ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList__x58__x58_ (Vuna_dCompiler_dCodegen_dAssembly.v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit, Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dmap (fun q -> (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule (Base_dPair.v_Base_dPair_dfirstOf q)))) modules))) (Base_dList.C_Base_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner), Base_dList.C_Base_dList_dList_Nil))))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dDriver_dSplitGen_dmapToUnit dataPairs)))) (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf (v_Vuna_dCompiler_dDriver_dSplitGen_dmapToUnit defPairs))))

# 283 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitProgramCheckedWith = (fun lookup store env modules entryDecls printResult runtimeDefs allDatas meta normPath runtimeText -> (match (((((v_Vuna_dCompiler_dDriver_dSplitGen_dcheckResolvedModules meta) modules) entryDecls) runtimeDefs) allDatas) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__90) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__90)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__91) -> (match ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs meta) runtimeDefs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__92) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__92)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__93) -> (match ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas meta) allDatas) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__94) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__94)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__95) -> (((((((((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitWithOwnersWith lookup) store) env) modules) printResult) allDatas) runtimeDefs) dtb__93) dtb__95) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dsplitProgramFilesWith = (fun lookup store env modules entryDecls printResult runtimeDefs allDatas meta normPath runtimeText -> (match (Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf env) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__96) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__96)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__97) -> (((((((((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitProgramCheckedWith lookup) store) env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) normPath) runtimeText)
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dgenerateDtSplitProgramWith = (fun lookup store modules entryDecls prog printResult roots contextDir extraDefLocs -> ((fun _u -> ((fun allDatas -> ((fun allDefs -> ((fun runtimeDefs -> ((fun env -> ((fun shared -> ((fun meta -> ((fun _u -> ((fun locRows -> ((fun locTbl -> ((fun _u -> ((fun runtimeText -> ((fun _u -> (((((((((((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitProgramFilesWith lookup) store) env) modules) entryDecls) printResult) runtimeDefs) allDatas) meta) ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitLocPath roots) contextDir)) runtimeText)) (if (dtp_debug_on 0) then (dtp_debug_line "cg-runtimeText-done") else 0))) ((((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith locTbl) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesFloat) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesTrace) (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedUsesObs))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-deflocs-done") else 0))) ((Vuna_dCompiler_dCodegen_dTerm.v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable ((v_Vuna_dCompiler_dDriver_dSplitGen_dsplitLocPath roots) contextDir)) locRows))) ((Base_dList.v_Base_dList_dappend (shared).Vuna_dCompiler_dIr_dModel.f_Vuna_dCompiler_dIr_dModel_dIrShared_irSharedDefLocs) extraDefLocs))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-splitmeta-done") else 0))) ((Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf modules) entryDecls))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared env))) (((Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)) allDefs) (v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule Vuna_dCompiler_dDriver_dOwner.v_Vuna_dCompiler_dDriver_dOwner_dentryOwner)))) (Vuna_dCompiler_dLowering_dProgram.v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs allDefs))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (Vuna_dCompiler_dLowering_dEnv.v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))) (if (dtp_debug_on 0) then (dtp_debug_line "cg-splitstart") else 0)))

# 246 "Vuna/Compiler/Driver/SplitGen.vuna"
let v_Vuna_dCompiler_dDriver_dSplitGen_dgenerateDtSplitProgram = (fun modules entryDecls prog printResult roots contextDir extraDefLocs -> (((((((((v_Vuna_dCompiler_dDriver_dSplitGen_dgenerateDtSplitProgramWith v_Vuna_dCompiler_dDriver_dSplitGen_dnoUnitLookup) v_Vuna_dCompiler_dDriver_dSplitGen_dnoUnitStore) modules) entryDecls) prog) printResult) roots) contextDir) extraDefLocs))
