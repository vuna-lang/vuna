open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
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
let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun path src -> (match ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) src) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__0) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [path; ": "; dtb__0])))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__1) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((v_Base_dList_dconcatMap (fun imp -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2) -> (v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf dtb__2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))) imports))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> ((fun key -> (match ((v_Base_dHashMap_dlookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__4) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__4) (((v_Base_dHashMap_dinsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__3, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dAst_dfixityOp dtb__3))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> (String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export private name "; name; " (names starting with _ are module-private)"]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (match dtb__6 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> (if (dtb__8 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__11))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__7))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18) -> (if (dtb__14 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, (C_Base_dList_dList_Base_dList_dCons (dtb__14, C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__7))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__19, dtb__20, dtb__21, dtb__22) -> (if (dtb__19 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__21))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__7))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__7)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (match dtb__23 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__25, dtb__26, dtb__27, dtb__28) -> (if (dtb__25 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__24))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__29, dtb__30, dtb__31, dtb__32) -> (if (dtb__29 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__24))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__33, dtb__34, dtb__35) -> (if (dtb__33 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__24))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__36, dtb__37, dtb__38, dtb__39) -> (if (dtb__36 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__24))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__24)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__40) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__40))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__41))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (match dtb__42 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__44, dtb__45, dtb__46) -> (if (dtb__44 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__44)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__43))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> (match dtb__47 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__52) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__55) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, dtb__55))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__48)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (if (dtb__56 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__56)))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__48))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__61, dtb__62, dtb__63, dtb__64) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__63) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__65) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__65))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__48)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__48)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__66) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__67) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("ctor", dtb__66, ((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__66), ((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__67))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__68) = "ctor") then ((v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__68) = mc0) else false) then (C_Base_dList_dList_Base_dList_dCons (dtb__68, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__69))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__69))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__70) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__70, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__70), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__70) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__73)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__76) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__76, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__76), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__76) (C_Base_dList_dList_Base_dList_dCons (dtb__76, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__81, dtb__82, dtb__83, dtb__84) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__81) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__81, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__81), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__81) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__83)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__85, dtb__86, dtb__87, dtb__88) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__89, dtb__90, dtb__91, dtb__92) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__89) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__89, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__89), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__93, dtb__94, dtb__95) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__93) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__93, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__93), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__96, dtb__97, dtb__98, dtb__99) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__96) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__96, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__96), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__100, dtb__101, dtb__102, dtb__103) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__100) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__100, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__100), "")), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> ((fun key -> (match ((v_Base_dHashMap_dlookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__106) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__105) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__105) (((v_Base_dHashMap_dinsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__104, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" [(v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__104); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__104)]))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__109, dtb__110, dtb__111, dtb__112, dtb__113) -> (if (dtb__109 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__108))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__108)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, dtb__115) -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__115) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__116) -> (match dtb__116 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__115) dtb__121)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__114))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125) -> (match dtb__125 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__126, dtb__127, dtb__128) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (match dtb__129 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__130, dtb__131, dtb__132) -> (if (if (if (dtb__126 = "type") then (dtb__130 = "ctor") else false) then (dtb__127 = dtb__131) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__127) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__133) -> (match dtb__133 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__134, dtb__135, dtb__136) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__134, mc0, dtb__135, dtb__136)), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)), ""))))))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (match dtb__137 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__138), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e), (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e), (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)))))))) (v_Base_dPair_dsecondOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__140) -> (match dtb__140 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, dtb__142) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__142), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__141)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__143), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__144), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__144), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__144))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__145), "")), C_Base_dList_dList_Base_dList_dNil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__144), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__144), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__144))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__146), "")), C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> (match dtb__147 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__152) dtb__148) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__147))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__153, dtb__154) -> (match dtb__153 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)))) (v_Base_dPair_dfirstOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155) -> (match dtb__155 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__156), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__156) dtb__157)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__158) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__158)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__154) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__154, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__159), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__159)) es)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": type "; dtb__154; " is not exported by "; dtb__158])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__153))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__160, dtb__161) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__160) dtb__161)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__162, dtb__163) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__162) dtb__163)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__164, dtb__165) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix mc3) dtb__164) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc1; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__165); ": module "; dtb__164; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__166)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__167)) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__167)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind mc0) dtb__168))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (if (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__169)) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__169)) else false) then ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget mc0) <> (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__169)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport mc0) dtb__170))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e e2 -> (if (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e) = (v_Vuna_dCompiler_dLoader_dModules_dentryKind e2)) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic e) = (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e2)) else false) then ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget e) = (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e2)) else false) then ((v_Vuna_dCompiler_dLoader_dModules_dentryParent e) = (v_Vuna_dCompiler_dLoader_dModules_dentryParent e2)) else false))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(v_Vuna_dCompiler_dLoader_dModules_dentryKind e); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> ((fun key -> (match ((v_Base_dHashMap_dlookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__172) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__172) (((v_Base_dHashMap_dinsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__171, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__171))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__174) dtb__175) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": duplicate export "; (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__174)]))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__175))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__176, dtb__177) -> ("module:" ^ dtb__176)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__178, dtb__179) -> ("typeall:" ^ dtb__178)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__180, dtb__181) -> ("bare:" ^ dtb__180)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (match dtb__182 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> (if (mc0 = dtb__184) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf mc0) dtb__183))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match dtb__186 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__188) dtb__187) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__187))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__190, dtb__191) -> dtb__190
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__192, dtb__193) -> dtb__192
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__194, dtb__195) -> dtb__194
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__196) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": duplicate export "; dtb__196])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__197, dtb__198) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__197)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__198)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend es) tail)))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__199) -> (match dtb__199 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__200, dtb__201, dtb__202, dtb__203) -> (if (dtb__200 = mc0) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__203); ": module name mismatch: source declares "; dtb__200]))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__204) -> (match dtb__204 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__205, dtb__206, dtb__207, dtb__208) -> (if dtb__206 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports mc0) mc1) mc4) mc3) dtb__207)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc1) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons (name, stack)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__209, dtb__210) -> (match dtb__210 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["ambiguous implicit Prelude (found in: "; (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)))) mc1)); ")"])))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, dtb__212) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)) <> importerPkg))) dtb__211))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots importerPkg currentName imports -> (if (currentName = "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel roots importerPkg modules stack imports -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Base_dList_dCons (dtb__213, dtb__214) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule (fuel - 1)) roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__213))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) importerPkg) modules2) stack) dtb__214)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel roots importerPkg modules stack name -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__215) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path)))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__216, dtb__217, dtb__218, dtb__219) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__216)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__217)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__217)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (C_Base_dList_dList_Base_dList_dCons (name, stack))) ((v_Base_dList_dappend dtb__217) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__216) dtb__217) dtb__219)) (fun exports -> ((fun visible -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (name, (v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__217, implicit, dtb__219, exports, (v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root), visible)), modules2))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__218) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules2) ((v_Base_dList_dappend dtb__217) implicit)))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx entry -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) entry)) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath entry) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) entry)))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__220, dtb__221, dtb__222, dtb__223) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__221)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__221)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__221) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__223, dtb__221, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__222))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__224) -> (match dtb__224 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__225, dtb__226, dtb__227, dtb__228) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__220)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (entry))) entry)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx names -> ((fun entryImports -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), C_Base_dList_dList_Base_dList_dNil))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx label source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__229, dtb__230, dtb__231, dtb__232) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__230)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__230)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__230) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__232, dtb__230, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__231))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__233) -> (match dtb__233 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__234, dtb__235, dtb__236, dtb__237) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__229)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun ctx label source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__238, dtb__239, dtb__240, dtb__241) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__242) -> (match dtb__242 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__243, dtb__244, dtb__245, dtb__246) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__243) dtb__239)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__243) dtb__239)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__239) implicit))) (fun modules -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules) dtb__243) dtb__238) dtb__239) dtb__241)) (fun exports -> ((fun visible -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, dtb__239, implicit, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__243, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), dtb__239, implicit, dtb__241, exports, (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), visible)), modules)), (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__240) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__239) implicit)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) label) source)
  | _ -> failwith "DT: impossible branch"
)) dtb__238)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun ctx modules0 label source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__247, dtb__248, dtb__249, dtb__250) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__251) -> (match dtb__251 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__252, dtb__253, dtb__254, dtb__255) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__252) dtb__248)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__252) dtb__248)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__248) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__249) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__248) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) dtb__248)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__248)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__248) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__249) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__248) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)) dtb__247)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun ctx label source -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn ctx) C_Base_dList_dList_Base_dList_dNil) label) source)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dsecondOf p))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257) -> (match dtb__256 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__258, dtb__259, dtb__260, dtb__261, dtb__262, dtb__263, dtb__264, dtb__265) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (v_Vuna_dCompiler_dLoader_dFixity_dtableOf dtb__265)) dtb__262)) (fun decls2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__258, dtb__259, dtb__260, dtb__261, decls2, dtb__263, dtb__264, dtb__265)), dtb__257))) dtb__258) dtb__258) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls2)) ((v_Base_dList_dappend dtb__260) dtb__261)) decls2)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__258) dtb__259) dtb__264) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__257)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__258, dtb__259, dtb__260, dtb__261, d1, dtb__263, dtb__264, dtb__265)), d2))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270, dtb__271, dtb__272) -> ((fun entryTable -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram entryTable) dtb__266)) (fun decls2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__269) dtb__270) dtb__271) ((v_Base_dList_dappend dtb__267) dtb__268)) decls2)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__269)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))))) (v_Vuna_dCompiler_dLoader_dFixity_dtableOf (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__272) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__269) ((v_Base_dList_dappend dtb__267) dtb__268))))))
  | _ -> failwith "DT: impossible branch"
))
