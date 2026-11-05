open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
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

let v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames = ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons ("Type", (C_Base_dList_dList_Base_dList_dCons ("->", (C_Base_dList_dList_Base_dList_dCons ("_", C_Base_dList_dList_Base_dList_dNil))))))) ((v_Base_dList_dappend v_Vuna_dCompiler_dIntrinsics_dpreludeTypeNames) v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames))

let v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName = (fun name -> ((v_Base_dList_dmemName name) v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames))

let v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint = (fun mc0 -> (if (mc0 = "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if (mc0 = "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if (mc0 = "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if (mc0 = "show") then " (trait method show; add `import Base.Show`)" else (if (mc0 = "eq") then " (trait method eq; add `import Base.Eq`)" else (if (mc0 = "neq") then " (trait method neq; add `import Base.Eq`)" else (if (mc0 = "lt") then " (trait method lt; add `import Base.Ord`)" else (if (mc0 = "le") then " (trait method le; add `import Base.Ord`)" else (if (mc0 = "gt") then " (trait method gt; add `import Base.Ord`)" else (if (mc0 = "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames = (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (C_Base_dList_dList_Base_dList_dCons (dtb__2, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__6, dtb__7, dtb__8, dtb__9) -> (C_Base_dList_dList_Base_dList_dCons (dtb__6, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__10, dtb__11, dtb__12) -> (C_Base_dList_dList_Base_dList_dCons (dtb__10, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__13, dtb__14, dtb__15, dtb__16) -> (C_Base_dList_dList_Base_dList_dCons (dtb__13, C_Base_dList_dList_Base_dList_dNil))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__17, dtb__18, dtb__19, dtb__20) -> C_Base_dList_dList_Base_dList_dNil
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf = (fun decls -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames) decls))

let v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf = (fun decls -> ((fun vals -> ((fun cts -> ((fun tys -> (C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (vals, cts, tys, (v_Base_dHashMap_dofNames vals), (v_Base_dHashMap_dofNames cts), (v_Base_dHashMap_dofNames tys)))) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf decls))) (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))) (v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf decls)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified = (fun modules label imports name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; prefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__23) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__23)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__22) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__24)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__22) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__25) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__25)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": "; dtb__22; " is not exported by "; dtb__23])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__21))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor = (fun modules label imports name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; prefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__28) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__28)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__27) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__29)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": constructor "; dtb__27; " is not exported by "; dtb__28])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__26))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> (((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (mc0, dtb__30, mc2))) dtb__31) mc2)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (if (mc0 <= 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (dtb__32, ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (mc0 - 1)) dtb__33))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddropSegs = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (if (mc0 <= 0) then (C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35)) else ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (mc0 - 1)) dtb__35))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath = (fun modules label imports segs n sp -> (if (n < 1) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) (v_Vuna_dCompiler_dCommon_djoinDots ((v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs (n - 1)) segs))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__36)) (fun es -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (match dtb__38 with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__37) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__39), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) dtb__37) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__40) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__40), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": "; dtb__37; " is not exported by "; dtb__36])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__37) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__41) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__41), sp))) dtb__38) sp)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": "; dtb__37; " is not exported by "; dtb__36])))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dResolve_ddropSegs (n - 1)) segs))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) segs) (n - 1)) sp)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal = (fun modules label prefix ns imports scope name -> (if ((v_Base_dList_dmemName name) scope) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsValueSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtorSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified modules) label) imports) name) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun cpairs -> (match cpairs with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsTypeSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unbound variable "; name; ((v_Vuna_dCompiler_dCommon_dsuggest name) ((v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dModules_dnsValues ns)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_dModules_dnsTypes ns)) scope)))); (v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint name)]))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) cpairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor = (fun modules label prefix ns imports name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedCtor modules) label) imports) name) else (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtorSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dIntrinsics_disIntrinsicName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unknown constructor "; name; ((v_Vuna_dCompiler_dCommon_dsuggest name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtors ns))])))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "constructor") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder = (fun label name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid variable name "; name]))) else (C_Base_dResult_dResult_Base_dResult_dOk (name))))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName = (fun label name -> (if (name = "_") then (C_Base_dResult_dResult_Base_dResult_dErr ((label ^ ": invalid top-level name _ (bare _ is reserved)"))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid top-level name "; name]))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName = (fun label prefix name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern = (fun fuel modules label prefix ns imports pat -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__42) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__42)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__43, dtb__44) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label) dtb__43)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__43, dtb__44)), (C_Base_dList_dList_Base_dList_dCons (dtb__43, C_Base_dList_dList_Base_dList_dNil))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__45, dtb__46, dtb__47) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtb__46)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__45, (v_Base_dPair_dfirstOf p), dtb__47)), (C_Base_dList_dList_Base_dList_dCons (dtb__45, (v_Base_dPair_dsecondOf p)))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__48, dtb__49) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__48, dtb__49)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__50, dtb__51) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__50, dtb__51)), C_Base_dList_dList_Base_dList_dNil))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__52, dtb__53, dtb__54) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__52)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__53)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__54)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__55, dtb__56, dtb__57) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__55)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__56)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__57)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__59)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__60)), dtb__61))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__62)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__63)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__66)), ((v_Base_dList_dappend dtb__65) dtb__67)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__70)) (fun pr -> (match pr with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__72, dtb__73) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__69)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__73) dtb__74), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__72, dtb__71)), dtb__75))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (match dtb__76 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__78, dtb__79, dtb__80) -> (match dtb__78 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__81) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__77)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__80)), (C_Base_dList_dList_Base_dList_dCons (dtb__79, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", C_Base_dList_dList_Base_dList_dNil)), tail, dtb__80)), C_Base_dList_dList_Base_dList_dNil)))), dtb__80))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__82, dtb__83) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__77)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__80)), (C_Base_dList_dList_Base_dList_dCons (dtb__79, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons (dtb__82, C_Base_dList_dList_Base_dList_dNil)), tail, dtb__80)), C_Base_dList_dList_Base_dList_dNil)))), dtb__80))))))
  | _ -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBindPattern)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__84, dtb__85) -> (match dtb__77 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__84))
  | _ -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__77)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", dtb__85)), (C_Base_dList_dList_Base_dList_dCons (dtb__84, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_do_ignore", C_Base_dList_dList_Base_dList_dNil)), tail, dtb__85)), C_Base_dList_dList_Base_dList_dNil)))), dtb__85))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0 C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_Vuna_dCompiler_dFrontend_dDiagnostics_dDoBlockNeedsStatement)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl = (fun label prefix ctor -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) ctor)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) ctor))))))

let v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar dtb__86)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (if (dtb__88 >= 65) then (dtb__88 <= 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr = (fun modules label prefix ns imports scope name sp -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid dotted name "; name])))
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if ((v_Base_dList_dmemName dtb__90) scope) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__90, sp))) dtb__91) sp))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath modules) label) imports) (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__92))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dHashMap_dmember dtb__90) (v_Vuna_dCompiler_dLoader_dModules_dnsValueSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__90), sp))) dtb__91) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName dtb__90) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__90, sp))) dtb__91) sp))) else (if (v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName dtb__90) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; dtb__90; " is not imported"]))) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__90)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, sp))) dtb__91) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc1) mc2) mc3) mc4) mc5) dtb__93)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__96) mc6)) dtb__94)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__98) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__97)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__100) mc6)) dtb__98)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, body2))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLet = (fun fuel modules label prefix ns imports scope rec_u binds body -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) scope) binds) body))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (match dtb__101 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__104)) (fun value2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__103)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq (fuel - 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend dtb__106) scope)) dtb__102) body)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, value2)), dtb__107)), dtb__108))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, b))))))
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet = (fun fuel modules label prefix ns imports scope binds body -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__109) -> (match dtb__109 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> ((fun scope2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (fuel - 1)) modules) label) prefix) ns) imports) scope2) dtb__111)) (fun values2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope2) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((v_Base_dList_dappend dtb__110) scope))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__112) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__112))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds modules) label) prefix) ns) imports) binds))))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__113 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__116)) (fun value2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__114)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, value2)), tail)))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr = (fun fuel modules label prefix ns imports scope expr -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__117, dtb__118) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__117) then ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr modules) label) prefix) ns) imports) scope) dtb__117) dtb__118) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal modules) label) prefix) ns) imports) scope) dtb__117)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__118)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__119, dtb__120, dtb__121, dtb__122) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered infix operator "; dtb__119])))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__123, dtb__124, dtb__125, dtb__126) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered backtick infix operator "; dtb__123])))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__127, dtb__128) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered operator section ("; dtb__127; ")"])))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__129, dtb__130, dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered left operator section ("; dtb__129; ")"])))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__132, dtb__133, dtb__134) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": DT: internal: unreordered right operator section ("; dtb__133; ")"])))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__135, dtb__136) -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__135)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__137, dtb__138) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__137, dtb__138))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__139, dtb__140) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__139, dtb__140))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__141, dtb__142, dtb__143) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder label)) dtb__141)) (fun _u -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend dtb__141) scope)) dtb__142)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__141, b, dtb__143))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__144, dtb__145, dtb__146) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__144)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) a))) dtb__145)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__146))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__149)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons (dtb__147, C_Base_dList_dList_Base_dList_dNil))) scope)) dtb__150)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__147, dtb__148, dom2, cod2, dtb__151))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__152, dtb__153, dtb__154, dtb__155) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLet (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__154) dtb__152) dtb__153)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__156, dtb__157, dtb__154, dtb__155))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__158, dtb__159) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__158)) (fun clauses2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (clauses2, dtb__159))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__160, dtb__161, dtb__162) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__160)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__161)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__162))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__163, dtb__164, dtb__165, dtb__166) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__163)) (fun c2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__164)) (fun t2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__165)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, e2, dtb__166))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__167, dtb__168, dtb__169) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__167)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__168, dtb__169))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__170, dtb__171, dtb__172) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) dtb__170)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__171)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (name2, fs, dtb__172))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__173, dtb__174, dtb__175) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__173)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue (fuel - 1)) modules) label) prefix) ns) imports) scope) dtv))) dtb__174)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__175))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__176, dtb__177) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_ddesugarDo dtb__176)) (fun e -> ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) e)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__178, dtb__179, dtb__180) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__178)) (fun v2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (fuel - 1)) modules) label) prefix) ns) imports) scope) dtb__179)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (v2, t2, dtb__180))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) dtb__182)) (fun v -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, v)))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName = (fun modules label prefix ns imports name -> (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsTypeSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (if (name = "Type") then true else (name = "->")) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName name) then (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsValueSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsCtorSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> ((fun typePrefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) typePrefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": module "; typePrefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__185)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__184) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__186)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) dtb__184) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__187)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": type "; dtb__184; " is not exported by "; dtb__185])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__183))
  | _ -> failwith "DT: impossible branch"
) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor modules) label) prefix) ns) imports) name) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__188) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__188))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__189) -> (if ((v_Base_dHashMap_dmember name) (v_Vuna_dCompiler_dLoader_dModules_dnsValueSet ns)) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__189)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))))

let v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__190, dtb__191) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__190))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__192, dtb__193, dtb__194) -> (match dtb__192 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__195, dtb__196) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName = (fun label prefix name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) name))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__197, dtb__198) -> (match dtb__197 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__199, dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> ((v_Base_dList_dappend ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__202)) (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__198))
  | _ -> (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames dtb__198)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__205, dtb__206) -> (if ((v_Base_dList_dmemName dtb__205) dtb__206) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__205)) else (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName dtb__206))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors = (fun label decls -> (match (v_Vuna_dCompiler_dLoader_dResolve_dfirstDupName (v_Vuna_dCompiler_dLoader_dResolve_dentryCtorNames decls)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__207) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": duplicate constructor "; dtb__207; " (entry-file constructors share one global namespace)"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError = (fun label name -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unknown capability \""; name; "\" (known: "; ((v_Base_dString_djoin ", ") v_Vuna_dCompiler_dIntrinsics_dcapabilityNames); ")"]))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__208, dtb__209) -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability mc0) dtb__208) dtb__209)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_dcheckOneCapability = (fun label name rest -> (match (v_Vuna_dCompiler_dIntrinsics_dparseCapability name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__210) -> ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) rest)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dResolve_dcapabilityError label) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin = (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__211) -> (v_Vuna_dCompiler_dIntrinsics_disEffectfulIntrinsic dtb__211)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed = (fun caps i -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability i) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__212) -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__212)) caps)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect = (fun caps name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__213) -> ((v_Vuna_dCompiler_dLoader_dResolve_deffectAllowed caps) dtb__213)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__214, dtb__215) -> (match dtb__214 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect dtb__215)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName = "Base.IO.runIO"

let v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor = (fun name -> (name = v_Vuna_dCompiler_dLoader_dResolve_dunsafeExecutorName))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__217, dtb__218) -> (if (if (v_Vuna_dCompiler_dLoader_dResolve_disEffectfulBuiltin dtb__217) then true else (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__217)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__217)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__219, dtb__220) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__221, dtb__222) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__223, dtb__224, dtb__225) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__224)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__226, dtb__227, dtb__228) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__226), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__227), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__229, dtb__230, dtb__231, dtb__232) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__229), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__230), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__233, dtb__234) -> (v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__233)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__235, dtb__236, dtb__237) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__235), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__236), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__238, dtb__239, dtb__240, dtb__241) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__238), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__239), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__240), C_Base_dList_dList_Base_dList_dNil)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__242, dtb__243, dtb__244) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__242)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__245, dtb__246, dtb__247) -> (v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__246)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__248, dtb__249, dtb__250) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__248), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__249), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__251, dtb__252, dtb__253, dtb__254, dtb__255) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__253), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__254), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__256, dtb__257) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__256)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__258, dtb__259, dtb__260, dtb__261) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__259), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__260), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__262, dtb__263, dtb__264, dtb__265) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__263), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__264), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__266, dtb__267) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__268, dtb__269, dtb__270) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__269)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__271, dtb__272, dtb__273) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__271)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__274, dtb__275) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__274)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__276, dtb__277, dtb__278) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__276)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffExprs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__279, dtb__280) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__279), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExprs dtb__280), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__281, dtb__282) -> (match dtb__281 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, dtb__284) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__284), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffBinds dtb__282), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__285, dtb__286) -> (match dtb__285 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, dtb__288) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__288), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffAlts dtb__286), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__289, dtb__290) -> (match dtb__289 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__291, dtb__292) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__292), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffLocalClauses dtb__290), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffFields = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__293, dtb__294) -> (match dtb__293 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__295, dtb__296) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__296), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffFields dtb__294), C_Base_dList_dList_Base_dList_dNil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDo = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__297, dtb__298) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__297)
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__299, dtb__300, dtb__301) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__300)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDos = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__302, dtb__303) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDo dtb__302), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDos dtb__303), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_deffDecl = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__304, dtb__305, dtb__306, dtb__307) -> (v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__306)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__308, dtb__309, dtb__310, dtb__311) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__312, dtb__313, dtb__314, dtb__315) -> (v_Vuna_dCompiler_dLoader_dResolve_deffExpr dtb__314)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
and v_Vuna_dCompiler_dLoader_dResolve_deffDecls = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__316, dtb__317) -> (v_Vuna_dCompiler_dLoader_dResolve_dfirstEffect (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecl dtb__316), (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dResolve_deffDecls dtb__317), C_Base_dList_dList_Base_dList_dNil)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects = (fun pkg -> (if (pkg = "") then "ad-hoc file (no package)" else ("package " ^ pkg)))

let v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins = (fun label pkg caps decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckCapabilities label) caps)) (fun _u -> (match (v_Vuna_dCompiler_dLoader_dResolve_deffDecls decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__318) -> (if (v_Vuna_dCompiler_dLoader_dResolve_disUnsafeExecutor dtb__318) then (if ((v_Base_dList_dmemName "unsafe") caps) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": `runIO` executes IO outside main; requires capability `unsafe` in "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); " (declare [capabilities] effects = [\"unsafe\"])"])))) else (if ((v_Vuna_dCompiler_dLoader_dResolve_dallowsEffect caps) dtb__318) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic dtb__318) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__319) -> (match (v_Vuna_dCompiler_dIntrinsics_dintrinsicCapability dtb__319) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__320) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": effectful builtin `"; dtb__318; "` requires capability `"; (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__320); "` in "; (v_Vuna_dCompiler_dLoader_dResolve_dpackageLabelForEffects pkg); " (declare [capabilities] effects = [\""; (v_Vuna_dCompiler_dIntrinsics_dcapabilityName dtb__320); "\"] or use Base.IO)"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dResolve_dtyShape = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__321, dtb__322) -> "do"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__323, dtb__324, dtb__325, dtb__326) -> "if"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__327, dtb__328, dtb__329) -> "case"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__330, dtb__331, dtb__332, dtb__333) -> "let"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__334, dtb__335, dtb__336) -> "lam"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__337, dtb__338) -> "str"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__339, dtb__340) -> "int"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__341, dtb__342, dtb__343) -> "app"
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__344, dtb__345) -> ("var " ^ dtb__344)
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr = (fun fuel modules label prefix ns imports ty -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: resolve fuel exhausted (internal: resolver made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__348)) (fun dom2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__349)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__346, dtb__347, dom2, cod2, dtb__350))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__351, dtb__352, dtb__353) -> (match dtb__351 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__354, dtb__355) -> (if (dtb__354 = "Type") then (C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__351)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__352)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__353)))))))))
  | _ -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtb__351)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun dtv -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr (fuel - 1)) modules) label) prefix) ns) imports) dtv))) dtb__352)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__353))))))))
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__356, dtb__357) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__356)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (n, dtb__357))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__358, dtb__359) -> (C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": invalid type expression ("; (v_Vuna_dCompiler_dLoader_dResolve_dtyShape ty); ")"])))
)) ty)))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr = (fun modules label prefix ns imports cx -> (match (v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf cx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__360) -> (match ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports) dtb__360) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__361) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [label; ": unknown interface "; dtb__360])))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__362) -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) cx)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__363, dtb__364, dtb__365, dtb__366) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl mc1) mc2) dtb__363)) (fun c2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__364)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (c2, ty2, dtb__365, dtb__366))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__367, dtb__368, dtb__369) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder mc1) dtb__367)) (fun _u -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__368)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__367, ty2, dtb__369))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__370, dtb__371, dtb__372) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName mc1) mc2) dtb__370)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__371)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (n, ty2, dtb__372))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__373, dtb__374, dtb__375, dtb__376) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__373)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4)) dtb__374)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__375)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__373, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__376))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__377, dtb__378, dtb__379, dtb__380) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName mc1) dtb__377)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr mc0) mc1) mc2) mc3) mc4) cx))) dtb__378)) (fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) mc0) mc1) mc2) mc3) mc4) dtb__379)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__377, ctx2, ty2, dtb__380))))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((mc1 ^ ": instance body may only contain method signatures/definitions")))
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl = (fun modules label prefix ns imports d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__381, dtb__382, dtb__383, dtb__384, dtb__385, dtb__386) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__381)) (fun dn -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__383)) (fun kind2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec modules) label) prefix) ns) imports)) dtb__384)) (fun ctors2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__385)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dn, dtb__382, kind2, ctors2, ds2, dtb__386))))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__387, dtb__388, dtb__389, dtb__390, dtb__391) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__387)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField modules) label) prefix) ns) imports)) dtb__389)) (fun fields2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName modules) label) prefix) ns) imports)) dtb__390)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dn, dtb__388, fields2, ds2, dtb__391))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__392, dtb__393, dtb__394, dtb__395) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName label) prefix) dtb__392)) (fun tn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod modules) label) prefix) ns) imports)) dtb__394)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (tn, dtb__393, ms, dtb__395))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__396, dtb__397, dtb__398, dtb__399) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__396)) (fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__397)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod modules) label) prefix) ns) imports)) dtb__398)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__399))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__400, dtb__401, dtb__402, dtb__403) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__400)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun cx -> ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr modules) label) prefix) ns) imports) cx))) dtb__401)) (fun ctx2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__402)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (n, ctx2, ty2, dtb__403))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__404, dtb__405, dtb__406) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__404)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__405)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (n, ty2, dtb__406))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__407, dtb__408, dtb__409, dtb__410) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__407)) (fun n -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) dtb__409)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (n, dtb__408, ty2, dtb__410))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__411, dtb__412, dtb__413, dtb__414) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName label) prefix) dtb__411)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports)) dtb__412)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound) modules) label) prefix) ns) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__413)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (n, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__414))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram = (fun modules label prefix ns imports decls -> ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl modules) label) prefix) ns) imports)) decls))

let v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry = (fun modules entryPkg entryCaps imports decls -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dResolve_dcheckEntryCtors "<entry>") decls)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram modules) "<entry>") "") (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls)) imports) decls)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins "<entry>") entryPkg) entryCaps) d))))))

let rec v_Vuna_dCompiler_dLoader_dResolve_dresolveModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__415, dtb__416) -> (match dtb__415 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__417, dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423, dtb__424) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram mc0) dtb__417) dtb__417) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf dtb__421)) ((v_Base_dList_dappend dtb__419) dtb__420)) dtb__421)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__417) dtb__418) dtb__423) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dResolve_dresolveModules dtb__416)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))
