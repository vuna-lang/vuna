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
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
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
type t_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts = C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts of (string t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCodegen_dTerm_dGenSt)

let v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram = (fun program -> ((fun datas -> ((fun defs -> ((fun table -> ((fun familyNames -> ((fun axiomNames -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> ((fun allTypeNames -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime axiomNames) dtb__0)) (fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames datas) dtb__0)) (fun _u -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__0)) (fun _u -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs dtb__0)) (fun groups -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, groups))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-groups-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-erasure-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-names-done"))))))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-partition-done"))) ((v_Base_dList_dappend dtb__1) familyNames))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf defs))) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts (dtb__2, dtb__3, dtb__4) -> (dtp_concatMany ((v_Base_dList_dappend dtb__2) (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__3), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook = (fun program -> (fun runtimeDefs -> (fun printResult -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") runtimeDefs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> ((fun table -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__5)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) dtb__6) ((v_Vuna_dCompiler_dCodegen_dTerm_dioRunText program) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook "") table) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__5)) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName "main"))) (v_Vuna_dCompiler_dCodegen_dErase_ddefTable (v_Base_dPair_dsecondOf program)))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> ((bi_concat "open ") ((bi_concat dtb__7) ((bi_concat "\n") (v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader dtb__8))))
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__9, dtb__10) -> ((v_Base_dList_dappend dtb__9) (v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups dtb__10))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__11)) mc0) then true else ((v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName mc0) dtb__12))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor = (fun allDatas -> (fun unitDatas -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData allDatas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__13) -> (if ((v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__13)) unitDatas) then (v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge allDatas) else "")
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts = (fun opens -> (fun allDatas -> (fun unitDatas -> (fun groups -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf allDatas) unitDatas)) (fun typeText -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency (v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups groups)))) (v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt allDatas)) groups)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__14, dtb__15) -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts_Vuna_dCompiler_dCodegen_dAssembly_dUnitParts ((C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader opens), (C_Base_dList_dList_Base_dList_dCons (typeText, (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor allDatas) unitDatas), C_Base_dList_dList_Base_dList_dNil)))))), dtb__14, dtb__15))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-genGroups-done"))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "cg-typedecls-done"))))))))

let v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram = (fun program -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram program)) (fun p -> ((fun _u -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, dtb__17) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (v_Base_dPair_dfirstOf program))) (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas (v_Base_dPair_dfirstOf program))) dtb__17)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (0))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDebug_dstamp "cg-prepare-done")))))
