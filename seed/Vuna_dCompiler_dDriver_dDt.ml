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
open Vuna_dCompiler_dCodegen_dSplit
open Vuna_dCompiler_dCodegen
let v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls = (fun parts -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts)))) (v_Base_dPair_dfirstOf parts)))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoad = (fun ctx entry -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun project -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts)))) (v_Vuna_dCompiler_dDebug_dstamp "resolve-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-modules-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-start")))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadModules = (fun ctx names -> ((fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules ctx) names)) (fun project -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts)))) (v_Vuna_dCompiler_dDebug_dstamp "resolve-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-modules-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "load-start")))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls = (fun loaded -> ((v_Base_dResult_dandThen loaded) (fun decls -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgram decls)) (fun program -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram program)) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dDebug_dstamp "codegen-check-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "elab-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "decls-ready")))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckDeclsWithProgram = (fun loaded -> ((v_Base_dResult_dandThen loaded) (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) (fun program -> ((fun _u -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas program), (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program))))) (fun _u -> ((fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, program))))) (v_Vuna_dCompiler_dDebug_dstamp "codegen-check-done"))))) (v_Vuna_dCompiler_dDebug_dstamp "elab-done")))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgram = (fun ctx entry -> (v_Vuna_dCompiler_dDriver_dDt_ddtCheckDeclsWithProgram ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgram = (fun ctx names -> (v_Vuna_dCompiler_dDriver_dDt_ddtCheckDeclsWithProgram ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModules ctx) names)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheck = (fun ctx entry -> (v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibrary = (fun ctx names -> (v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadModules ctx) names)))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource = (fun ctx label source -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil)))))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSource = (fun ctx label source -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource ctx) label) source)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> (v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts)))))))

let v_Vuna_dCompiler_dDriver_dDt_dmainKindForName = (fun g -> (if (g = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("Int")) else (if (g = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("String")) else (if (g = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("Bool")) else (C_Base_dResult_dResult_Base_dResult_dOk ("Other"))))))

let v_Vuna_dCompiler_dDriver_dDt_dreplExprName = "vuna_repl_expr"

let v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr = (fun decls -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__2, dtb__3, dtb__4, dtb__5) -> (if (dtb__2 = v_Vuna_dCompiler_dDriver_dDt_dreplExprName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse dtb__1), dtb__4)))) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression definition is not last")))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression was not parsed as a definition"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: REPL expression was not parsed as a definition"))
)) (v_Base_dList_dreverse decls)))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExpr = (fun ctx program exprSource -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) "<repl>") (String.concat "" [program; "\n"; v_Vuna_dCompiler_dDriver_dDt_dreplExprName; " = "; exprSource; "\n"]))) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts))) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (v_Base_dPair_dfirstOf p))) (fun prog -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn prog) (v_Base_dPair_dsecondOf p)))))))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfo = (fun ctx program exprSource -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource ctx) "<repl>") (String.concat "" [program; "\n"; v_Vuna_dCompiler_dDriver_dDt_dreplExprName; " = "; exprSource; "\n"]))) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr (v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls parts))) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull (v_Base_dPair_dfirstOf p))) (fun prog -> ((v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo prog) (v_Base_dPair_dsecondOf p)))))))))))

let rec v_Vuna_dCompiler_dDriver_dDt_disIOType = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__6) -> (dtb__6 = v_Vuna_dCompiler_dIntrinsics_dioFamilyName)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__7, dtb__8, dtb__9) -> (v_Vuna_dCompiler_dDriver_dDt_disIOType dtb__7)
  | _ -> false
))

let rec v_Vuna_dCompiler_dDriver_dDt_dfindMainDef = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__10) = "main") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10)) else (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef dtb__11))
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

let v_Vuna_dCompiler_dDriver_dDt_ddtMainKind = (fun ctx entry -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)) (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgram decls)) (fun p -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (v_Base_dPair_dsecondOf p)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> (if (v_Vuna_dCompiler_dDriver_dDt_disIOType (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__15)) then (C_Base_dResult_dResult_Base_dResult_dOk ("IO")) else (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Base_dHashMap_dfromList (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (v_Base_dPair_dsecondOf p)))) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__15))) with
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
))))))

let v_Vuna_dCompiler_dDriver_dDt_devalDtMain = (fun program -> (match (v_Vuna_dCompiler_dDriver_dDt_dfindMainDef (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dNoMain)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__19) -> ((fun table -> ((fun sols -> ((fun mainVal -> (if (v_Vuna_dCompiler_dDriver_dDt_disIOType (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__19)) then (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dInterpCannotExecuteEffects) else (match mainVal with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVInt (dtb__20) -> (C_Base_dResult_dResult_Base_dResult_dOk ((bi_strFromInt dtb__20)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVStr (dtb__21) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVBool (dtb__22) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCore_dEval_dshowValue mainVal)))
  | _ -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainNotValue)
))) ((((v_Vuna_dCompiler_dCore_dEval_dnormalize (v_Base_dHashMap_dfromList table)) sols) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("main", C_Base_dList_dList_Base_dList_dNil))))))) ((v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefVals program)))) (v_Vuna_dCompiler_dDriver_dDt_ddefTableOf (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs program)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtEvalFile = (fun ctx entry -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dDt_ddtLoad ctx) entry)) (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull decls)) v_Vuna_dCompiler_dDriver_dDt_devalDtMain))))

let v_Vuna_dCompiler_dDriver_dDt_ddtSplitProject = (fun ctx entry printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun project -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project)) (fun parts -> ((fun entryDecls -> ((fun modules -> ((fun allDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDriver_delabProgramFull allDecls)) (fun program -> ((((v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf m), (v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf m))))) modules)) entryDecls) program) printResult)))) ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) modules)) entryDecls))) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts)))) (v_Base_dPair_dfirstOf parts)))))))

let v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts = (fun ctx entry -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFlatten_dloadProject ctx) entry)) (fun project -> (v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject project))))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupDatas = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__23)) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) dtb__24)) then (v_Vuna_dCompiler_dDriver_dDt_ddedupDatas dtb__24) else (C_Base_dList_dList_Base_dList_dCons (dtb__23, (v_Vuna_dCompiler_dDriver_dDt_ddedupDatas dtb__24))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupInsts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtInstName dtb__25)) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtInstName) dtb__26)) then (v_Vuna_dCompiler_dDriver_dDt_ddedupInsts dtb__26) else (C_Base_dList_dList_Base_dList_dCons (dtb__25, (v_Vuna_dCompiler_dDriver_dDt_ddedupInsts dtb__26))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupClasses = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtClassName dtb__27)) ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtClassName) dtb__28)) then (v_Vuna_dCompiler_dDriver_dDt_ddedupClasses dtb__28) else (C_Base_dList_dList_Base_dList_dCons (dtb__27, (v_Vuna_dCompiler_dDriver_dDt_ddedupClasses dtb__28))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((v_Base_dList_dmemName (v_Base_dPair_dfirstOf dtb__29)) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__30)) then (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals dtb__30) else (C_Base_dList_dList_Base_dList_dCons (dtb__29, (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals dtb__30))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddepStartOf = (fun progs -> ((fun datas -> ((fun defGlobals -> ((fun globals -> ((fun ec0 -> ((fun ec1 -> ((fun ec2 -> ((fun ec3 -> ((fun ec4 -> ((fun ec5 -> ((fun ec6 -> (C_Base_dPair_dPair_Base_dPair_dPair (ec6, globals))) ((v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl ec5) (v_Base_dHashMap_dfromList defGlobals)))) ((v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl ec4) (v_Base_dHashMap_dfromList globals)))) ((v_Vuna_dCompiler_dElab_dTypes_decPutNext ec3) 0))) ((v_Vuna_dCompiler_dElab_dDriver_daddClassesEc ec2) (v_Vuna_dCompiler_dDriver_dDt_ddedupClasses ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses) progs))))) ((v_Vuna_dCompiler_dElab_dDriver_daddInstsEc ec1) (v_Vuna_dCompiler_dDriver_dDt_ddedupInsts ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts) progs))))) ((v_Vuna_dCompiler_dElab_dDriver_daddDatasEc ec0) datas))) v_Vuna_dCompiler_dElab_dTypes_decEmpty)) ((v_Base_dList_dappend defGlobals) ((v_Base_dList_dmap (fun d -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (v_Vuna_dCompiler_dElab_dTypes_ddtDataKind d))))) datas)))) ((v_Base_dList_dfilter (fun p -> (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) ((v_Base_dList_dmemName (v_Base_dPair_dfirstOf p)) ((v_Base_dList_dappend ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas)) ((v_Base_dList_dconcatMap (fun d -> ((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtCtorName) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))) datas)))) false))) ((v_Base_dList_dappend v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals) (v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals) progs)))))) (v_Vuna_dCompiler_dDriver_dDt_ddedupDatas ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas) progs))))

let rec v_Vuna_dCompiler_dDriver_dDt_dmaxNext = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtProgNext dtb__31) > (v_Vuna_dCompiler_dDriver_dDt_dmaxNext dtb__32)) then (v_Vuna_dCompiler_dElab_dTypes_ddtProgNext dtb__31) else (v_Vuna_dCompiler_dDriver_dDt_dmaxNext dtb__32))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddefsHaveMetas = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (if ((v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Vuna_dCompiler_dElab_dTypes_ddtDefType dtb__33))) > 0) then true else (v_Vuna_dCompiler_dDriver_dDt_ddefsHaveMetas dtb__34))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dglobalsHaveMetas = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (if ((v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Base_dPair_dsecondOf dtb__35))) > 0) then true else (v_Vuna_dCompiler_dDriver_dDt_dglobalsHaveMetas dtb__36))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_ddatasHaveMetas = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (if ((v_Base_dList_dlength ((v_Base_dList_dconcatMap (fun c -> (v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__37))) > 0) then true else (v_Vuna_dCompiler_dDriver_dDt_ddatasHaveMetas dtb__38))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dinstsHaveMetas = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (if ((v_Base_dList_dlength ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) (v_Vuna_dCompiler_dElab_dTypes_ddtInstCtx dtb__39))) > 0) then true else (v_Vuna_dCompiler_dDriver_dDt_dinstsHaveMetas dtb__40))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDt_dclassesHaveMetas = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (if ((v_Base_dList_dlength ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll) (v_Vuna_dCompiler_dElab_dTypes_ddtClassFieldTys dtb__41))) > 0) then true else (v_Vuna_dCompiler_dDriver_dDt_dclassesHaveMetas dtb__42))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtProgramHasMetas = (fun prog -> (if (if (if (if (v_Vuna_dCompiler_dDriver_dDt_ddefsHaveMetas (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog)) then true else (v_Vuna_dCompiler_dDriver_dDt_dglobalsHaveMetas (v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals prog))) then true else (v_Vuna_dCompiler_dDriver_dDt_ddatasHaveMetas (v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog))) then true else (v_Vuna_dCompiler_dDriver_dDt_dinstsHaveMetas (v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts prog))) then true else (v_Vuna_dCompiler_dDriver_dDt_dclassesHaveMetas (v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses prog))))

let rec v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (match dtb__43 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (if (dtb__45 = mc0) then (v_Vuna_dCompiler_dCore_dTerm_dshowTerm dtb__46) else ((v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf mc0) dtb__44))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> "MISSING"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithDeps = (fun ctx entry deps -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts ctx) entry)) (fun parts -> ((fun pkgName -> ((fun ours -> ((fun decls -> ((fun start -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith (v_Base_dPair_dfirstOf start)) (v_Base_dPair_dsecondOf start)) decls)) (fun prog -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas prog), (v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs prog))))) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, prog))))))))) (v_Vuna_dCompiler_dDebug_dnote ("summ-IO=" ^ ((v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf "Base.IO.IO") (v_Base_dPair_dsecondOf start)))))) (v_Vuna_dCompiler_dDebug_dnote ("summ-runIO=" ^ ((v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf "Base.IO.runIO") (v_Base_dPair_dsecondOf start)))))) (v_Vuna_dCompiler_dDebug_dnote ("summ-getenv=" ^ ((v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf "prim_getenv") (v_Base_dPair_dsecondOf start)))))) (v_Vuna_dCompiler_dDebug_dnote ("summ-Pair=" ^ ((v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf "Pair") (v_Base_dPair_dsecondOf start)))))) v_Vuna_dCompiler_dDebug_dnote)) v_Vuna_dCompiler_dDebug_dnote)) (v_Vuna_dCompiler_dDebug_dnote ("summ-List=" ^ ((v_Vuna_dCompiler_dDriver_dDt_dglobalTextOf "List") (v_Base_dPair_dsecondOf start)))))) (v_Vuna_dCompiler_dDriver_dDt_ddepStartOf deps))) ((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf) ours)) (v_Base_dPair_dfirstOf parts)))) ((v_Base_dList_dfilter (fun m -> ((v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf m) = pkgName))) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf parts))))) (v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName ctx)))))
