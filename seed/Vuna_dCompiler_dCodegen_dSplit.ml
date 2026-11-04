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
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
open Vuna_dCompiler_dCodegen_dTerm
open Vuna_dCompiler_dCodegen_dAssembly
open Vuna_dCompiler_dDriver_dSplit
type t_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta = C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta of ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList)

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan = (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))

let v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner = "Main"

let v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit = "Vuna_runtime"

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule = (fun modName -> (v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName modName))

let v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> (v_Vuna_dCompiler_dCommon_djoinDots dtb__0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match dtb__2 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__4, dtb__5, dtb__6, dtb__7) -> (C_Base_dList_dList_Base_dList_dCons (dtb__4, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__8, dtb__9, dtb__10, dtb__11) -> (C_Base_dList_dList_Base_dList_dCons (dtb__8, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__12, dtb__13, dtb__14, dtb__15, dtb__16, dtb__17) -> (C_Base_dList_dList_Base_dList_dCons (dtb__12, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (C_Base_dList_dList_Base_dList_dCons (dtb__18, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__23, dtb__24, dtb__25, dtb__26) -> (C_Base_dList_dList_Base_dList_dCons (dtb__23, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__3)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (match dtb__27 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> (C_Base_dList_dList_Base_dList_dCons (dtb__29, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__28)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (C_Base_dList_dList_Base_dList_dCons (dtb__35, (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__28)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames dtb__28)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dheadClassName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__40, dtb__41) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__40))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__42, dtb__43, dtb__44) -> (match dtb__42 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__45, dtb__46) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__45))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__47, dtb__48) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__47) ((((v_Vuna_dCompiler_dElab_dDerive_dinstHead dtb__47) mc1) mc2) v_Vuna_dCompiler_dCodegen_dSplit_dsplitNoSpan)), mc0)), ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) mc1) mc2) dtb__48)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnerOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__49, dtb__50, dtb__51, dtb__52, dtb__53) -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) dtb__49) dtb__50) dtb__52)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDerivedOwners mc0) dtb__54) dtb__55) dtb__58)
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__60, dtb__61, dtb__62, dtb__63) -> (match (v_Vuna_dCompiler_dCodegen_dSplit_dheadClassName dtb__61) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__64) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dInstName_dinstanceName dtb__64) dtb__61), mc0)), C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDefOwnerOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__65, dtb__66, dtb__67, dtb__68) -> ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName m), mc0)))) dtb__67)
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDataOwnerOf = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__69, dtb__70, dtb__71, dtb__72) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "Dict_") dtb__69), mc0)), C_Base_dList_dList_Base_dList_dNil))
  | _ -> C_Base_dList_dList_Base_dList_dNil
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnerOf mc0) dtb__73)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo mc0) dtb__74))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOf = (fun owner -> (fun decls -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, owner)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames decls))) ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitInstanceOwnersGo owner) decls)) ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDefOwnerOf owner)) decls)))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOf = (fun owner -> (fun decls -> ((v_Base_dList_dappend ((v_Base_dList_dmap (fun n -> (C_Base_dPair_dPair_Base_dPair_dPair (n, owner)))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataNames decls))) ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dCodegen_dSplit_dsplitTraitDataOwnerOf owner)) decls))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> (match dtb__75 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOf dtb__77) dtb__78)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules dtb__76))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__79 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOf dtb__81) dtb__82)) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules dtb__80))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmDefOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__83, dtb__84, dtb__85) -> dtb__83
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmDataOwners = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__86, dtb__87, dtb__88) -> dtb__87
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (dtb__89, dtb__90, dtb__91) -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMetaOf = (fun modules -> (fun entryDecls -> ((fun knownModules -> ((fun defOwners -> ((fun dataOwners -> (C_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta_Vuna_dCompiler_dCodegen_dSplit_dSplitMeta (defOwners, dataOwners, knownModules))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerEntriesOf v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) entryDecls)))) ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOfModules modules)) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitOwnerEntriesOf v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) entryDecls)))) ((v_Base_dList_dmap (fun p -> (v_Base_dPair_dfirstOf p))) modules))))

let v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf = (fun pairs -> (fun name -> ((v_Base_dList_dlookupPair name) pairs)))

let v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr = (fun knownModules -> (fun what -> (fun name -> ((fun prefix -> (if ((v_Base_dList_dmemName prefix) knownModules) then (C_Base_dResult_dResult_Base_dResult_dOk (prefix)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: `") ((bi_concat what) ((bi_concat "` ") ((bi_concat name) ((bi_concat " has module prefix `") ((bi_concat prefix) "` but no such module")))))))))) (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name)))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf = (fun meta -> (fun d -> (match ((v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf (v_Vuna_dCompiler_dCodegen_dSplit_dsmDataOwners meta)) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__92))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr (v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules meta)) "data") (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for data `") ((bi_concat (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) "`")))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf = (fun meta -> (fun name -> (match ((v_Vuna_dCompiler_dCodegen_dSplit_dlookupModuleOf (v_Vuna_dCompiler_dCodegen_dSplit_dsmDefOwners meta)) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__93) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__93))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (((v_Vuna_dCompiler_dCodegen_dSplit_dknownModuleOrErr (v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules meta)) "definition") name) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT split: cannot determine module for definition `") ((bi_concat name) "`")))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__94))) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs mc0) dtb__95)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__94), o)), ps))))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf mc0) dtb__96)) (fun o -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas mc0) dtb__97)) (fun ps -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__96), o)), ps))))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf = (fun pairs -> ((v_Base_dHashMap_dinsertAll pairs) v_Base_dHashMap_dempty))

let v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl = (fun t -> (fun name -> (match ((v_Base_dHashMap_dlookup name) t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> dtb__98
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit = (fun ownerT -> (fun u -> (fun datas -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl ownerT) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName d))) u))) datas))))

let v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit = (fun ownerT -> (fun u -> (fun defs -> ((v_Base_dList_dfilter (fun d -> ((bi_eq_str ((v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl ownerT) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) u))) defs))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__99, dtb__100) -> (match dtb__99 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> ((fun unit -> ((fun unitDatas -> ((fun unitDefs -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs unitDefs)) (fun groups -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts mc0) ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons (v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit, C_Base_dList_dList_Base_dList_dNil))) mc5)) mc1) unitDatas) groups)) (fun parts -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles mc0) mc1) mc2) mc3) mc4) ((v_Base_dList_dappend mc5) (C_Base_dList_dList_Base_dList_dCons (unit, C_Base_dList_dList_Base_dList_dNil)))) dtb__100)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile (((bi_concat unit) ".ml"), ((bi_concat (v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts)) "\n"))), tail))))))))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit mc3) dtb__101) mc2))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit mc4) dtb__101) mc1))) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFile = (fun usedTbl -> (fun allDatas -> (fun allDefs -> (fun defOwnerT -> (fun dataOwnerT -> (fun printResult -> (fun opens -> ((fun entryDefs -> ((fun entryDatas -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs entryDefs)) (fun groups -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts usedTbl) opens) allDatas) entryDatas) groups)) (fun parts -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook (C_Base_dPair_dPair_Base_dPair_dPair (allDatas, allDefs))) allDefs) printResult)) (fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Main.ml", ((bi_concat (v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText parts)) hook)))))))))))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit dataOwnerT) v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) allDatas))) (((v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit defOwnerT) v_Vuna_dCompiler_dCodegen_dSplit_dentryOwner) allDefs)))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName = (fun knownModules -> (fun mname -> (fun name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name)) knownModules) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: module ") ((bi_concat mname) ((bi_concat " declares `") ((bi_concat name) ((bi_concat "` whose module prefix `") ((bi_concat (v_Vuna_dCompiler_dCodegen_dSplit_dmodulePrefixOfName name)) "` is not a known module (codegen requires Loader-resolved decls)"))))))))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: module ") ((bi_concat mname) ((bi_concat " has an unresolved declaration name `") ((bi_concat name) "` (codegen requires Loader-resolved decls)"))))))))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName mc0) mc1) dtb__103)) (fun _u -> (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) mc1) dtb__104)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__105 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames mc0) dtb__107) (v_Vuna_dCompiler_dCodegen_dSplit_dsplitDeclNames dtb__108))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls mc0) dtb__106)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__109 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__111, dtb__112, dtb__113, dtb__114) -> (C_Base_dList_dList_Base_dList_dCons (dtb__111, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__110)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120) -> (C_Base_dList_dList_Base_dList_dCons (dtb__115, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__110)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> (C_Base_dList_dList_Base_dList_dCons (dtb__121, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__110)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__126, dtb__127, dtb__128, dtb__129) -> (C_Base_dList_dList_Base_dList_dCons (dtb__126, (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__110)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities dtb__110)
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName = (fun seen -> (fun name -> (if ((bi_eq_str name) "") then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: entry declaration has an empty name")) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: entry declaration `") ((bi_concat name) "` must not contain a module prefix (codegen requires Loader-resolved decls)")))) else (if ((v_Base_dList_dmemName name) seen) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: duplicate entry declaration `") ((bi_concat name) "`")))) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))))))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName mc0) dtb__130)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo (C_Base_dList_dList_Base_dList_dCons (dtb__130, mc0))) dtb__131)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls = (fun decls -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities decls)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDefOwnerOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__132))) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners mc0) dtb__133)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitDataOwnerOf mc0) dtb__134)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners mc0) dtb__135)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules = (fun meta -> (fun modules -> (fun entryDecls -> (fun runtime -> (fun datas -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls (v_Vuna_dCompiler_dCodegen_dSplit_dsmKnownModules meta)) modules)) (fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls entryDecls)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners meta) runtime)) (fun _u -> ((v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners meta) datas))))))))))))

let v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram = (fun modules -> (fun entryDecls -> (fun prog -> (fun printResult -> ((fun allDatas -> ((fun allDefs -> ((fun meta -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), allDefs)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules meta) modules) entryDecls) dtb__136) allDatas)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDefs meta) dtb__136)) (fun defPairs -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dSplit_dnameOwnerPairsOfDatas meta) allDatas)) (fun dataPairs -> ((fun defOwnerT -> ((fun dataOwnerT -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFiles (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) dtb__136) defOwnerT) dataOwnerT) C_Base_dList_dList_Base_dList_dNil) modules)) (fun moduleFiles -> ((fun unitNames -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFile (v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf allDatas)) allDatas) dtb__136) defOwnerT) dataOwnerT) printResult) ((v_Base_dList_dappend (C_Base_dList_dList_Base_dList_dCons (v_Vuna_dCompiler_dCodegen_dSplit_druntimeUnit, C_Base_dList_dList_Base_dList_dNil))) unitNames))) (fun mainFile -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dDriver_dSplit_dSplitFile_Vuna_dCompiler_dDriver_dSplit_dSplitFile ("Vuna_runtime.ml", v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime)), ((v_Base_dList_dappend moduleFiles) (C_Base_dList_dList_Base_dList_dCons (mainFile, C_Base_dList_dList_Base_dList_dNil)))))))))) ((v_Base_dList_dmap (fun q -> (v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule (v_Base_dPair_dfirstOf q)))) modules))))) (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf dataPairs))) (v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf defPairs))))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCodegen_dSplit_dsplitMetaOf modules) entryDecls))) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog)))))))
