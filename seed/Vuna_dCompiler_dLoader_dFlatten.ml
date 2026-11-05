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
open Vuna_dCompiler_dLoader_dResolve
let v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir = ((fun base -> ((if (base = "") then "/tmp" else base) ^ "/vuna-cache/ast")) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_getenv dtio_0)) "TMPDIR")))

let v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf = (fun path src -> (bi_strFromInt ((((dtp_strHash (String.concat "" [path; "__"; src])) * 1000003) + (dtp_strHash (String.concat "" ["m30:"; path; src]))) + (bi_strLength src))))

let v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf = (fun modules imports -> ((v_Base_dList_dconcatMap (fun imp -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) (v_Vuna_dCompiler_dLoader_dModules_dimportName imp)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf dtb__0)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))) imports))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__1, dtb__2) -> ((fun key -> (match ((v_Base_dHashMap_dlookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__2) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo dtb__2) (((v_Base_dHashMap_dinsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__1, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dAst_dfixityOp dtb__1))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities = (fun ds -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo ds) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix sp name -> (String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export private name "; name; " (names starting with _ are module-private)"]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match dtb__4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__6, dtb__7, dtb__8, dtb__9, dtb__10, dtb__11) -> (if (dtb__6 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__9))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__5))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__12, dtb__13, dtb__14, dtb__15, dtb__16) -> (if (dtb__12 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__12, (C_Base_dList_dList_Base_dList_dCons (dtb__12, C_Base_dList_dList_Base_dList_dNil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__5))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__17, dtb__18, dtb__19, dtb__20) -> (if (dtb__17 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__17, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__19))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__5))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData mc0) dtb__5)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__21, dtb__22) -> (match dtb__21 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__23, dtb__24, dtb__25, dtb__26) -> (if (dtb__23 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__22))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__27, dtb__28, dtb__29, dtb__30) -> (if (dtb__27 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__22))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__31, dtb__32, dtb__33) -> (if (dtb__31 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__22))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__34, dtb__35, dtb__36, dtb__37) -> (if (dtb__34 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc0)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__22))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn mc0) dtb__22)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__38, dtb__39) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__38) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__38))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__39))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__42, dtb__43, dtb__44) -> (if (dtb__42 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__41))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> (match dtb__45 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed mc0) dtb__50) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__53) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__47, dtb__53))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__46)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (if (dtb__54 = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__54, dtb__54)))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__46))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__59, dtb__60, dtb__61, dtb__62) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed mc0) dtb__61) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__63) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__63))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__46)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName mc0) dtb__46)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__64) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__65) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("ctor", dtb__64, ((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) dtb__64), ((v_Vuna_dCompiler_dLoader_dModules_dmangle mc0) mc1))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries mc0) mc1) dtb__65))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__66) = "ctor") then ((v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__66) = mc0) else false) then (C_Base_dList_dList_Base_dList_dCons (dtb__66, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__67))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType mc0) dtb__67))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__68) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__68, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__68), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__68) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__71)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__74) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__74, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__74), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__74) (C_Base_dList_dList_Base_dList_dCons (dtb__74, C_Base_dList_dList_Base_dList_dNil))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__79, dtb__80, dtb__81, dtb__82) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__79) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__79, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__79), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__79) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName) dtb__81)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__83, dtb__84, dtb__85, dtb__86) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__87, dtb__88, dtb__89, dtb__90) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__87) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__87, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__87), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__91, dtb__92, dtb__93) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__91) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__91, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__91), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__94, dtb__95, dtb__96, dtb__97) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__94) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__94, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__94), "")), C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__98, dtb__99, dtb__100, dtb__101) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__98) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__98, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__98), "")), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> ((fun key -> (match ((v_Base_dHashMap_dlookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__104) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__103) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__103) (((v_Base_dHashMap_dinsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__102, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" [(v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__102); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__102)]))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__105 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> (if (dtb__107 = mc0) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__106))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl mc0) dtb__106)
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules decls prefix target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__113) -> ((fun m -> (if (m = prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__113) decls) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (match dtb__114 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121, dtb__122) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__113) dtb__119)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m)))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__112))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (match dtb__123 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__124, dtb__125, dtb__126) -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__127) -> (match dtb__127 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__128, dtb__129, dtb__130) -> (if (if (if (dtb__124 = "type") then (dtb__128 = "ctor") else false) then (dtb__125 = dtb__129) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget mc0) mc1) mc2) dtb__125) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (match dtb__131 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__132, dtb__133, dtb__134) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__132, mc0, dtb__133, dtb__134)), C_Base_dList_dList_Base_dList_dNil))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (match dtb__135 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__136), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules prefix decls imports name -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e), (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e), (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)))))))) (v_Base_dPair_dsecondOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (match dtb__138 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__140), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__139)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) decls)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules prefix decls imports name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__141), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules prefix m base name sp -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__142), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__142), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__142))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__143), "")), C_Base_dList_dList_Base_dList_dNil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__142), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__142), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__142))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__144), "")), C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules prefix decls imports name sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> (match dtb__145 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__147) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__149) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__150) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__150) dtb__146) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__145))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules prefix decls imports name sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__151, dtb__152) -> (match dtb__151 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot export unknown name "; name])))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)))) (v_Base_dPair_dfirstOf p))))
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> (match dtb__153 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__154), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__154) dtb__155)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls)))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": module "; mprefix; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__156)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__152) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__152, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__157), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__157)) es)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": type "; dtb__152; " is not exported by "; dtb__156])))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__151))
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__158, dtb__159) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare mc0) mc1) mc2) mc3) dtb__158) dtb__159)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__160, dtb__161) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll mc0) mc1) mc2) mc3) dtb__160) dtb__161)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__162, dtb__163) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix mc3) dtb__162) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc1; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__163); ": module "; dtb__162; " is not imported"])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__164) -> ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__164)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__165)) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__165)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind mc0) dtb__166))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__167)) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__167)) else false) then ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget mc0) <> (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__167)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport mc0) dtb__168))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e e2 -> (if (if (if ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e) = (v_Vuna_dCompiler_dLoader_dModules_dentryKind e2)) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic e) = (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e2)) else false) then ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget e) = (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e2)) else false) then ((v_Vuna_dCompiler_dLoader_dModules_dentryParent e) = (v_Vuna_dCompiler_dLoader_dModules_dentryParent e2)) else false))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> (String.concat "" [(v_Vuna_dCompiler_dLoader_dModules_dentryKind e); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e); "|"; (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)]))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> ((fun key -> (match ((v_Base_dHashMap_dlookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__170) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__170) (((v_Base_dHashMap_dinsert key) 1) mc1)) (C_Base_dList_dList_Base_dList_dCons (dtb__169, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__169))
  | C_Base_dList_dList_Base_dList_dNil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) (v_Base_dHashMap_dfromList C_Base_dList_dList_Base_dList_dNil)) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__172) dtb__173) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": duplicate export "; (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__172)]))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__173))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__174, dtb__175) -> ("module:" ^ dtb__174)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__176, dtb__177) -> ("typeall:" ^ dtb__176)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__178, dtb__179) -> ("bare:" ^ dtb__178)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> (match dtb__180 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (if (mc0 = dtb__182) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf mc0) dtb__181))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (match dtb__184 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__186, dtb__187) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__186) dtb__185) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__185))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__188, dtb__189) -> dtb__188
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__190, dtb__191) -> dtb__190
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__192, dtb__193) -> dtb__192
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [prefix; ": duplicate export "; dtb__194])))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__195)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__196)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend es) tail)))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> (match dtb__197 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__198, dtb__199, dtb__200, dtb__201) -> (if (dtb__198 = mc0) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": "; (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__201); ": module name mismatch: source declares "; dtb__198]))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__202) -> (match dtb__202 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__203, dtb__204, dtb__205, dtb__206) -> (if dtb__204 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports mc0) mc1) mc4) mc3) dtb__205)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc1) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports mc1) mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons (name, stack)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__207, dtb__208) -> (match dtb__208 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["ambiguous implicit Prelude (found in: "; (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)))) mc1)); ")"])))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__209, dtb__210) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)) <> importerPkg))) dtb__209))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots importerPkg currentName imports -> (if (currentName = "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> (match dtb__211 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__213, dtb__214, dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram (v_Vuna_dCompiler_dLoader_dFixity_dtableOf dtb__220)) dtb__217)) (fun decls2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__213, dtb__214, dtb__215, dtb__216, decls2, dtb__218, dtb__219, dtb__220)), dtb__212))) dtb__213) dtb__213) (v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf decls2)) ((v_Base_dList_dappend dtb__215) dtb__216)) decls2)) (fun d -> ((((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__213) dtb__214) dtb__219) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__212)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__213, dtb__214, dtb__215, dtb__216, d1, dtb__218, dtb__219, dtb__220)), d2))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225, dtb__226, dtb__227) -> ((fun entryTable -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram entryTable) dtb__221)) (fun decls2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__224) dtb__225) dtb__226) ((v_Base_dList_dappend dtb__222) dtb__223)) decls2)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__224)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))))) (v_Vuna_dCompiler_dLoader_dFixity_dtableOf (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__227) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf dtb__224) ((v_Base_dList_dappend dtb__222) dtb__223))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (if (dtb__228 = 47) then dtb__229 else (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash dtb__229))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath = (fun path -> ((fun chars -> ((fun rev -> ((fun after -> (if ((v_Base_dList_dlength after) = (v_Base_dList_dlength rev)) then "." else ((fun parent -> (if (parent = "") then (if ((v_Base_dString_dstartsWith "/") path) then "/" else ".") else (if (if ((v_Base_dString_dstartsWith "/") path) then (v_Base_dBool_dnot ((v_Base_dString_dstartsWith "/") parent)) else false) then ("/" ^ parent) else parent))) (dtp_pack (v_Base_dList_dreverse after))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddropPastSlash rev))) (v_Base_dList_dreverse chars))) (dtp_unpack path)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel = (fun fuel path -> (if (fuel <= 0) then 0 else (if (if (if (path = "") then true else (path = ".")) then true else (path = "/")) then 0 else (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then 0 else ((fun _u -> (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_makeDir dtio_0)) path))) ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel (fuel - 1)) (v_Vuna_dCompiler_dLoader_dFlatten_dparentOfPath path)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath = (fun path -> ((v_Vuna_dCompiler_dLoader_dFlatten_densureDirPathFuel 256) path))

let v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath = (fun path src -> ((fun cpath -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) cpath)) then (C_Base_dResult_dResult_Base_dResult_dOk ((dtp_unmarshal (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) cpath))))) else (match ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) src) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__230) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [path; ": "; dtb__230])))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__231) -> ((fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__231))) (v_Base_dIO_drunIO (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) cpath) (dtp_marshal dtb__231))))) (v_Vuna_dCompiler_dLoader_dFlatten_densureDirPath v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir))
  | _ -> failwith "DT: impossible branch"
))) (String.concat "" [v_Vuna_dCompiler_dLoader_dFlatten_dastCacheDir; "/"; ((v_Vuna_dCompiler_dLoader_dFlatten_dastKeyOf path) src)])))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel roots importerPkg modules stack imports -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule (fuel - 1)) roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__232))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) importerPkg) modules2) stack) dtb__233)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel roots importerPkg modules stack name -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__234) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath path) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) path)))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__235, dtb__236, dtb__237, dtb__238) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__235)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__236)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__236)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll (fuel - 1)) roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (C_Base_dList_dList_Base_dList_dCons (name, stack))) ((v_Base_dList_dappend dtb__236) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__235) dtb__236) dtb__238)) (fun exports -> ((fun visible -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (name, (v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__236, implicit, dtb__238, exports, (v_Vuna_dCompiler_dPackages_dPkg_drootCapabilities root), visible)), modules2))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__237) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules2) ((v_Base_dList_dappend dtb__236) implicit)))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun ctx entry -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) entry)) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath entry) (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) entry)))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__239, dtb__240, dtb__241, dtb__242) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__240)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__240)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__240) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__242, dtb__240, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__241))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__243) -> (match dtb__243 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__244, dtb__245, dtb__246, dtb__247) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__239)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (entry))) entry)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun ctx names -> ((fun entryImports -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), C_Base_dList_dList_Base_dList_dNil))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource = (fun ctx label source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__248, dtb__249, dtb__250, dtb__251) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__249)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__249)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__249) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__251, dtb__249, implicit, modules, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), dtb__250))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> (match dtb__252 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__253, dtb__254, dtb__255, dtb__256) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__248)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource = (fun ctx label source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__257, dtb__258, dtb__259, dtb__260) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__261) -> (match dtb__261 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__262, dtb__263, dtb__264, dtb__265) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__262) dtb__258)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__262) dtb__258)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__258) implicit))) (fun modules -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules) dtb__262) dtb__257) dtb__258) dtb__260)) (fun exports -> ((fun visible -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Base_dList_dNil, dtb__258, implicit, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__262, (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), dtb__258, implicit, dtb__260, exports, (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), visible)), modules)), (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx), (v_Vuna_dCompiler_dPackages_dPkg_dcontextCapabilities ctx), C_Base_dList_dList_Base_dList_dNil))))) (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__259) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__258) implicit)))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) label) source)
  | _ -> failwith "DT: impossible branch"
)) dtb__257)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn = (fun ctx modules0 label source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__266, dtb__267, dtb__268, dtb__269) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__270) -> (match dtb__270 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__271, dtb__272, dtb__273, dtb__274) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports dtb__271) dtb__267)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) dtb__271) dtb__267)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__267) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__268) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__267) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports label) dtb__267)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) "") dtb__267)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) (v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots ctx)) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)) modules0) C_Base_dList_dList_Base_dList_dNil) ((v_Base_dList_dappend dtb__267) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (modules, (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities ((v_Base_dList_dappend dtb__268) ((v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf modules) ((v_Base_dList_dappend dtb__267) implicit))))))))))))))
  | _ -> failwith "DT: impossible branch"
)) dtb__266)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource = (fun ctx label source -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn ctx) C_Base_dList_dList_Base_dList_dNil) label) source)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dPair_dsecondOf p))))))
