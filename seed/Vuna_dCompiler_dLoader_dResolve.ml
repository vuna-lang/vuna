open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
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
open Vuna_dCompiler_dLoader_dFixity
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

let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun mc0 -> (if ((bi_eq_str mc0) "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if ((bi_eq_str mc0) "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if ((bi_eq_str mc0) "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if ((bi_eq_str mc0) "show") then " (trait method show; add `import Base.Show`)" else (if ((bi_eq_str mc0) "eq") then " (trait method eq; add `import Base.Eq`)" else (if ((bi_eq_str mc0) "neq") then " (trait method neq; add `import Base.Eq`)" else (if ((bi_eq_str mc0) "lt") then " (trait method lt; add `import Base.Ord`)" else (if ((bi_eq_str mc0) "le") then " (trait method le; add `import Base.Ord`)" else (if ((bi_eq_str mc0) "gt") then " (trait method gt; add `import Base.Ord`)" else (if ((bi_eq_str mc0) "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

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
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__40, dtb__41, dtb__42) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__41)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__40, (v_Base_dPair_dfirstOf p), dtb__42)), (C_Base_dList_dList_Base_dList_dCons (dtb__40, (v_Base_dPair_dsecondOf p)))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__43, dtb__44) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__43, dtb__44)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__45, dtb__46) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__45, dtb__46)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__47, dtb__48, dtb__49) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__47)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__48)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__49)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__50, dtb__51, dtb__52) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__50)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__51)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__52)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__54) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__54)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__55, dtb__56) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__55)), dtb__56))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__57)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__58)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__61)), ((v_Base_dList_dappend dtb__60) dtb__62)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__63, dtb__64) -> (match dtb__63 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__65, dtb__66) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__65)) (fun pr -> (match pr with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__68) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__64)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__69, dtb__70) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__68) dtb__69), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__67, dtb__66)), dtb__70))))))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__71, dtb__72) -> (match dtb__71 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__73, dtb__74, dtb__75) -> (match dtb__73 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__76) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__72)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__75)), (C_Base_dList_dList_Base_dList_dCons (dtb__74, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", C_Base_dList_dList_Base_dList_dNil)), tail, dtb__75)), C_Base_dList_dList_Base_dList_dNil)))), dtb__75))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__77, dtb__78) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__72)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__75)), (C_Base_dList_dList_Base_dList_dCons (dtb__74, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons (dtb__77, C_Base_dList_dList_Base_dList_dNil)), tail, dtb__75)), C_Base_dList_dList_Base_dList_dNil)))), dtb__75))))))
  | _ -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBindPattern)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__79, dtb__80) -> (match dtb__72 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__79))
  | _ -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__72)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__80)), (C_Base_dList_dList_Base_dList_dCons (dtb__79, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", C_Base_dList_dList_Base_dList_dNil)), tail, dtb__80)), C_Base_dList_dList_Base_dList_dNil)))), dtb__80))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label -> (fun prefix -> (fun ctor -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) ctor))))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__81)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__83, dtb__84) -> (if ((bi_ge_int dtb__83) 65) then ((bi_le_int dtb__83) 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid dotted name ") name))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (if ((v_Base_dList_dmemName dtb__85) scope) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__85, sp))) dtb__86) sp))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__87))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName dtb__85) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__85), sp))) dtb__86) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__85) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__85, sp))) dtb__86) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__85) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat dtb__85) " is not imported"))))) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__85)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, sp))) dtb__86) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__88)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__91) mc6)) dtb__89)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) dtb__92)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__95) mc6)) dtb__93)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun rec_u -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) binds) body)))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (match dtb__96 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__99)) (fun value2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__98)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, dtb__101) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend dtb__101) scope)) dtb__97) body)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, value2)), dtb__102)), dtb__103))))
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
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__104) -> (match dtb__104 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((fun scope2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope2) dtb__106)) (fun values2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((v_Base_dList_dappend dtb__105) scope))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__107) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__107))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__108, dtb__109) -> (match dtb__108 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__111)) (fun value2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__109)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, value2)), tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun scope -> (fun expr -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__112, dtb__113) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__112) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__112) dtb__113) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__112)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__113)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__114, dtb__115, dtb__116, dtb__117) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": DT: internal: unreordered infix operator ") dtb__114))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__118, dtb__119) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__118)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__120, dtb__121) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__120, dtb__121))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__122, dtb__123) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__122, dtb__123))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__124, dtb__125, dtb__126) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__124)) (fun _u -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend dtb__124) scope)) dtb__125)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__124, b, dtb__126))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__127, dtb__128, dtb__129) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__127)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) a))) dtb__128)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__129))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__132)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons (dtb__130, C_Base_dList_dList_Base_dList_dNil))) scope)) dtb__133)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__130, dtb__131, dom2, cod2, dtb__134))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__135, dtb__136, dtb__137, dtb__138) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__137) dtb__135) dtb__136)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__139, dtb__140, dtb__137, dtb__138))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__141, dtb__142) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__141)) (fun clauses2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (clauses2, dtb__142))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__143, dtb__144, dtb__145) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__143)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__144)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__145))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__146, dtb__147, dtb__148, dtb__149) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__146)) (fun c2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__147)) (fun t2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__148)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__149))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__150, dtb__151, dtb__152) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__150)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__151, dtb__152))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__153, dtb__154, dtb__155) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__153)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__154)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (name2, fs, dtb__155))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__156, dtb__157, dtb__158) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__156)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__157)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__158))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__159, dtb__160) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__159)) (fun e -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) e)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__161, dtb__162, dtb__163) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__161)) (fun v2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) scope) dtb__162)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__163))))))))
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__165) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__165)) (fun v -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, v)))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun name -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsTypes ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (if ((bi_eq_str name) "Type") then true else ((bi_eq_str name) "->")) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> ((fun typePrefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat typePrefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__168) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__168)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__167) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__169) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__169)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__167) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__170) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__170)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": type ") ((bi_concat dtb__167) ((bi_concat " is not exported by ") dtb__168))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__166))
  | _ -> failwith "DT: impossible branch"
) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__171) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__171))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__172) -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__172)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__175, dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> ((v_Base_dList_dappend ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__178)) (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__174))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__174)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (if ((v_Base_dList_dmemName dtb__181) dtb__182) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181)) else (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName dtb__182))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors = (fun label -> (fun decls -> (match (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames decls)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": duplicate constructor ") ((bi_concat dtb__183) " (entry-file constructors share one global namespace)")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError = (fun label -> (fun name -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown capability \"") ((bi_concat name) ((bi_concat "\" (known: ") ((bi_concat ((v_Base_dString_djoin ", ") v_Vuna_dCompiler_dIntrinsics_dcapabilityNames)) ")")))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability mc0) dtb__184) dtb__185)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability = (fun label -> (fun name -> (fun rest -> (match (v_Vuna_dCompiler_dIntrinsics_dparseCapability name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) rest)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError label) name)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin = (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> (v_Vuna_dCompiler_dIntrinsics_disEffectfulIntrinsic dtb__187)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed = (fun caps -> (fun i -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability i) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__188)) caps)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect = (fun caps -> (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189) -> ((v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed caps) dtb__189)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> (match dtb__190 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect dtb__191)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName = "Base.IO.runIO"

let v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor = (fun name -> ((bi_eq_str name) v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__193, dtb__194) -> (if (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin dtb__193) then true else (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__193)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__193)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__195, dtb__196) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__197, dtb__198) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__199, dtb__200, dtb__201) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__200)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__202, dtb__203, dtb__204) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__202), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__203), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__205, dtb__206, dtb__207, dtb__208) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__205), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__206), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__209, dtb__210) -> (v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__209)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__211, dtb__212, dtb__213) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__211), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__212), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__214, dtb__215, dtb__216, dtb__217) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__214), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__215), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__216), C_Base_dList_dList_Base_dList_dNil)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__218, dtb__219, dtb__220) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__218)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__221, dtb__222, dtb__223) -> (v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__222)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__224, dtb__225, dtb__226) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__224), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__225), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__227, dtb__228, dtb__229, dtb__230, dtb__231) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__229), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__230), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__232, dtb__233) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__232)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__234, dtb__235, dtb__236, dtb__237) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__235), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__236), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__238, dtb__239) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__238)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__240, dtb__241, dtb__242) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__240)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffExprs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__243, dtb__244) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__243), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__244), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__245, dtb__246) -> (match dtb__245 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, dtb__248) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__248), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__246), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> (match dtb__249 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__252), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__250), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__253, dtb__254) -> (match dtb__253 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__255, dtb__256) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__256), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__254), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffFields = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__257, dtb__258) -> (match dtb__257 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__259, dtb__260) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__260), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__258), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDo = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__261, dtb__262) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__261)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__263, dtb__264, dtb__265) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__264)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDos = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__266, dtb__267) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDo dtb__266), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__267), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffDecl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__268, dtb__269, dtb__270, dtb__271) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__270)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__272, dtb__273, dtb__274, dtb__275) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__276, dtb__277, dtb__278, dtb__279) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__278)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDecls = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__280, dtb__281) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecl dtb__280), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__281), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects = (fun pkg -> (if ((bi_eq_str pkg) "") then "ad-hoc file (no package)" else ((bi_concat "package ") pkg)))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins = (fun label -> (fun pkg -> (fun caps -> (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) caps)) (fun _u -> (match (v_Vuna_dCompiler_dLoader_dResolve_deffDecls decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__282) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__282) then (if ((v_Base_dList_dmemName "unsafe") caps) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": `runIO` executes IO outside main; requires capability `unsafe` in ") ((bi_concat (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg)) " (declare [capabilities] effects = [\"unsafe\"])")))))) else (if ((v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect caps) dtb__282) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic dtb__282) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__283) -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability dtb__283) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__284) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": effectful builtin `") ((bi_concat dtb__282) ((bi_concat "` requires capability `") ((bi_concat (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__284)) ((bi_concat "` in ") ((bi_concat (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg)) ((bi_concat " (declare [capabilities] effects = [\"") ((bi_concat (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__284)) "\"] or use Base.IO)")))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__285, dtb__286) -> "do"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__287, dtb__288, dtb__289, dtb__290) -> "if"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__291, dtb__292, dtb__293) -> "case"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__294, dtb__295, dtb__296, dtb__297) -> "let"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__298, dtb__299, dtb__300) -> "lam"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__301, dtb__302) -> "str"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__303, dtb__304) -> "int"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__305, dtb__306, dtb__307) -> "app"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__308, dtb__309) -> ((bi_concat "var ") dtb__308)
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel -> (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun ty -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__312)) (fun dom2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__313)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__310, dtb__311, dom2, cod2, dtb__314))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__315, dtb__316, dtb__317) -> (match dtb__315 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__318, dtb__319) -> (if ((bi_eq_str dtb__318) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__315)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__316)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__317)))))))))
  | _ -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtb__315)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr ((bi_sub fuel) 1)) modules) label) prefix) ns) imports) dtv))) dtb__316)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__317))))))))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__320, dtb__321) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__320)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__321))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__322, dtb__323) -> (C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid type expression (") ((bi_concat (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty)) ")")))))
)) ty)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__324, dtb__325, dtb__326, dtb__327) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) dtb__324)) (fun c2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__325)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (c2, ty2, dtb__326, dtb__327))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__328, dtb__329, dtb__330) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__328)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__329)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__328, ty2, dtb__330))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__331, dtb__332, dtb__333) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__331)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__332)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (n, ty2, dtb__333))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__334, dtb__335, dtb__336, dtb__337) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__334)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__335)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__336)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__334, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__337))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__338, dtb__339, dtb__340) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__338)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__339)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__338, ty2, dtb__340))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc1) ": instance body may only contain method signatures/definitions")))
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345, dtb__346) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__341)) (fun dn -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__343)) (fun kind2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports)) dtb__344)) (fun ctors2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__345)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dn, dtb__342, kind2, ctors2, ds2, dtb__346))))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__347, dtb__348, dtb__349, dtb__350, dtb__351) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__347)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__349)) (fun fields2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__350)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dn, dtb__348, fields2, ds2, dtb__351))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__352, dtb__353, dtb__354, dtb__355) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__352)) (fun tn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__354)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (tn, dtb__353, ms, dtb__355))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__356, dtb__357, dtb__358, dtb__359) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun cx -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx))) dtb__356)) (fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__357)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__358)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__359))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__360, dtb__361, dtb__362) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__360)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__361)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (n, ty2, dtb__362))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__363, dtb__364, dtb__365) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__363)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__364)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (n, ty2, dtb__365))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__366, dtb__367, dtb__368, dtb__369) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__366)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__367)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__368)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (n, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__369))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules -> (fun label -> (fun prefix -> (fun ns -> (fun imports -> (fun decls -> ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl modules) label) prefix) ns) imports)) decls)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun modules -> (fun entryPkg -> (fun entryCaps -> (fun imports -> (fun decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors "<entry>") decls)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls)) imports) decls)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins "<entry>") entryPkg) entryCaps) d))))))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun modules -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__370, dtb__371) -> (match dtb__370 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__372, dtb__373, dtb__374, dtb__375, dtb__376, dtb__377, dtb__378, dtb__379) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) dtb__372) dtb__372) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf dtb__376)) ((v_Base_dList_dappend dtb__374) dtb__375)) dtb__376)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__372) dtb__373) dtb__378) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_dresolveModules dtb__371)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) modules))
