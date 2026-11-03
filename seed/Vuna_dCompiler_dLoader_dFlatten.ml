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
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix -> (fun sp -> (fun name -> ((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export private name ") ((bi_concat name) " (names starting with _ are module-private)"))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if ((bi_eq_str dtb__2) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__5))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12) -> (if ((bi_eq_str dtb__8) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, (C_Base_dList_dList_Base_dList_dCons (dtb__8, C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__13, dtb__14, dtb__15, dtb__16) -> (if ((bi_eq_str dtb__13) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__15))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match dtb__17 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((bi_eq_str dtb__19) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__23, dtb__24, dtb__25) -> (if ((bi_eq_str dtb__23) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__26, dtb__27, dtb__28) -> (if ((bi_eq_str dtb__26) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun name -> (fun ctors -> (match ctors with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__29)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__29))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed name) dtb__30))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun d3961 -> (fun name -> (fun methods -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (if (((v_Base_dEq_deq d3961) dtb__33) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__33)) else (((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed d3961) name) dtb__32))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) methods))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match dtb__35 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (if dtb__38 then ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__36) else (match dtb__37 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42) -> (if ((bi_eq_str dtb__42) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__36))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__36)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__36)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (match dtb__43 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed name) dtb__48) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__51) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__51))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__44)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> (if ((bi_eq_str dtb__52) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__52)))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__44))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__57, dtb__58, dtb__59, dtb__60) -> (match (((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) name) dtb__59) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__61) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__61))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__44)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__44)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun prefix -> (fun dname -> (fun names -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__62) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dname) dtb__63) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("ctor", dtb__62, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__62), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dname))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dname) dtb__63))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun typeTarget -> (fun entries -> (match entries with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__64)) "ctor") then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__64)) typeTarget) else false) then (C_Base_dList_dList_Base_dList_dCons (dtb__64, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType typeTarget) dtb__65))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType typeTarget) dtb__65))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__66) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__66, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__66), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__66) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__69)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__72) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__72, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__72), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__72) (C_Base_dList_dList_Base_dList_dCons (dtb__72, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__77, dtb__78, dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__77) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__77, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__77), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__77) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__79)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> (if dtb__82 then C_Base_dList_dList_Base_dList_dNil else (match dtb__81 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__86) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__86, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__86), "")), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__87, dtb__88, dtb__89) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__87) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__87, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__87), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__90, dtb__91, dtb__92) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__90) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__90, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__90), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__93, dtb__94, dtb__95, dtb__96) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__93) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__93, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__93), "")), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> ((fun key -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__99) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__98) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__98) (((v_Vuna_dCompiler_dCommon_dtblInsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__97, mc2)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__97)) ((bi_concat "|") (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__97))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix -> (fun decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun dname -> (fun decls -> (match decls with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (match dtb__100 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> (if ((bi_eq_str dtb__102) dname) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dname) dtb__101))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dname) dtb__101)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules -> (fun decls -> (fun prefix -> (fun target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((fun m -> (if ((bi_eq_str m) prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__108) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__109) -> (match dtb__109 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__110, dtb__111, dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__108) dtb__114)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__107))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun modules -> (fun decls -> (fun prefix -> (fun tr -> (fun vr -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (match dtb__117 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__118, dtb__119, dtb__120) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__121) -> (match dtb__121 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__122, dtb__123, dtb__124) -> (if (if (if ((bi_eq_str dtb__118) "type") then ((bi_eq_str dtb__122) "ctor") else false) then ((bi_eq_str dtb__119) dtb__123) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget modules) decls) prefix) dtb__119) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) vr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) tr))))))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125) -> (match dtb__125 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__126, dtb__127, dtb__128) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__126, mc0, dtb__127, dtb__128)), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)), ""))))))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (match dtb__129 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__130), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e), (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e), (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)))))))) (v_Base_dPair_dsecondOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (match dtb__132 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__133, dtb__134) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__134), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__133)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) decls)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__135), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__136), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules -> (fun prefix -> (fun m -> (fun base -> (fun name -> (fun sp -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__137), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__137), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__137))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__138), "")), C_Base_dList_dList_Base_dList_dNil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__137), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__137), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__137))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__139), "")), C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (match dtb__140 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__145) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__145) dtb__141) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__140))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (match dtb__146 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)))) (v_Base_dPair_dfirstOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> (match dtb__148 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, dtb__150) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__149), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__149) dtb__150)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__151)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__147) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__147, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__152), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__152)) es)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": type ") ((bi_concat dtb__147) ((bi_concat " is not exported by ") dtb__151))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__146))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__153, dtb__154) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) dtb__153) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__154)) ((bi_concat ": module ") ((bi_concat dtb__153) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155) -> ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__155)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__156, dtb__157) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll modules) prefix) decls) imports) dtb__156) dtb__157)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__158, dtb__159) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare modules) prefix) decls) imports) dtb__158) dtb__159)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__160)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__160)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind e) dtb__161))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__162, dtb__163) -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__162)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__162)) else false) then ((bi_neq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__162)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport e) dtb__163))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e -> (fun e2 -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind e2)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)) (v_Vuna_dCompiler_dLoader_dModules_dentryParent e2)) else false)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) ((bi_concat "|") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) ((bi_concat "|") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) ((bi_concat "|") (v_Vuna_dCompiler_dLoader_dModules_dentryParent e))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> ((fun key -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__165) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__165) (((v_Vuna_dCompiler_dCommon_dtblInsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__164, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__164))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__167) dtb__168) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__167))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__168))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__169, dtb__170) -> ((bi_concat "bare:") dtb__169)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__171, dtb__172) -> ((bi_concat "typeall:") dtb__171)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__173, dtb__174) -> ((bi_concat "module:") dtb__173)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun key -> (fun rest -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (match dtb__175 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__177, dtb__178) -> (if ((bi_eq_str key) dtb__177) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf key) dtb__176))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)) rest)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (match dtb__179 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__181) dtb__180) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__180))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__183, dtb__184) -> dtb__183
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__185, dtb__186) -> dtb__185
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__187, dtb__188) -> dtb__187
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix -> (fun items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": duplicate export ") dtb__189))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__190)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__191)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend es) tail)))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun label -> (fun hdr -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (match dtb__192 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__193, dtb__194, dtb__195, dtb__196) -> (if ((bi_eq_str dtb__193) label) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__196)) ((bi_concat ": module name mismatch: source declares ") dtb__193)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) hdr)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun modules -> (fun prefix -> (fun hdr -> (fun imports -> (fun decls -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> (match dtb__197 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__198, dtb__199, dtb__200, dtb__201) -> (if dtb__199 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports modules) prefix) decls) imports) dtb__200)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates prefix) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports prefix) decls))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports prefix) decls)))
  | _ -> failwith "DT: impossible branch"
)) hdr))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name -> (fun stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons (name, stack))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun importerPkg -> (fun deps -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> (match dtb__203 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)) deps)))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__204, dtb__205) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((bi_neq_str (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c))) importerPkg))) dtb__204))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots -> (fun importerPkg -> (fun currentName -> (fun imports -> (if ((bi_eq_str currentName) "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg)))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel -> (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun imports -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule ((bi_sub fuel) 1)) roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__206))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll ((bi_sub fuel) 1)) roots) importerPkg) modules2) stack) dtb__207)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel -> (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun name -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__208) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) (dtp_readFile path))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__209, dtb__210, dtb__211) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__209)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__210)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__210)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll ((bi_sub fuel) 1)) roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (C_Base_dList_dList_Base_dList_dCons (name, stack))) ((v_Base_dList_dappend dtb__210) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__209) dtb__210) dtb__211)) (fun exports -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (name, (v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__210, implicit, dtb__211, exports, (v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root))), modules2))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx -> (fun entry -> (if (dtp_fileExists entry) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource entry) (dtp_readFile entry))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__212, dtb__213, dtb__214) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__213)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__213)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__213) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__214, dtb__213, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx)))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__215) -> (match dtb__215 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__216, dtb__217, dtb__218, dtb__219) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__212)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (entry))) entry))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx -> (fun names -> ((fun entryImports -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx)))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx -> (fun label -> (fun source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__220, dtb__221, dtb__222) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__221)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__221)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__221) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__222, dtb__221, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx)))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__223) -> (match dtb__223 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__224, dtb__225, dtb__226, dtb__227) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__220)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__230, dtb__231, dtb__232, dtb__233, dtb__234, dtb__235, dtb__236)), dtb__229))) dtb__230) dtb__230) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf dtb__234)) ((v_Base_dList_dappend dtb__232) dtb__233)) dtb__234)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__230) dtb__231) dtb__236) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__229)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__230, dtb__231, dtb__232, dtb__233, d1, dtb__235, dtb__236)), d2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__240) dtb__241) dtb__242) ((v_Base_dList_dappend dtb__238) dtb__239)) dtb__237)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__240)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))
  | _ -> failwith "DT: impossible branch"
))
