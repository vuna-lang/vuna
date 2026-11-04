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
let v_Vuna_dCompiler_dElab_dTerm_ddeferDictBinder = (fun globals -> (fun ctx -> (fun ec -> (fun dom -> (fun clo -> (fun args -> (fun sp -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel 64) globals) ctx) ec) dom) clo) args) sp))))))))

let v_Vuna_dCompiler_dElab_dTerm_dspecializeCmpApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dspecializeEqApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel 256) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel 256) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferLetIgnored = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferLetBound = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferLet = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferLetGo = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckAppCtor = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckAppUnderType = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dspecializeBoolApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLam = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLetOne = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLet = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLitBoundVar = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9))))))))))

let v_Vuna_dCompiler_dElab_dTerm_dlitAltStep = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> (fun a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10)))))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLitCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckLitAlts = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckBoolCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dboolAlt = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dboolAltGo = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_delabCatchAll = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> (fun a10 -> (fun a11 -> (fun a12 -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11) a12)))))))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckE = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel 256) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferPi = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferAnn = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckType = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel 256) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dElab_dTerm_dinferAppUnderType = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferArgs = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDom = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneralGo = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckCondBool = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel 256) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dElab_dTerm_dinferE = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel 256) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dElab_dTerm_dinferCaseE = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel 256) a1) a2) a3) a4) a5) a6)))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel 256) a1) a2) a3) a4) a5) a6) a7))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckCaseFam = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel 256) a1) a2) a3) a4) a5) a6) a7) a8)))))))))

let v_Vuna_dCompiler_dElab_dTerm_dcheckCaseOf = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> (fun a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10)))))))))))

let v_Vuna_dCompiler_dElab_dTerm_delabCaseAlts = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> (fun a10 -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10)))))))))))

let v_Vuna_dCompiler_dElab_dTerm_delabConAlt = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> (fun a6 -> (fun a7 -> (fun a8 -> (fun a9 -> (fun a10 -> (fun a11 -> ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel 256) a1) a2) a3) a4) a5) a6) a7) a8) a9) a10) a11))))))))))))
