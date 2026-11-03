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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dModules
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
let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> (if dtb__1 then (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__4) else false)
  | _ -> true
))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel = (fun fuel -> (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))) else (match ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if dtb__6 then ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel ((bi_sub fuel) 1)) ctx) dtb__11) head) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__9) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (m, C_Base_dList_dList_Nil)))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig true) dtb__8))), acc)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec)) else (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec)))))
  | _ -> (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms head) (v_Base_dList_dreverse acc)), (C_Base_dPair_dPair_Base_dPair_dPair (ty, ec))))
))))))))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit = (fun ctx -> (fun ec -> (fun head -> (fun ty -> (fun acc -> ((((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel 64) ctx) ec) head) ty) acc))))))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef = (fun globals -> (fun ctx -> (fun ec -> (fun name -> (fun sp -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup name) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> (match dtb__12 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__13, dtb__14) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (name, dtb__13)), (C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue ctx) dtb__13) dtb__14), ec))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup name) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15) -> ((((v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef ec) ctx) name) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__15))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dshortBoolFamily ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__16)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelZero ()))), ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_dglobalLookup name) globals) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17) -> (if (v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix dtb__17) then ((fun inst -> (C_Base_dResult_dResult_Base_dResult_dOk (inst))) (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit ctx) ec) ((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name)) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__17)) C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) name), (C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) dtb__17), ec)))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) ((bi_concat "[TC_UnknownName] DT: unknown name ") name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName = (fun pat -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__18, dtb__19) -> dtb__18
  | _ -> "_"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match (v_Base_dPair_dsecondOf dtb__20) with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__22, dtb__23, dtb__24) -> (v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs dtb__21)
  | _ -> ((fun name -> ((v_Vuna_dCompiler_dElab_dTypes_derrAt (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf dtb__20))) ((bi_concat "[TC_WhereNeedsSig] DT: where binding `") ((bi_concat name) ((bi_concat "` needs a type signature (write `") ((bi_concat name) " : <type>` before the clause)")))))) (v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName (v_Base_dPair_dfirstOf dtb__20)))
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))
