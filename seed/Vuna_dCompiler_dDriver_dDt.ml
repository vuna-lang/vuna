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
open Vuna_dCompiler_dCodegen_dAssembly
open Vuna_dCompiler_dDriver_dSplit
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
let v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls = (fun parts -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts)))) (v_Base_dPair_dfirstOf parts)))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoad = (fun ctx -> (fun entry -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun project -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts)))) (v_Vuna_dCompiler_dDebug_dstamp "resolve-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-modules-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-start"))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModules = (fun ctx -> (fun names -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules ctx) names)) (fun project -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts)))) (v_Vuna_dCompiler_dDebug_dstamp "resolve-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-modules-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-start"))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls = (fun loaded -> ((v_Base_dResult_dandThen loaded) (fun decls -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgram decls)) (fun program -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram program)) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dDebug_dstamp "codegen-check-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "elab-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "decls-ready")))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheck = (fun ctx -> (fun entry -> (v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibrary = (fun ctx -> (fun names -> (v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModules ctx) names))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource = (fun ctx -> (fun label -> (fun source -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))))))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSource = (fun ctx -> (fun label -> (fun source -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> (v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts)))))))))

let v_Vuna_dCompiler_dDriver_dDt_dmainKindForName = (fun g -> (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("Int")) else (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("String")) else (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("Bool")) else (C_Base_dResult_dResult_Base_dResult_dOk ("Other"))))))

let v_Vuna_dCompiler_dDriver_dDt_dreplExprName = "vuna_repl_expr"

let v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr = (fun decls -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (if ((bi_eq_str dtb__2) v_Vuna_dCompiler_dDriver_dDt_dreplExprName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__1), dtb__4)))) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression definition is not last")))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression was not parsed as a definition"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression was not parsed as a definition"))
)) (v_Base_dList_dreverse decls)))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExpr = (fun ctx -> (fun program -> (fun exprSource -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) "<repl>") ((bi_concat program) ((bi_concat "\n") ((bi_concat v_Vuna_dCompiler_dDriver_dDt_dreplExprName) ((bi_concat " = ") ((bi_concat exprSource) "\n"))))))) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts))) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (v_Base_dPair_dfirstOf p))) (fun prog -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn prog) (v_Base_dPair_dsecondOf p)))))))))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfo = (fun ctx -> (fun program -> (fun exprSource -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) "<repl>") ((bi_concat program) ((bi_concat "\n") ((bi_concat v_Vuna_dCompiler_dDriver_dDt_dreplExprName) ((bi_concat " = ") ((bi_concat exprSource) "\n"))))))) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts))) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (v_Base_dPair_dfirstOf p))) (fun prog -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) (v_Base_dPair_dsecondOf p)))))))))))))

let rec v_Vuna_dCompiler_dDriver_dDt_disIOType = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__6, dtb__7, dtb__8) -> (v_Vuna_dCompiler_dDriver_dDt_disIOType dtb__6)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__9) -> ((bi_eq_str dtb__9) v_Vuna_dCompiler_dIntrinsics_dioFamilyName)
  | _ -> false
))

let rec v_Vuna_dCompiler_dDriver_dDt_dfindMainDef = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__10)) "main") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10)) else (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef dtb__11))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddefTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__12) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__12), dtb__14)), (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf dtb__13)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf dtb__13)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtMainKind = (fun ctx -> (fun entry -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)) (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgram decls)) (fun p -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (v_Base_dPair_dsecondOf p)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> (if (v_Vuna_dCompiler_dDriver_dDt_disIOType (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__15)) then (C_Base_dResult_dResult_Base_dResult_dOk ("IO")) else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dCommon_dtblFromList (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (v_Base_dPair_dsecondOf p)))) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__15))) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__16) -> (match dtb__16 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__17, dtb__18) -> (match dtb__18 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dDriver_dDt_dmainKindForName dtb__17)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ("Other"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ("Other"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ("Other"))
))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dDriver_dDt_devalDtMain = (fun program -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> ((fun table -> ((fun sols -> ((fun mainVal -> (if (v_Vuna_dCompiler_dDriver_dDt_disIOType (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__19)) then (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects) else (match mainVal with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__20) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__20)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__21) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__22) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | _ -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue)
))) ((((v_Vuna_dCompiler_dCore_dEval_dnormalize (v_Vuna_dCompiler_dCommon_dtblFromList table)) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("main", C_Base_dList_dList_Base_dList_dNil))))))) ((v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefVals program)))) (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalFile = (fun ctx -> (fun entry -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)) (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) v_Vuna_dCompiler_dDriver_dDt_devalDtMain)))))

let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject = (fun ctx -> (fun entry -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((fun entryDecls -> ((fun modules -> ((fun allDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull allDecls)) (fun program -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules)) entryDecls) program) printResult)))) ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) modules)) entryDecls))) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts)))) (v_Base_dPair_dfirstOf parts)))))))))
