open Vuna_runtime
open Vuna_builtins
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
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dLoader_dResolve
let v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg = (fun prefix -> (fun sp -> (fun name -> ((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export private name ") ((bi_concat name) " (names starting with _ are module-private)"))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__2, dtb__3, dtb__4, dtb__5, dtb__6, dtb__7) -> (if ((bi_eq_str dtb__2) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__5))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12) -> (if ((bi_eq_str dtb__8) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, (C_Base_dList_dList_Cons (dtb__8, C_Base_dList_dList_Nil)))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__13, dtb__14, dtb__15, dtb__16) -> (if ((bi_eq_str dtb__13) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__15))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) dtb__1)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (match dtb__17 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((bi_eq_str dtb__19) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__23, dtb__24, dtb__25) -> (if ((bi_eq_str dtb__23) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) dtb__18)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed = (fun name -> (fun ctors -> (match ctors with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__26)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dctorName dtb__26))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed name) dtb__27))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed = (fun d3342 -> (fun name -> (fun methods -> (match methods with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (match dtb__28 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__30, dtb__31) -> (if (((v_Base_dEq_deq d3342) dtb__30) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__30)) else (((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed d3342) name) dtb__29))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__32 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> (if dtb__35 then ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__33) else (match dtb__34 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39) -> (if ((bi_eq_str dtb__39) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__39)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__33))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__33)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) dtb__33)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__40 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed name) dtb__45) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__48))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__41)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> (if ((bi_eq_str dtb__49) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__49, dtb__49)))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__41))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__54, dtb__55, dtb__56, dtb__57) -> (match (((v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) name) dtb__56) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__58) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__54, dtb__58))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__41)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) dtb__41)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries = (fun prefix -> (fun dname -> (fun names -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__59) then (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dname) dtb__60) else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("ctor", dtb__59, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__59), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dname))), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dname) dtb__60))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType = (fun typeTarget -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__61)) "ctor") then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__61)) typeTarget) else false) then (C_Base_dList_dList_Cons (dtb__61, ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType typeTarget) dtb__62))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType typeTarget) dtb__62))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports = (fun prefix -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__63) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__63, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__63), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__63) ((v_Base_dList_dmap v_Vuna_dCompiler_dFrontend_dAst_dctorName) dtb__66)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__69) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__69, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__69), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__69) (C_Base_dList_dList_Cons (dtb__69, C_Base_dList_dList_Nil))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__74, dtb__75, dtb__76, dtb__77) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__74) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__74, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__74), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__74) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__76)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> (if dtb__79 then C_Base_dList_dList_Nil else (match dtb__78 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__83) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__83) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__83, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__83), "")), C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__84, dtb__85, dtb__86) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__84) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__84, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__84), "")), C_Base_dList_dList_Nil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__87, dtb__88, dtb__89, dtb__90) -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName dtb__87) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("val", dtb__87, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__87), "")), C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__91, dtb__92) -> ((fun key -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__92) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic dtb__92) (((v_Vuna_dCompiler_dCommon_dtblInsert key) 1) mc1)) (C_Base_dList_dList_Cons (dtb__91, mc2)))
  | _ -> failwith "DT: impossible branch"
)) ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__91)) ((bi_concat "|") (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__91))))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic entries) (v_Vuna_dCompiler_dCommon_dtblEmpty ())) C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports = (fun prefix -> (fun decls -> (v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports prefix)) decls))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl = (fun dname -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> (if ((bi_eq_str dtb__96) dname) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dname) dtb__95))
  | _ -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dname) dtb__95)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget = (fun modules -> (fun decls -> (fun prefix -> (fun target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> ((fun m -> (if ((bi_eq_str m) prefix) then ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__102) decls) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__103) -> (match dtb__103 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__104, dtb__105, dtb__106, dtb__107, dtb__108, dtb__109) -> ((v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl dtb__102) dtb__108)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__101))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates = (fun modules -> (fun decls -> (fun prefix -> (fun tr -> (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110) -> (match dtb__110 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__111, dtb__112, dtb__113) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__114) -> (match dtb__114 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__115, dtb__116, dtb__117) -> (if (if (if ((bi_eq_str dtb__111) "type") then ((bi_eq_str dtb__115) "ctor") else false) then ((bi_eq_str dtb__112) dtb__116) else false) then ((((v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget modules) decls) prefix) dtb__112) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__118) -> (match dtb__118 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__119, dtb__120, dtb__121) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__119, mc0, dtb__120, dtb__121)), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__122) -> (match dtb__122 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, dtb__124) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__123), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("type", (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)), ""))))))))
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__125) -> (match dtb__125 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__127), ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__126)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ((v_Vuna_dCompiler_dLoader_dModules_dentryKind e), (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e), (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)))))))) (v_Base_dPair_dsecondOf p))))
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__128), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnInstanceName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__129), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective = (fun modules -> (fun prefix -> (fun m -> (fun base -> (fun name -> (fun sp -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__130) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__130), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__130), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__130))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__131), "")), C_Base_dList_dList_Nil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ((v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__130), base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__130), (v_Vuna_dCompiler_dLoader_dModules_dentryParent dtb__130))), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__132), "")), C_Base_dList_dList_Nil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportBare = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__133, dtb__134) -> (match dtb__133 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> (if (((((v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective modules) prefix) dtb__138) dtb__134) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__133))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> (match dtb__139 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg prefix) sp) name))) else (match ((v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__141) -> (match dtb__141 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dModules_dmangle prefix) dtb__142), "")), (((v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries prefix) dtb__142) dtb__143)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) m)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType tgt) es)))))))) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget (v_Base_dPair_dsecondOf p)))) (v_Base_dPair_dfirstOf p))))
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__144) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__144)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) dtb__140) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry ("type", dtb__140, (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__145), "")), ((v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__145)) es)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": type ") ((bi_concat dtb__140) ((bi_concat " is not exported by ") dtb__144))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__139))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__146, dtb__147) -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix imports) dtb__146) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__147)) ((bi_concat ": module ") ((bi_concat dtb__146) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__148) -> ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__148)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__149, dtb__150) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll modules) prefix) decls) imports) dtb__149) dtb__150)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__151, dtb__152) -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dexportBare modules) prefix) decls) imports) dtb__151) dtb__152)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__153, dtb__154) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__153)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__153)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind e) dtb__154))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__155)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__155)) else false) then ((bi_neq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__155)) else false) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport e) dtb__156))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry = (fun e -> (fun e2 -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) (v_Vuna_dCompiler_dLoader_dModules_dentryKind e2)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryParent e)) (v_Vuna_dCompiler_dLoader_dModules_dentryParent e2)) else false)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey = (fun e -> ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryKind e)) ((bi_concat "|") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryPublic e)) ((bi_concat "|") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) ((bi_concat "|") (v_Vuna_dCompiler_dLoader_dModules_dentryParent e))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__157, dtb__158) -> ((fun key -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup key) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__158) mc1) mc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey dtb__158) (((v_Vuna_dCompiler_dCommon_dtblInsert key) 1) mc1)) (C_Base_dList_dList_Cons (dtb__157, mc2)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey dtb__157))
  | C_Base_dList_dList_Nil -> (v_Base_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries = (fun entries -> (((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey entries) (v_Vuna_dCompiler_dCommon_dtblEmpty ())) C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport dtb__160) dtb__161) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__160))))) else ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates mc0) dtb__161))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey = (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__162, dtb__163) -> ((bi_concat "bare:") dtb__162)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__164, dtb__165) -> ((bi_concat "typeall:") dtb__164)
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__166, dtb__167) -> ((bi_concat "module:") dtb__166)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf = (fun key -> (fun rest -> (match rest with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match dtb__168 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> (if ((bi_eq_str key) dtb__170) then true else ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf key) dtb__169))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__172, dtb__173) -> (match dtb__172 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> (if ((v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf dtb__174) dtb__173) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__175)) else (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys dtb__173))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName = (fun item -> (match item with
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXBare (dtb__176, dtb__177) -> dtb__176
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXTypeAll (dtb__178, dtb__179) -> dtb__178
  | C_Vuna_dCompiler_dFrontend_dAst_dExportItem_Vuna_dCompiler_dFrontend_dAst_dXModule (dtb__180, dtb__181) -> dtb__180
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem = (fun items -> (v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys ((v_Base_dList_dmap (fun i -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey i), (v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName i))))) items)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems = (fun prefix -> (fun items -> (match (v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem items) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": duplicate export ") dtb__182))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__183, dtb__184) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries mc0) mc1) mc2) mc3) dtb__183)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) dtb__184)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend es) tail)))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems mc1) mc4)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll mc0) mc1) mc2) mc3) mc4)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries es)))))))
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader = (fun label -> (fun hdr -> (match hdr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> (match dtb__185 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__186, dtb__187, dtb__188, dtb__189) -> (if ((bi_eq_str dtb__186) label) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__189)) ((bi_concat ": module name mismatch: source declares ") dtb__186)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports = (fun modules -> (fun prefix -> (fun hdr -> (fun imports -> (fun decls -> (match hdr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports prefix) decls)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__190) -> (match dtb__190 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__191, dtb__192, dtb__193, dtb__194) -> (if dtb__192 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports modules) prefix) decls) imports) dtb__193)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates prefix) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports prefix) decls))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle = (fun name -> (fun stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Cons (name, stack))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps = (fun importerPkg -> (fun deps -> (match deps with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__195, dtb__196) -> (match dtb__196 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Nil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom = (fun roots -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__197, dtb__198) -> ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((bi_neq_str (v_Vuna_dCompiler_dPackages_dPkg_drootName (v_Base_dPair_dsecondOf c))) importerPkg))) dtb__197))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude = (fun roots -> (fun importerPkg -> (fun currentName -> (fun imports -> (if ((bi_eq_str importerPkg) "") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (if ((bi_eq_str currentName) "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom roots) importerPkg))))))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dloadAll = (fun fuel -> (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun imports -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match imports with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Cons (dtb__199, dtb__200) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadModule ((bi_sub fuel) 1)) roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__199))) (fun modules2 -> ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll ((bi_sub fuel) 1)) roots) importerPkg) modules2) stack) dtb__200)))
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dLoader_dFlatten_dloadModule = (fun fuel -> (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun name -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: loader fuel exhausted (internal: module graph too deep)")) else (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__201) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dImportCycle (((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)))) ((v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle name) stack)) else (if (v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource path) (dtp_readFile path))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__202, dtb__203, dtb__204) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader name) dtb__202)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports name) dtb__203)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) name) dtb__203)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll ((bi_sub fuel) 1)) roots) (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) modules) (C_Base_dList_dList_Cons (name, stack))) ((v_Base_dList_dappend dtb__203) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports modules2) name) dtb__202) dtb__203) dtb__204)) (fun exports -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (name, (v_Vuna_dCompiler_dPackages_dPkg_drootName root), dtb__203, implicit, dtb__204, exports)), modules2))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dInvalidModuleName (name))) name)))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProject = (fun roots -> (fun entryPkg -> (fun entry -> (if (dtp_fileExists entry) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource entry) (dtp_readFile entry))) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__205, dtb__206, dtb__207) -> (match dtb__205 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__208) -> (match dtb__208 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__209, dtb__210, dtb__211, dtb__212) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntryFile (entry))) entry)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__206)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude roots) entryPkg) "") dtb__206)) (fun implicit -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) roots) entryPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) ((v_Base_dList_dappend dtb__206) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__207, dtb__206, implicit, modules, entryPkg))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dEntryFileNotFound (entry))) entry)))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules = (fun roots -> (fun entryPkg -> (fun names -> ((fun entryImports -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) roots) entryPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, modules, entryPkg))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names)))))

let rec v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__213, dtb__214) -> (match dtb__213 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__215, dtb__216, dtb__217, dtb__218, dtb__219, dtb__220)), dtb__214))) dtb__215) dtb__215) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dtopNames dtb__219)) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf dtb__219))) (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf dtb__219)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dctorsOf dtb__219)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dFrontend_dAst_dtopNames dtb__219)) (v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf dtb__219)))) ((v_Base_dList_dappend dtb__217) dtb__218)) dtb__219)) (fun d -> (((v_Vuna_dCompiler_dLoader_dResolve_dcheckEffectsBuiltins dtb__215) dtb__216) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__214)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__215, dtb__216, dtb__217, dtb__218, d1, dtb__220)), d2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry dtb__224) dtb__225) ((v_Base_dList_dappend dtb__222) dtb__223)) dtb__221)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep dtb__224)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProgram = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject roots) entryPkg) entry)) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject p)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend (v_Base_dPair_dfirstOf r)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) (v_Base_dPair_dsecondOf r))))))))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProgramRaw = (fun roots -> (fun entry -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProgram ((v_Base_dList_dmap v_Vuna_dCompiler_dPackages_dPkg_drawRoot) roots)) "") entry)))

let v_Vuna_dCompiler_dLoader_dFlatten_dorderedProjectDecls = (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject p)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf r)))) (v_Base_dPair_dfirstOf r)))))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProgramOrdered = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject roots) entryPkg) entry)) v_Vuna_dCompiler_dLoader_dFlatten_dorderedProjectDecls))))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProgramRawOrdered = (fun roots -> (fun entry -> (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProgramOrdered ((v_Base_dList_dmap v_Vuna_dCompiler_dPackages_dPkg_drawRoot) roots)) "") entry)))

let v_Vuna_dCompiler_dLoader_dFlatten_dloadProgramRawOrderedSource = (fun roots -> (fun label -> (fun source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dFrontend_dParser_dparseSource label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dFrontend_dAst_dSourceFile_Vuna_dCompiler_dFrontend_dAst_dSource (dtb__226, dtb__227, dtb__228) -> (match dtb__226 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__229) -> (match dtb__229 with
  | C_Vuna_dCompiler_dFrontend_dAst_dModDecl_Vuna_dCompiler_dFrontend_dAst_dModDecl (dtb__230, dtb__231, dtb__232, dtb__233) -> ((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleHeaderInEntrySource (label))) label)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dvalidateImports "<entry>") dtb__227)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFlatten_dloadAll 1048576) ((v_Base_dList_dmap v_Vuna_dCompiler_dPackages_dPkg_drawRoot) roots)) "") C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) dtb__227)) (fun modules -> (v_Vuna_dCompiler_dLoader_dFlatten_dorderedProjectDecls (C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__228, dtb__227, C_Base_dList_dList_Nil, modules, "")))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
