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
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Vuna_dCompiler_dDebug
open Vuna_dCompiler_dDiagnostics
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
let v_Vuna_dCompiler_dCodegen_dProgram_dprepareDtProgram = (fun program -> ((fun datas -> ((fun defs -> ((fun table -> ((fun familyNames -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs table) defs) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> ((fun allTypeNames -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes defs)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames datas) dtb__0)) (fun _u -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure allTypeNames) dtb__0)) (fun _u -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs dtb__0)) (fun groups -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, groups))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-groups-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-erasure-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-names-done"))))))) (v_Vuna_dCompiler_dDebug_dstamp "cg-partition-done"))) ((v_Base_dList_dappend dtb__1) familyNames))
  | _ -> failwith "DT: impossible branch"
)) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas))) (v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program)))

let v_Vuna_dCompiler_dCodegen_dProgram_dgenProgramBody = (fun buildText -> (fun program -> ((fun datas -> ((fun defs -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dProgram_dprepareDtProgram program)) (fun p -> ((fun _u -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDecls (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas))) (fun typeText -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups (v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf (v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency dtb__2))) ((v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt (v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas datas)) dtb__2)) dtb__3)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__4, dtb__5) -> ((fun _u -> ((fun text -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (text, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, (v_Vuna_dCompiler_dCodegen_dErase_ddefTable defs)))))))) (if buildText then ((bi_concat (v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime ())) ((bi_concat "\n") ((bi_concat typeText) ((bi_concat (v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge datas)) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n\n") dtb__4))))) else ""))) (v_Vuna_dCompiler_dDebug_dstamp "cg-genGroups-done"))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dDebug_dstamp "cg-typedecls-done"))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDebug_dstamp "cg-prepare-done"))))) (v_Base_dPair_dsecondOf program))) (v_Base_dPair_dfirstOf program))))

let v_Vuna_dCompiler_dCodegen_dProgram_dgenerateDtProgram = (fun program -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dProgram_dgenProgramBody true) program)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__6, dtb__7) -> (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef "main") dtb__8) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dNoMain)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> ((fun mainTy -> ((fun mainRef -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy mainTy) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook dtb__6) dtb__9) dtb__11) ((v_Vuna_dCompiler_dCodegen_dTerm_dioRunText program) mainRef)) printResult)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook dtb__6) dtb__9) mainTy) mainRef) printResult)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName "main"))) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dProgram_dcheckDtProgram = (fun program -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dProgram_dgenProgramBody false) program)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (0)))))
