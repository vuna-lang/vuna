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
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__4) else false)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel = (fun fuel -> (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))) else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if dtb__6 then ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel ((bi_sub fuel) 1)) ctx) dtb__11) head) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__9) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Base_dList_dNil)))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig true) dtb__8))), acc)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) else (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec))))
))))))))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit = (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel 64) ctx) ec) head) ty) acc))))))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun sp -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> (match dtb__12 with
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__13) -> (if (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__13) then ((fun inst -> (C_Base_dResult_dResult_Base_dResult_dOk (inst))) (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit ctx) ec) ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__13)) C_Base_dList_dList_Base_dList_dNil)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__13), ec)))))))
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__14) -> ((((v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef ec) ctx) name) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__14))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) name))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> (match dtb__15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, dtb__17) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, dtb__16)), (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) dtb__16) dtb__17), ec))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup name) ctx)))))))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__18, dtb__19) -> dtb__18
  | _ -> "_"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (match (v_Base_dPair_dsecondOf dtb__20) with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs dtb__21)
  | _ -> ((fun name -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf dtb__20))) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dWhereNeedsSig (name, name))) name) name)) (v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName (v_Base_dPair_dfirstOf dtb__20)))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs = (fun requiresSigs -> (fun binds -> (if requiresSigs then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs binds) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))))
