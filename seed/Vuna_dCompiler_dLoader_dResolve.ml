open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
let v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound = 1073741824

let v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity = (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (if (v_Vuna_dCompiler_dIntrinsics_dintrinsicVisible dtb__0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dIntrinsics_dintrinsicArity dtb__0))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__1) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons ("Type", (C_Base_dList_dList_Base_dList_dCons ("->", (C_Base_dList_dList_Base_dList_dCons ("_", C_Base_dList_dList_Base_dList_dNil))))))) ((v_Base_dList_dappend v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames) v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames))

let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun name -> (if ((bi_eq_str name) "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if ((bi_eq_str name) "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if ((bi_eq_str name) "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if ((bi_eq_str name) "show") then " (trait method show; add `import Base.Show`)" else (if ((bi_eq_str name) "eq") then " (trait method eq; add `import Base.Eq`)" else (if ((bi_eq_str name) "neq") then " (trait method neq; add `import Base.Eq`)" else (if ((bi_eq_str name) "lt") then " (trait method lt; add `import Base.Ord`)" else (if ((bi_eq_str name) "le") then " (trait method le; add `import Base.Ord`)" else (if ((bi_eq_str name) "gt") then " (trait method gt; add `import Base.Ord`)" else (if ((bi_eq_str name) "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (C_Base_dList_dList_Base_dList_dCons (dtb__2, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__6, dtb__7, dtb__8) -> (C_Base_dList_dList_Base_dList_dCons (dtb__6, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__9, dtb__10, dtb__11) -> (C_Base_dList_dList_Base_dList_dCons (dtb__9, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__12, dtb__13, dtb__14, dtb__15) -> C_Base_dList_dList_Base_dList_dNil
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames) decls))

let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun decls -> (C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces ((v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls), (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls), (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, dtb__17) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__18) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__18)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__17) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__19)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__17) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__20)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__17) ((bi_concat " is not exported by ") dtb__18))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__16))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__23)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__22) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__24)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": constructor ") ((bi_concat dtb__22) ((bi_concat " is not exported by ") dtb__23))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__21))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (mc0, dtb__25, mc2))) dtb__26) mc2)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (if ((bi_le_int mc0) 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (dtb__27, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs ((bi_sub mc0) 1)) dtb__28))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((bi_le_int mc0) 0) then (C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs ((bi_sub mc0) 1)) dtb__30))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules -> (fun label -> (fun imports -> (fun segs -> (fun n -> (fun sp -> (if ((bi_lt_int n) 1) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (v_Vuna_dCompiler_dCommon_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs ((bi_sub n) 1)) segs))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__31)) (fun es -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (match dtb__33 with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__32) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__34) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__34), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__32) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__35) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__35), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__32) ((bi_concat " is not exported by ") dtb__31))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__32) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__36), sp))) dtb__33) sp)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__32) ((bi_concat " is not exported by ") dtb__31))))))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs ((bi_sub n) 1)) segs))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) ((bi_sub n) 1)) sp)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun name -> (if ((v_Base_dList_dmemName name) scope) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsTypes ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unbound variable ") ((bi_concat name) ((bi_concat ((v_Vuna_dCompiler_dCommon_dsuggest name) ((v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dModules_dnsTypes ns)) scope))))) (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name))))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cpairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor modules) label) imports) name) else (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dIntrinsics_disIntrinsicName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown constructor ") ((bi_concat name) ((v_Vuna_dCompiler_dCommon_dsuggest name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "constructor") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label -> (fun name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid variable name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label -> (fun name -> (if ((bi_eq_str name) "_") then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": invalid top-level name _ (bare _ is reserved)"))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid top-level name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun pat -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__37) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__37)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__38, dtb__39) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__38)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__38, dtb__39)), (C_Base_dList_dList_Base_dList_dCons (dtb__38, C_Base_dList_dList_Base_dList_dNil))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__40, dtb__41) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__40, dtb__41)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__42, dtb__43) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__42, dtb__43)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__44, dtb__45, dtb__46) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__44)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__45)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__46)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__47, dtb__48, dtb__49) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__47)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__48)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__49)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__50, dtb__51) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__51)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__50, dtb__52)), dtb__53))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__54)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__55)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__58)), ((v_Base_dList_dappend dtb__57) dtb__59)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (match dtb__60 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__62)) (fun pr -> (match pr with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__61)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__65) dtb__66), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__63)), dtb__67))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__70, dtb__71, dtb__72) -> (match dtb__70 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__73) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__69)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__72)), (C_Base_dList_dList_Base_dList_dCons (dtb__71, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", C_Base_dList_dList_Base_dList_dNil)), tail, dtb__72)), C_Base_dList_dList_Base_dList_dNil)))), dtb__72))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__74, dtb__75) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__69)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__72)), (C_Base_dList_dList_Base_dList_dCons (dtb__71, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons (dtb__74, C_Base_dList_dList_Base_dList_dNil)), tail, dtb__72)), C_Base_dList_dList_Base_dList_dNil)))), dtb__72))))))
  | _ -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBindPattern)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__76, dtb__77) -> (match dtb__69 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__76))
  | _ -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__69)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__77)), (C_Base_dList_dList_Base_dList_dCons (dtb__76, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", C_Base_dList_dList_Base_dList_dNil)), tail, dtb__77)), C_Base_dList_dList_Base_dList_dNil)))), dtb__77))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label -> (fun prefix -> (fun ctor -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) ctor))))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__78)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (if ((bi_ge_int dtb__80) 65) then ((bi_le_int dtb__80) 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid dotted name ") name))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (if ((v_Base_dList_dmemName dtb__82) scope) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__82, sp))) dtb__83) sp))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__84) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__84))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName dtb__82) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__82), sp))) dtb__83) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__82) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__82, sp))) dtb__83) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__82) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat dtb__82) " is not imported"))))) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__82)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, sp))) dtb__83) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__85, dtb__86) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__85)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__88) mc6)) dtb__86)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__89)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__92) mc6)) dtb__90)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun rec_u -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) binds) body)))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__96)) (fun value2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__95)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend dtb__98) scope)) dtb__94) body)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, value2)), dtb__99)), dtb__100))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, b))))))
  | _ -> failwith "DT: impossible branch"
)) binds)))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__101) -> (match dtb__101 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> ((fun scope2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope2) dtb__103)) (fun values2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((v_Base_dList_dappend dtb__102) scope))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__104) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__104))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__105 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__108)) (fun value2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__106)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, value2)), tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__109, dtb__110) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__109) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__109) dtb__110) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__109)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__110)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__111, dtb__112) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__111, dtb__112))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__113, dtb__114) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__113, dtb__114))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__115, dtb__116, dtb__117) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__115)) (fun _u -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend dtb__115) scope)) dtb__116)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__115, b, dtb__117))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__118, dtb__119, dtb__120) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__118)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) a))) dtb__119)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__120))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__123)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons (dtb__121, C_Base_dList_dList_Base_dList_dNil))) scope)) dtb__124)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__121, dtb__122, dom2, cod2, dtb__125))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__126, dtb__127, dtb__128, dtb__129) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__128) dtb__126) dtb__127)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__130, dtb__131, dtb__128, dtb__129))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__132, dtb__133) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__132)) (fun clauses2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (clauses2, dtb__133))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__134, dtb__135, dtb__136) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__134)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__135)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__136))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__137, dtb__138, dtb__139, dtb__140) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__137)) (fun c2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__138)) (fun t2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__139)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__140))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__141, dtb__142, dtb__143) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__141)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__142, dtb__143))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__144, dtb__145, dtb__146) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__144)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__145)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (name2, fs, dtb__146))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__147, dtb__148, dtb__149) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__147)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__148)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__149))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__150, dtb__151) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__150)) (fun e -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) e)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__152, dtb__153, dtb__154) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__152)) (fun v2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__153)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__154))))))))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__155, dtb__156) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__156)) (fun v -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__155, v)))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun name -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsTypes ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (if ((bi_eq_str name) "Type") then true else ((bi_eq_str name) "->")) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__157, dtb__158) -> ((fun typePrefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat typePrefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__159)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__158) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__160)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__158) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__161)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": type ") ((bi_concat dtb__158) ((bi_concat " is not exported by ") dtb__159))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__157))
  | _ -> failwith "DT: impossible branch"
) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__162) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__162))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__163) -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__163)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__164 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__166, dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> ((v_Base_dList_dappend ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__169)) (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__165))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__165)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (if ((v_Base_dList_dmemName dtb__172) dtb__173) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172)) else (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName dtb__173))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors = (fun label -> (fun decls -> (match (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames decls)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__174) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": duplicate constructor ") ((bi_concat dtb__174) " (entry-file constructors share one global namespace)")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError = (fun label -> (fun name -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown capability \"") ((bi_concat name) "\" (known: console, fs, process, env, clock)")))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities = (fun label -> (fun caps -> (match caps with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability label) dtb__175) dtb__176)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability = (fun label -> (fun name -> (fun rest -> (match (v_Vuna_dCompiler_dIntrinsics_dparseCapability name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__177) -> ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) rest)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError label) name)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin = (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__178) -> (v_Vuna_dCompiler_dIntrinsics_disEffectfulIntrinsic dtb__178)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed = (fun caps -> (fun i -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability i) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179) -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__179)) caps)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect = (fun caps -> (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__180) -> ((v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed caps) dtb__180)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__181 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect dtb__182)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__184, dtb__185) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin dtb__184) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__184)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__186, dtb__187) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__188, dtb__189) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__190, dtb__191, dtb__192) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__191)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__193, dtb__194, dtb__195) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__193), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__194), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__196, dtb__197, dtb__198, dtb__199) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__196), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__197), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__200, dtb__201) -> (v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__200)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__202, dtb__203, dtb__204) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__202), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__203), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__205, dtb__206, dtb__207, dtb__208) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__205), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__206), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__207), C_Base_dList_dList_Base_dList_dNil)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__209, dtb__210, dtb__211) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__209)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__212, dtb__213, dtb__214) -> (v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__213)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__215, dtb__216, dtb__217) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__215), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__216), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__218, dtb__219, dtb__220, dtb__221, dtb__222) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__220), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__221), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__223, dtb__224) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__223)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__225, dtb__226, dtb__227) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__225)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffExprs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__228), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__229), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__230, dtb__231) -> (match dtb__230 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__233), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__231), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> (match dtb__234 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__236, dtb__237) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__237), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__235), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (match dtb__238 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__241) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__241), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__239), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffFields = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__242, dtb__243) -> (match dtb__242 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__244, dtb__245) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__245), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__243), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDo = (fun s -> (match s with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__246, dtb__247, dtb__248) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__247)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__249, dtb__250) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__249)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDos = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__251, dtb__252) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDo dtb__251), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__252), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffDecl = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__253, dtb__254, dtb__255, dtb__256) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__255)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__257, dtb__258, dtb__259, dtb__260) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__261, dtb__262, dtb__263, dtb__264) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__263)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDecls = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__265, dtb__266) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecl dtb__265), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__266), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects = (fun pkg -> (if ((bi_eq_str pkg) "") then "ad-hoc file (no package)" else ((bi_concat "package ") pkg)))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins = (fun label -> (fun pkg -> (fun caps -> (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) caps)) (fun _u -> (match (v_Vuna_dCompiler_dLoader_dResolve_deffDecls decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__267) -> (if ((v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect caps) dtb__267) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic dtb__267) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__268) -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability dtb__268) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__269) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": effectful builtin `") ((bi_concat dtb__267) ((bi_concat "` requires capability `") ((bi_concat (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__269)) ((bi_concat "` in ") ((bi_concat (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg)) ((bi_concat " (declare [capabilities] effects = [\"") ((bi_concat (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__269)) "\"] or use Base.IO)")))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__270, dtb__271) -> ((bi_concat "var ") dtb__270)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__272, dtb__273, dtb__274) -> "app"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__275, dtb__276) -> "int"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__277, dtb__278) -> "str"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__279, dtb__280, dtb__281) -> "lam"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__282, dtb__283, dtb__284, dtb__285) -> "let"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__286, dtb__287, dtb__288) -> "case"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__289, dtb__290, dtb__291, dtb__292) -> "if"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__293, dtb__294) -> "do"
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun ty -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__295, dtb__296, dtb__297, dtb__298, dtb__299) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__297)) (fun dom2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__298)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__295, dtb__296, dom2, cod2, dtb__299))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__300, dtb__301, dtb__302) -> (match dtb__300 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__303, dtb__304) -> (if ((bi_eq_str dtb__303) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__300)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__301)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__302)))))))))
  | _ -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__300)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__301)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__302))))))))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__305, dtb__306) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__305)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__306))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__307, dtb__308) -> (C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid type expression (") ((bi_concat (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)) ")")))))
)) ty)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__309, dtb__310, dtb__311, dtb__312) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) dtb__309)) (fun c2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__310)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (c2, ty2, dtb__311, dtb__312))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__313, dtb__314, dtb__315) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__313)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__314)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__313, ty2, dtb__315))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__316, dtb__317, dtb__318) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__316)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__317)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (n, ty2, dtb__318))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__319, dtb__320, dtb__321) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) dtb__319)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__320)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__319, ty2, dtb__321))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__322, dtb__323, dtb__324, dtb__325) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) dtb__322)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__323)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__324)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__322, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__325))))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": instance body may only contain method signatures/definitions")))
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__326, dtb__327, dtb__328, dtb__329, dtb__330, dtb__331) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__326)) (fun dn -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__328)) (fun kind2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports)) dtb__329)) (fun ctors2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__330)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dn, dtb__327, kind2, ctors2, ds2, dtb__331))))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__332)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__334)) (fun fields2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__335)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dn, dtb__333, fields2, ds2, dtb__336))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__337, dtb__338, dtb__339, dtb__340) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__337)) (fun tn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__339)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (tn, dtb__338, ms, dtb__340))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__341, dtb__342, dtb__343, dtb__344) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun cx -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx))) dtb__341)) (fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__342)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__343)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__344))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__345, dtb__346, dtb__347) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__345)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__346)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (n, ty2, dtb__347))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__348, dtb__349, dtb__350) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__348)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__349)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (n, ty2, dtb__350))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__351, dtb__352, dtb__353, dtb__354) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__351)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__352)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__353)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (n, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__354))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun decls -> ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl modules) label) prefix) ns) imports)) decls)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun modules -> (fun entryPkg -> (fun entryCaps -> (fun imports -> (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors "<entry>") decls)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls)) imports) decls)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins "<entry>") entryPkg) entryCaps) d))))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun modules -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__355, dtb__356) -> (match dtb__355 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__357, dtb__358, dtb__359, dtb__360, dtb__361, dtb__362, dtb__363) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) dtb__357) dtb__357) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf dtb__361)) ((v_Base_dList_dappend dtb__359) dtb__360)) dtb__361)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__357) dtb__358) dtb__363) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_dresolveModules dtb__356)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) modules))
