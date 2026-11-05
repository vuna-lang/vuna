open Vuna_runtime
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound = 1073741824

let v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity = (fun name -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicVisible dtb__0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity dtb__0))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Base_dList_dCons ("Type", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("->", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("_", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) ((Base_dList.v_Base_dList_dappend Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeTypeNames) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((Base_dList.v_Base_dList_dmemName name) v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames))

let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun mc0 -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames = (fun d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__10, dtb__11, dtb__12) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> Base_dList.C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf = (fun decls -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames) decls))

let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun decls -> ((fun vals -> ((fun cts -> ((fun tys -> (Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (vals, cts, tys, (Base_dHashMap.v_Base_dHashMap_dofNames vals), (Base_dHashMap.v_Base_dHashMap_dofNames cts), (Base_dHashMap.v_Base_dHashMap_dofNames tys)))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))) (v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((fun prefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; prefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__23)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__22) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match dtb__24 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__27
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__22) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match dtb__29 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__32
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": "; dtb__22; " is not exported by "; dtb__23])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__21))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor = (fun modules label imports name -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> ((fun prefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; prefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__36)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__35) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__37) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match dtb__37 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__40
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": constructor "; dtb__35; " is not exported by "; dtb__36])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__34))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (mc0, dtb__42, mc2))) dtb__43) mc2)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__44, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__45))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47) -> (if (mc0 <= 0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__46, dtb__47)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__47))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> (if (n < 1) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) else (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (n - 1)) segs))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__48)) (fun es -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__49, dtb__50) -> (match dtb__50 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__49) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__51) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((match dtb__51 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__52, dtb__53, dtb__54, dtb__55) -> dtb__54
  | _ -> failwith "DT: impossible branch"
), sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__49) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((match dtb__56 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__57, dtb__58, dtb__59, dtb__60) -> dtb__59
  | _ -> failwith "DT: impossible branch"
), sp))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": "; dtb__49; " is not exported by "; dtb__48])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__49) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((match dtb__61 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__62, dtb__63, dtb__64, dtb__65) -> dtb__64
  | _ -> failwith "DT: impossible branch"
), sp))) dtb__50) sp)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": "; dtb__49; " is not exported by "; dtb__48])))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (n - 1)) segs))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) (n - 1)) sp)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((Base_dList.v_Base_dList_dmemName name) scope) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> dtb__69
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77) -> dtb__76
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> dtb__83
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unbound variable "; name; ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsuggest name) ((Base_dList.v_Base_dList_dappend (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__84, dtb__85, dtb__86, dtb__87, dtb__88, dtb__89) -> dtb__84
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> dtb__91
  | _ -> failwith "DT: impossible branch"
)) ((Base_dList.v_Base_dList_dappend (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100, dtb__101) -> dtb__98
  | _ -> failwith "DT: impossible branch"
)) scope)))); (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name)]))))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cpairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__102, dtb__103, dtb__104, dtb__105) -> dtb__104
  | _ -> failwith "DT: impossible branch"
)))))
)))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__106, dtb__107, dtb__108, dtb__109) -> dtb__108
  | _ -> failwith "DT: impossible branch"
)))))
))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor modules) label) imports) name) else (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115) -> dtb__114
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicName name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unknown constructor "; name; ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsuggest name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__117
  | _ -> failwith "DT: impossible branch"
))])))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "constructor") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__124
  | _ -> failwith "DT: impossible branch"
)))))
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid variable name "; name]))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((label ^ ": invalid top-level name _ (bare _ is reserved)"))) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid top-level name "; name]))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__126) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__126)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__127, dtb__128) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__127)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__127, dtb__128)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__127, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__129, dtb__130, dtb__131) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__130)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__129, (Base_dPair.v_Base_dPair_dfirstOf p), dtb__131)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__129, (Base_dPair.v_Base_dPair_dsecondOf p)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__132, dtb__133) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__132, dtb__133)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__134, dtb__135) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__134, dtb__135)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__136, dtb__137, dtb__138) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__136)) (fun name2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__137)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__138)), ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__139, dtb__140, dtb__141) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__139)) (fun name2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__140)) (fun parts -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (name2, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), dtb__141)), ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__143)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__144)), dtb__145))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__146)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__147)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__150)), ((Base_dList.v_Base_dList_dappend dtb__149) dtb__151)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (match dtb__152 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__154)) (fun pr -> (match pr with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__153)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, dtb__159) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dappend dtb__157) dtb__158), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__155)), dtb__159))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (match dtb__160 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (dtb__162) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dinterpMethodName, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__162))), (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__162, Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__162))), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__161)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__163) -> (if (dtb__163 = "") then ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__161) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__163, mc0)), ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks mc0) dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("++", mc0)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc1, (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__164, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), mc0))) dtb__165)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate = (fun sp parts -> (match ((v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks sp) parts) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr ("", sp))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__166, dtb__167) -> (((v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft sp) dtb__166) dtb__167)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (match dtb__168 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__170, dtb__171, dtb__172) -> (match dtb__170 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__173) -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__169)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__172)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__171, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", Base_dList.C_Base_dList_dList_Base_dList_dNil)), tail, dtb__172)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__172))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__174, dtb__175) -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__169)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__172)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__171, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__174, Base_dList.C_Base_dList_dList_Base_dList_dNil)), tail, dtb__172)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__172))))))
  | _ -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBindPattern)
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__176, dtb__177) -> (match dtb__169 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__176))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__169)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__177)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__176, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", Base_dList.C_Base_dList_dList_Base_dList_dNil)), tail, dtb__177)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__177))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix ctor -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) ctor))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__178)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (Base_dList.dtp_unpack name) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> (if (dtb__180 >= 65) then (dtb__180 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid dotted name "; name])))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (if ((Base_dList.v_Base_dList_dmemName dtb__182) scope) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__182, sp))) dtb__183) sp))) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (Base_dList.v_Base_dList_dlength (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__184) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__184))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((Base_dHashMap.v_Base_dHashMap_dmember dtb__182) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190) -> dtb__188
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__182), sp))) dtb__183) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__182) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__182, sp))) dtb__183) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__182) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; dtb__182; " is not imported"]))) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__182)) (fun n -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, sp))) dtb__183) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__191)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__194) mc6)) dtb__192)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__195)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__197, dtb__198) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((Base_dList.v_Base_dList_dappend dtb__198) mc6)) dtb__196)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__197, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match dtb__199 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__202)) (fun value2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__201)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, dtb__204) -> ((Base_dResult.v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__204) scope)) dtb__200) body)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, value2)), dtb__205)), dtb__206))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, b))))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__207) -> (match dtb__207 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> ((fun scope2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__209)) (fun values2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((Base_dList.v_Base_dList_dappend dtb__208) scope))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__210) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__210))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> (match dtb__211 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, dtb__214) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__214)) (fun value2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__212)) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, value2)), tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match expr with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__215, dtb__216) -> (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot dtb__215) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__215) dtb__216) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__215)) (fun n -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__216)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__217, dtb__218, dtb__219, dtb__220) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered infix operator "; dtb__217])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__221, dtb__222, dtb__223, dtb__224) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered backtick infix operator "; dtb__221])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__225, dtb__226) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered operator section ("; dtb__225; ")"])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__227, dtb__228, dtb__229) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered left operator section ("; dtb__227; ")"])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__230, dtb__231, dtb__232) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered right operator section ("; dtb__231; ")"])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__233, dtb__234) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__233)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__235, dtb__236) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__235, dtb__236))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__237, dtb__238) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__237, dtb__238))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__239, dtb__240, dtb__241) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__240)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate dtb__241) ps)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__242, dtb__243, dtb__244) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__242)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend dtb__242) scope)) dtb__243)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__242, b, dtb__244))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__245, dtb__246, dtb__247) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__245)) (fun fn2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__246)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__247))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__248, dtb__249, dtb__250, dtb__251, dtb__252, dtb__253) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__251)) (fun dom2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__248, Base_dList.C_Base_dList_dList_Base_dList_dNil))) scope)) dtb__252)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__248, dtb__249, dtb__250, dom2, cod2, dtb__253))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__254, dtb__255, dtb__256, dtb__257) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__256) dtb__254) dtb__255)) (fun r -> (match r with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__258, dtb__259, dtb__256, dtb__257))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__260, dtb__261) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__260)) (fun clauses2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (clauses2, dtb__261))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__262, dtb__263, dtb__264) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__262)) (fun scrut2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__263)) (fun alts2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__264))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__265, dtb__266, dtb__267, dtb__268) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__265)) (fun c2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__266)) (fun t2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__267)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__268))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__269, dtb__270, dtb__271) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__269)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__270, dtb__271))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__272, dtb__273, dtb__274) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__272)) (fun name2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__273)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (name2, fs, dtb__274))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__275, dtb__276, dtb__277) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__275)) (fun b -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__276)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__277))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__278, dtb__279) -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__278)) (fun e -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) e)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__280, dtb__281, dtb__282) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__280)) (fun v2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__281)) (fun t2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__282))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts = (fun fuel modules label prefix ns imports scope parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__283, dtb__284) -> (match dtb__283 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (dtb__285) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__285)) (fun e2 -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__284)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (e2)), ps))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__286) -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__284)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__286)), ps))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) parts)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, dtb__288) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__288)) (fun v -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, v)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__289, dtb__290, dtb__291, dtb__292, dtb__293, dtb__294) -> dtb__294
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (if (name = "Type") then true else (name = "->")) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> dtb__298
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> dtb__305
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (name)))) else (if (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitLastDot (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, dtb__308) -> ((fun typePrefix -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; typePrefix; " is not imported"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__309) -> ((Base_dResult.v_Base_dResult_dandThen ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__309)) (fun es -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__308) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__310) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match dtb__310 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__311, dtb__312, dtb__313, dtb__314) -> dtb__313
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__308) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__315) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match dtb__315 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__316, dtb__317, dtb__318, dtb__319) -> dtb__318
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": type "; dtb__308; " is not exported by "; dtb__309])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__307))
  | _ -> failwith "DT: impossible branch"
) else ((Base_dResult.v_Base_dResult_dandThen (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__320) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__320))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__321) -> (if ((Base_dHashMap.v_Base_dHashMap_dmember name) (match ns with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__322, dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> dtb__325
  | _ -> failwith "DT: impossible branch"
)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__321)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((match (Base_dPair.v_Base_dPair_dsecondOf p) with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__328, dtb__329, dtb__330, dtb__331) -> dtb__330
  | _ -> failwith "DT: impossible branch"
)))))
)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__332, dtb__333) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__332))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__334, dtb__335, dtb__336) -> (match dtb__334 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__337, dtb__338) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__337))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Vuna_dCompiler_dLoader_dModules.v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__339, dtb__340) -> (match dtb__339 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346, dtb__347) -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__344)) (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__340))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__340)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__348, dtb__349) -> (if ((Base_dList.v_Base_dList_dmemName dtb__348) dtb__349) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__348)) else (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName dtb__349))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors = (fun label decls -> (match (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames decls)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__350) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": duplicate constructor "; dtb__350; " (entry-file constructors share one global namespace)"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError = (fun label name -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unknown capability \""; name; "\" (known: "; ((Base_dString.v_Base_dString_djoin ", ") Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityNames); ")"]))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__351, dtb__352) -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability mc0) dtb__351) dtb__352)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability = (fun label name rest -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dparseCapability name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__353) -> ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) rest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError label) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin = (fun name -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__354) -> (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disEffectfulIntrinsic dtb__354)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed = (fun caps i -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability i) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__355) -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__355)) caps)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect = (fun caps name -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__356) -> ((v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed caps) dtb__356)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__357, dtb__358) -> (match dtb__357 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__359) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__359))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect dtb__358)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName = "Base.IO.runIO"

let v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor = (fun name -> (name = v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffExpr = (fun e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__360, dtb__361) -> (if (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin dtb__360) then true else (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__360)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__360)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__362, dtb__363) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__364, dtb__365) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__366, dtb__367, dtb__368) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__367)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__369, dtb__370, dtb__371) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__369), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__370), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__372, dtb__373, dtb__374, dtb__375) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__372), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__373), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__376, dtb__377) -> (v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__376)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__378, dtb__379, dtb__380) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__378), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__379), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__381, dtb__382, dtb__383, dtb__384) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__381), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__382), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__383), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__385, dtb__386, dtb__387) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__385)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__388, dtb__389, dtb__390) -> (v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__389)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__391, dtb__392, dtb__393) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__391), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__392), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398, dtb__399) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__397), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__398), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__400, dtb__401) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__400)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__402, dtb__403, dtb__404) -> (v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts dtb__403)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__405, dtb__406, dtb__407, dtb__408) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__406), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__407), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__409, dtb__410, dtb__411, dtb__412) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__410), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__411), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__413, dtb__414) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__415, dtb__416, dtb__417) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__416)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__418, dtb__419, dtb__420) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__418)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__421, dtb__422) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__421)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__423, dtb__424, dtb__425) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__423)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffExprs = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__426, dtb__427) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__426), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__427), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffBinds = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__428, dtb__429) -> (match dtb__428 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, dtb__431) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__431), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__429), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffAlts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__432, dtb__433) -> (match dtb__432 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__434, dtb__435) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__435), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__433), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__436, dtb__437) -> (match dtb__436 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__439), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__437), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__440, dtb__441) -> (match dtb__440 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (dtb__442) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__442), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts dtb__441), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__443) -> (v_Vuna_dCompiler_dLoader_dResolve_deffInterpParts dtb__441)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffFields = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__444, dtb__445) -> (match dtb__444 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__446, dtb__447) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__447), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__445), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDo = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__448, dtb__449) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__448)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__450, dtb__451, dtb__452) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__451)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDos = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__453, dtb__454) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDo dtb__453), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__454), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffDecl = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__455, dtb__456, dtb__457, dtb__458) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__457)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__459, dtb__460, dtb__461, dtb__462) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__463, dtb__464, dtb__465, dtb__466) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__465)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDecls = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__467, dtb__468) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecl dtb__467), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__468), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects = (fun pkg -> (if (pkg = "") then "ad-hoc file (no package)" else ("package " ^ pkg)))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins = (fun label pkg caps decls -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) caps)) (fun _u -> (match (v_Vuna_dCompiler_dLoader_dResolve_deffDecls decls) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__469) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__469) then (if ((Base_dList.v_Base_dList_dmemName "unsafe") caps) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": `runIO` executes IO outside main; requires capability `unsafe` in "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); " (declare [capabilities] effects = [\"unsafe\"])"])))) else (if ((v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect caps) dtb__469) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic dtb__469) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__470) -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability dtb__470) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__471) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": effectful builtin `"; dtb__469; "` requires capability `"; (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__471); "` in "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); " (declare [capabilities] effects = [\""; (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__471); "\"] or use Base.IO)"])))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__472, dtb__473) -> "do"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__474, dtb__475, dtb__476, dtb__477) -> "if"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__478, dtb__479, dtb__480) -> "case"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__481, dtb__482, dtb__483, dtb__484) -> "let"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__485, dtb__486, dtb__487) -> "lam"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__488, dtb__489) -> "str"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__490, dtb__491) -> "int"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__492, dtb__493, dtb__494) -> "app"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__495, dtb__496) -> ("var " ^ dtb__495)
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__497, dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__500)) (fun dom2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__501)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__497, dtb__498, dtb__499, dom2, cod2, dtb__502))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__503, dtb__504, dtb__505) -> (match dtb__503 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__506, dtb__507) -> (if (dtb__506 = "Type") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__503)) (fun fn2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__504)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__505)))))))))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__503)) (fun fn2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__504)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__505))))))))
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__508, dtb__509) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__508)) (fun n -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__509))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__510, dtb__511) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid type expression ("; (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty); ")"])))
)) ty)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__512) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__512) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__513) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unknown interface "; dtb__512])))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__514) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__515, dtb__516, dtb__517, dtb__518) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) dtb__515)) (fun c2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__516)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (c2, ty2, dtb__517, dtb__518))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__519, dtb__520, dtb__521) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__519)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__520)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__519, ty2, dtb__521))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__522, dtb__523, dtb__524) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__522)) (fun n -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__523)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (n, ty2, dtb__524))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__525, dtb__526, dtb__527, dtb__528) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__525)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__526)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__527)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__525, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__528))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__529, dtb__530, dtb__531, dtb__532) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__529)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__530)) (fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__531)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__529, ctx2, ty2, dtb__532))))))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((mc1 ^ ": instance body may only contain method signatures/definitions")))
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__533)) (fun dn -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__535)) (fun kind2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports)) dtb__536)) (fun ctors2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__537)) (fun ds2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dn, dtb__534, kind2, ctors2, ds2, dtb__538, dtb__539))))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__540, dtb__541, dtb__542, dtb__543, dtb__544, dtb__545) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__540)) (fun dn -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__542)) (fun fields2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__543)) (fun ds2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dn, dtb__541, fields2, ds2, dtb__544, dtb__545))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__546, dtb__547, dtb__548, dtb__549) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__546)) (fun tn -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__548)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (tn, dtb__547, ms, dtb__549))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__550, dtb__551, dtb__552, dtb__553) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__550)) (fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__551)) (fun head2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__552)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__553))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__554, dtb__555, dtb__556, dtb__557) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__554)) (fun n -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__555)) (fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__556)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (n, ctx2, ty2, dtb__557))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__558, dtb__559, dtb__560) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__558)) (fun n -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__559)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (n, ty2, dtb__560))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__561, dtb__562, dtb__563, dtb__564) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__561)) (fun n -> ((Base_dResult.v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__563)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (n, dtb__562, ty2, dtb__564))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__565, dtb__566, dtb__567, dtb__568) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__565)) (fun n -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__566)) (fun parts -> ((Base_dResult.v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((Base_dList.v_Base_dList_dconcatMap Base_dPair.v_Base_dPair_dsecondOf) parts)) dtb__567)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (n, ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) parts), b, dtb__568))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((Base_dResult.v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl modules) label) prefix) ns) imports)) decls))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun modules entryPkg entryCaps imports decls -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors "<entry>") decls)) (fun _u -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls)) imports) decls)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins "<entry>") entryPkg) entryCaps) d))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__569, dtb__570) -> (match dtb__569 with
  | Vuna_dCompiler_dLoader_dModules.C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__571, dtb__572, dtb__573, dtb__574, dtb__575, dtb__576, dtb__577, dtb__578) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc0) dtb__571) dtb__571) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf dtb__575)) ((Base_dList.v_Base_dList_dappend dtb__573) dtb__574)) dtb__575)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__571) dtb__572) dtb__577) d)))) (fun d1 -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_dresolveModules dtb__570)) (fun d2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((Base_dList.v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))
