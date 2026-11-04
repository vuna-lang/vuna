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
open Vuna_dCompiler_dLoader_dResolve
let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun path -> (fun src -> (match ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) src) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__0) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat path) ((bi_concat ": ") dtb__0))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules -> (fun imports -> ((v_Base_dList_dconcatMap (fun imp -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2) -> (v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf dtb__2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))) imports)))

let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix -> (fun sp -> (fun name -> ((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export private name ") ((bi_concat name) " (names starting with _ are module-private)"))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> (match dtb__3 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9, dtb__10) -> (if ((bi_eq_str dtb__5) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__5, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__8))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__4))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15) -> (if ((bi_eq_str dtb__11) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__11, (C_Base_dList_dList_Base_dList_dCons (dtb__11, C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__4))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__16, dtb__17, dtb__18, dtb__19) -> (if ((bi_eq_str dtb__16) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__18))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__4))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__4)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match dtb__20 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__22, dtb__23, dtb__24, dtb__25) -> (if ((bi_eq_str dtb__22) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__21))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__26, dtb__27, dtb__28) -> (if ((bi_eq_str dtb__26) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__21))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__29, dtb__30, dtb__31) -> (if ((bi_eq_str dtb__29) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__21))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__21)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__32)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__32))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__33))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__34, dtb__35) -> (match dtb__34 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__36, dtb__37, dtb__38) -> (if ((bi_eq_str dtb__36) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__35))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (match dtb__39 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__44) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__47) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__47))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (if ((bi_eq_str dtb__48) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__48, dtb__48)))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__40))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__53, dtb__54, dtb__55, dtb__56) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__55) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__57) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__53, dtb__57))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__40)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__40)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__58) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__59) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("ctor", dtb__58, ((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__58), ((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__59))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__60)) "ctor") then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__60)) mc0) else false) then (C_Base_dList_dList_Base_dList_dCons (dtb__60, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__61))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__61))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__62, dtb__63, dtb__64, dtb__65, dtb__66, dtb__67) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__62) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__62, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__62), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__62) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__65)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__68) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__68, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__68), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__68) (C_Base_dList_dList_Base_dList_dCons (dtb__68, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__73, dtb__74, dtb__75, dtb__76) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__73) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__73, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__73), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__73) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__75)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__77, dtb__78, dtb__79, dtb__80) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__81, dtb__82, dtb__83) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__81) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__81, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__81), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__84, dtb__85, dtb__86) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__84) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__84, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__84), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__87, dtb__88, dtb__89, dtb__90) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__87) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__87, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__87), "")), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__91, dtb__92) -> ((fun key -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__92) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__92) (((v_Vuna_dCompiler_dCommon_dtblInsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__91, mc2)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__91)) ((bi_concat "|") (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__91))))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix -> (fun decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if ((bi_eq_str dtb__96) mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__95))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__95)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules -> (fun decls -> (fun prefix -> (fun target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> ((fun m -> (if ((bi_eq_str m) prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__102) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103) -> (match dtb__103 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__102) dtb__108)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__101))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> (match dtb__112 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__113, dtb__114, dtb__115) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__116) -> (match dtb__116 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__117, dtb__118, dtb__119) -> (if (if (if ((bi_eq_str dtb__113) "type") then ((bi_eq_str dtb__117) "ctor") else false) then ((bi_eq_str dtb__114) dtb__118) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__114) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__120) -> (match dtb__120 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__121, dtb__122, dtb__123) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__121, mc0, dtb__122, dtb__123)), C_Base_dList_dList_Base_dList_dNil))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__124) -> (match dtb__124 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__125), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e), (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e), (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)))))))) (v_Base_dPair_dsecondOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__127) -> (match dtb__127 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__129), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__128)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) decls)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__130), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules -> (fun prefix -> (fun m -> (fun base -> (fun name -> (fun sp -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__131), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__131), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__131))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__132), "")), C_Base_dList_dList_Base_dList_dNil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__131), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__131), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__131))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__133) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__133), "")), C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> (match dtb__134 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__139) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__139) dtb__135) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__134))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (match dtb__140 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)))) (v_Base_dPair_dfirstOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142) -> (match dtb__142 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__143), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__143) dtb__144)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__145) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__145)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__141) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__141, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__146), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__146)) es)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": type ") ((bi_concat dtb__141) ((bi_concat " is not exported by ") dtb__145))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__140))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__147, dtb__148) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__147) dtb__148)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__149, dtb__150) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__149) dtb__150)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__151, dtb__152) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix mc3) dtb__151) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc1) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__152)) ((bi_concat ": module ") ((bi_concat dtb__151) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__153)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind mc0)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__154)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic mc0)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__154)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind mc0) dtb__155))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind mc0)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__156)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic mc0)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__156)) else false) then ((bi_neq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget mc0)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__156)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport mc0) dtb__157))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e -> (fun e2 -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind e2)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)) (v_Vuna_dCompiler_dLoader_dModules_dentryParent e2)) else false)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) ((bi_concat "|") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) ((bi_concat "|") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) ((bi_concat "|") (v_Vuna_dCompiler_dLoader_dModules_dentryParent e))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> ((fun key -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__159) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__159) (((v_Vuna_dCompiler_dCommon_dtblInsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__158, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__158))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__161) dtb__162) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__161))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__162))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__163, dtb__164) -> ((bi_concat "module:") dtb__163)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__165, dtb__166) -> ((bi_concat "typeall:") dtb__165)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__167, dtb__168) -> ((bi_concat "bare:") dtb__167)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (match dtb__169 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__171, dtb__172) -> (if ((bi_eq_str mc0) dtb__171) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf mc0) dtb__170))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__175) dtb__174) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__174))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__177, dtb__178) -> dtb__177
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__179, dtb__180) -> dtb__179
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__181, dtb__182) -> dtb__181
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix -> (fun items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__183) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": duplicate export ") dtb__183))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__184)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__185)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend es) tail)))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__186) -> (match dtb__186 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__187, dtb__188, dtb__189, dtb__190) -> (if ((bi_eq_str dtb__187) mc0) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__190)) ((bi_concat ": module name mismatch: source declares ") dtb__187)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> (match dtb__191 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__192, dtb__193, dtb__194, dtb__195) -> (if dtb__193 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports mc0) mc1) mc4) mc3) dtb__194)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc1) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name -> (fun stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons (name, stack))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (match dtb__197 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)))) mc1))) ")"))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((bi_neq_str (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c))) importerPkg))) dtb__198))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots -> (fun importerPkg -> (fun currentName -> (fun imports -> (if ((bi_eq_str currentName) "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg)))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel -> (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun imports -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule ((bi_sub fuel) 1)) roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__200))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll ((bi_sub fuel) 1)) roots) importerPkg) modules2) stack) dtb__201)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel -> (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun name -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__202) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path)))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__203, dtb__204, dtb__205, dtb__206) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__203)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__204)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__204)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll ((bi_sub fuel) 1)) roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (C_Base_dList_dList_Base_dList_dCons (name, stack))) ((v_Base_dList_dappend dtb__204) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__203) dtb__204) dtb__206)) (fun exports -> ((fun visible -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (name, (v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__204, implicit, dtb__206, exports, (v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root), visible)), modules2))))) ((v_Base_dList_dappend dtb__205) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules2) ((v_Base_dList_dappend dtb__204) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx -> (fun entry -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) entry)) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath entry) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) entry)))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__207, dtb__208, dtb__209, dtb__210) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__208)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__208)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__208) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__210, dtb__208, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__209))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__211) -> (match dtb__211 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__212, dtb__213, dtb__214, dtb__215) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__207)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (entry))) entry))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx -> (fun names -> ((fun entryImports -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), C_Base_dList_dList_Base_dList_dNil))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx -> (fun label -> (fun source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__216, dtb__217, dtb__218, dtb__219) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__217)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__217)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__217) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__219, dtb__217, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__218))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> (match dtb__220 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__221, dtb__222, dtb__223, dtb__224) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__216)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun ctx -> (fun label -> (fun source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__225, dtb__226, dtb__227, dtb__228) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__229) -> (match dtb__229 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__230, dtb__231, dtb__232, dtb__233) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__230) dtb__226)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__230) dtb__226)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__226) implicit))) (fun modules -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules) dtb__230) dtb__225) dtb__226) dtb__228)) (fun exports -> ((fun visible -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, dtb__226, implicit, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__230, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), dtb__226, implicit, dtb__228, exports, (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), visible)), modules)), (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), C_Base_dList_dList_Base_dList_dNil))))) ((v_Base_dList_dappend dtb__227) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__226) implicit))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) label) source)
  | _ -> failwith "DT: impossible branch"
)) dtb__225)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> (match dtb__234 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241, dtb__242, dtb__243) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (v_Vuna_dCompiler_dLoader_dFixity_dtableOf dtb__243)) dtb__240)) (fun decls2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__236, dtb__237, dtb__238, dtb__239, decls2, dtb__241, dtb__242, dtb__243)), dtb__235))) dtb__236) dtb__236) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls2)) ((v_Base_dList_dappend dtb__238) dtb__239)) decls2)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__236) dtb__237) dtb__242) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__235)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__236, dtb__237, dtb__238, dtb__239, d1, dtb__241, dtb__242, dtb__243)), d2))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250) -> ((fun entryTable -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram entryTable) dtb__244)) (fun decls2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__247) dtb__248) dtb__249) ((v_Base_dList_dappend dtb__245) dtb__246)) decls2)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__247)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))))) (v_Vuna_dCompiler_dLoader_dFixity_dtableOf ((v_Base_dList_dappend dtb__250) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__247) ((v_Base_dList_dappend dtb__245) dtb__246)))))
  | _ -> failwith "DT: impossible branch"
))
