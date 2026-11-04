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
let rec v_Vuna_dCompiler_dElab_dTermination_dpatNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__0) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__1, dtb__2, dtb__3) -> ((v_Base_dList_dconcatMap (fun q -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (v_Base_dPair_dsecondOf q)))) dtb__2)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__4, dtb__5, dtb__6) -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) dtb__5)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__7, dtb__8) -> (C_Base_dList_dList_Base_dList_dCons (dtb__7, C_Base_dList_dList_Base_dList_dNil))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTermination_dpatsNames = (fun ps -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) ps))

let rec v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__9, dtb__10) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__9)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__11, dtb__12, dtb__13) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__11), ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__12)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt mc0) dtb__14) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, dtb__17) -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts ((v_Base_dList_dappend dtb__16) mc0)) dtb__15) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, dtb__19) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__18, ((v_Base_dList_dappend dtb__17) dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dexprRefsB = (fun bound -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__20, dtb__21) -> (if ((v_Base_dList_dmemName dtb__20) bound) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (dtb__20, C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__22, dtb__23) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__24, dtb__25) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__26, dtb__27, dtb__28) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend dtb__26) bound)) dtb__27)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__29, dtb__30, dtb__31) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__29)) ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound)) dtb__30))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__34)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (C_Base_dList_dList_Base_dList_dCons (dtb__32, bound))) dtb__35))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__37, dtb__38, dtb__39, dtb__40) -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun bd -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (v_Base_dPair_dsecondOf bd)))) dtb__37)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun bd -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (v_Base_dPair_dfirstOf bd)))) dtb__37)) bound)) dtb__38))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__41, dtb__42, dtb__43) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__41)) ((v_Base_dList_dconcatMap (fun alt -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatNames (v_Base_dPair_dfirstOf alt))) bound)) (v_Base_dPair_dsecondOf alt)))) dtb__42))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__44, dtb__45, dtb__46, dtb__47) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__44)) ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__45)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__46)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__48, dtb__49, dtb__50) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__48)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__51, dtb__52, dtb__53) -> ((v_Base_dList_dconcatMap (fun q -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (v_Base_dPair_dsecondOf q)))) dtb__52)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__54, dtb__55, dtb__56) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__54)) ((v_Base_dList_dconcatMap (fun q -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (v_Base_dPair_dsecondOf q)))) dtb__55))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__57, dtb__58) -> (v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts bound) dtb__57))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__59, dtb__60, dtb__61) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__59)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__60))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__62, dtb__63) -> ((v_Base_dList_dconcatMap (fun c -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (v_Base_dPair_dfirstOf c))) bound)) (v_Base_dPair_dsecondOf c)))) dtb__62)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_drefsOfDef = (fun clauses -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Base_dList_dconcatMap (fun c -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (v_Base_dPair_dfirstOf c))) (v_Base_dPair_dsecondOf c)))) clauses)))

let rec v_Vuna_dCompiler_dElab_dTermination_dmapEdges = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__64), ((v_Base_dList_dfilter (fun r -> ((v_Vuna_dCompiler_dCommon_dtblMem r) mc0))) (v_Vuna_dCompiler_dElab_dTermination_drefsOfDef (v_Base_dPair_dsecondOf dtb__64))))), ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges mc0) dtb__65)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dcallGraph = (fun defs -> ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges (v_Vuna_dCompiler_dCommon_dtblOfNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) defs))

let v_Vuna_dCompiler_dElab_dTermination_dadjOf = (fun n -> (fun g -> (match ((v_Vuna_dCompiler_dCommon_dtblLookup n) g) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66) -> dtb__66
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dadjTblOf = (fun g -> ((v_Vuna_dCompiler_dCommon_dtblInsertAll g) v_Vuna_dCompiler_dCommon_dtblEmpty))

let rec v_Vuna_dCompiler_dElab_dTermination_daddSrcs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> ((fun cur -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs mc0) dtb__68) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__67) (C_Base_dList_dList_Base_dList_dCons (mc0, cur))) mc2))) (match ((v_Vuna_dCompiler_dCommon_dtblLookup dtb__67) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> dtb__69
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (match dtb__70 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__72, dtb__73) -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs dtb__72) dtb__73) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf dtb__71))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> v_Vuna_dCompiler_dCommon_dtblEmpty
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dreplacePair = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__74, dtb__75) -> (match dtb__74 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77) -> (if ((bi_eq_str dtb__76) mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__75)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77)), (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair mc0) mc1) dtb__75))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_daddEdge = (fun n -> (fun m -> (fun acc -> (match ((v_Base_dList_dlookupPair n) acc) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__78) -> (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair n) (C_Base_dList_dList_Base_dList_dCons (m, dtb__78))) acc)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (n, (C_Base_dList_dList_Base_dList_dCons (m, C_Base_dList_dList_Base_dList_dNil)))), acc))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTermination_daddEdges = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (((v_Vuna_dCompiler_dElab_dTermination_daddEdges mc0) dtb__80) (((v_Vuna_dCompiler_dElab_dTermination_daddEdge dtb__79) mc0) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dElab_dTermination_dtransposeGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__81, dtb__82) -> (match dtb__81 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo dtb__82) (((v_Vuna_dCompiler_dElab_dTermination_daddEdges dtb__83) dtb__84) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (match dtb__85 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__88))), (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed dtb__86)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dtranspose = (fun g -> (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo g) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dTermination_dedgeCount = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__89, dtb__90) -> (match dtb__89 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> ((bi_add (v_Base_dList_dlength dtb__92)) (v_Vuna_dCompiler_dElab_dTermination_dedgeCount dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dgraphFuel = (fun g -> (fun nodes -> ((bi_add ((bi_add ((bi_mul 4) (v_Base_dList_dlength nodes))) ((bi_mul 4) (v_Vuna_dCompiler_dElab_dTermination_dedgeCount g)))) 16)))

let rec v_Vuna_dCompiler_dElab_dTermination_ddfsPost = (fun steps -> (fun fuel -> (fun g -> (fun visited -> (fun post -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, post)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (if dtb__96 then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__94) ((bi_sub fuel) 1)) g) visited) (C_Base_dList_dList_Base_dList_dCons (dtb__95, post))) else (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__95) visited) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__94) ((bi_sub fuel) 1)) g) visited) post) else (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost ((v_Base_dList_dappend ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair (m, false)))) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__95) g))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, true)), dtb__94)))) ((bi_sub fuel) 1)) g) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__95) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, post))
  | _ -> failwith "DT: impossible branch"
)) steps)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_ddfsAll = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (if ((bi_le_int mc1) 0) then mc4 else (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__97) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__98) ((bi_sub mc1) 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, false)), C_Base_dList_dList_Base_dList_dNil))) mc1) mc2) mc3) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__98) ((bi_sub mc1) 1)) mc2) dtb__99) dtb__100)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dpostOrder = (fun gT -> (fun g -> (fun nodes -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll nodes) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes)) gT) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dTermination_dcollectComp = (fun stack -> (fun fuel -> (fun rg -> (fun assigned -> (fun comp -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (assigned, comp)) else (match stack with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (assigned, comp))
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__101) assigned) then (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp dtb__102) ((bi_sub fuel) 1)) rg) assigned) comp) else (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__101) rg)) dtb__102)) ((bi_sub fuel) 1)) rg) (((v_Vuna_dCompiler_dCommon_dtblInsert dtb__101) true) assigned)) (C_Base_dList_dList_Base_dList_dCons (dtb__101, comp))))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dsccOf = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (if ((bi_le_int mc1) 0) then mc4 else (if ((v_Vuna_dCompiler_dCommon_dtblMem dtb__103) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__104) ((bi_sub mc1) 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp (C_Base_dList_dList_Base_dList_dCons (dtb__103, C_Base_dList_dList_Base_dList_dNil))) ((bi_sub mc1) 1)) mc2) mc3) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__104) ((bi_sub mc1) 1)) mc2) dtb__105) (C_Base_dList_dList_Base_dList_dCons (dtb__106, mc4)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__107 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__110))), dtb__110)), (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__108)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dstrWalk = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun p -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (fun e -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__111, dtb__112, dtb__113) -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__111) dtb__112) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__114, dtb__115, dtb__116) -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__114) dtb__115) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__114) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__117, dtb__118, dtb__119, dtb__120) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__117) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__121) -> ((fun acc1 -> ((fun acc2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) (C_Base_dList_dList_Base_dList_dCons (dtb__121, region))) dtb__119) acc2)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__118) acc1))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__117) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__119) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__118) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__117) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__122, dtb__123, dtb__124) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__123) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__125, dtb__126, dtb__127, dtb__128) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__126) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__125) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__132) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__131) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__134, dtb__135, dtb__136) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__134) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__137, dtb__138, dtb__139) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__138) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__140, dtb__141, dtb__142) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__141) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__140) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__143, dtb__144) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__143) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__145, dtb__146, dtb__147) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__146) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__145) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__148, dtb__149) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__148)) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__150, dtb__151) -> (if ((v_Base_dList_dmemName dtb__150) comp) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc) else acc)
  | _ -> acc
)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun p -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__152) -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) args) sizes) ctors) projs) caller) facts) region) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) dtb__152) dtb__153) acc))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__154, dtb__155) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__154) then ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
))))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun p -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (match dtb__156 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__158, dtb__159, dtb__160) -> (match dtb__158 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (match dtb__162 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (match dtb__164 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun acc1 -> ((fun sizes2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__159) acc1)) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__163) dtb__161))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__163) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (match dtb__166 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__167, dtb__168) -> (if ((v_Base_dList_dmemName dtb__167) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__167) C_Base_dList_dList_Base_dList_dNil) dtb__165) dtb__168) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__169, dtb__170, dtb__171) -> (match dtb__169 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__172, dtb__173) -> (if ((v_Base_dList_dmemName dtb__172) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__172) dtb__170) dtb__165) dtb__171) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__156)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__174, dtb__175) -> (match dtb__175 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__176, dtb__177) -> (if ((v_Base_dList_dmemName dtb__176) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__176) C_Base_dList_dList_Base_dList_dNil) dtb__174) dtb__177) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__178, dtb__179, dtb__180) -> (match dtb__178 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__181, dtb__182) -> (if ((v_Base_dList_dmemName dtb__181) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__181) dtb__179) dtb__174) dtb__180) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__156)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__184) -> (match dtb__184 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__185, dtb__186) -> (if ((v_Base_dList_dmemName dtb__185) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__185) C_Base_dList_dList_Base_dList_dNil) dtb__183) dtb__186) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__187, dtb__188, dtb__189) -> (match dtb__187 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__190, dtb__191) -> (if ((v_Base_dList_dmemName dtb__190) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__190) dtb__188) dtb__183) dtb__189) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__156)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) args))))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun p -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (fun g -> (fun pargs -> (fun lst -> (fun cbsp -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) g) dtb__192) acc2)
  | _ -> failwith "DT: impossible branch"
)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1))) ((v_Base_dList_dappend pargs) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("$elem", cbsp)), C_Base_dList_dList_Base_dList_dNil))))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc)))))))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun p -> (fun sizes -> (fun caller -> (fun facts -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub fuel) 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc)))))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> (if ((bi_le_int mc0) 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__194) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__193) mc10)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (fun mc11 -> (match mc10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (match dtb__195 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__197, dtb__198) -> (if ((bi_le_int mc0) 0) then mc11 else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__196) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc5) mc9) dtb__197)) mc6) mc7) mc8) dtb__198) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match dtb__199 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> (if ((bi_le_int mc0) 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__200) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__202) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__203, dtb__204) -> (match dtb__203 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (if ((bi_le_int mc0) 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__204) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__206) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__207, dtb__208) -> (if ((bi_le_int mc0) 0) then mc10 else (match dtb__207 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__209, dtb__210, dtb__211) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__208) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__210) mc10))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__212, dtb__213) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__208) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__212) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))

let v_Vuna_dCompiler_dElab_dTermination_dstrClause = (fun comp -> (fun ctors -> (fun projs -> (fun p -> (fun caller -> (fun facts -> (fun clause -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk 100000) comp) ctors) projs) p) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf clause))) caller) facts) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf clause)) (C_Base_dPair_dPair_Base_dPair_dPair (true, C_Base_dList_dList_Base_dList_dNil))))))))))

let v_Vuna_dCompiler_dElab_dTermination_dgroupMessage = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__214, dtb__215) -> (match dtb__215 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat dtb__214) " (recursive call does not structurally decrease)")
  | _ -> ((bi_concat "recursive group {") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0)) "} (mutual recursion: no parameter position decreases on every recursive call)"))
)
  | _ -> ((bi_concat "recursive group {") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0)) "} (mutual recursion: no parameter position decreases on every recursive call)"))
))

let v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg = (fun comp -> ((fun desc -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotProveTermination (desc))) (C_Base_dVec_dVec_Base_dVec_dVCons (desc, C_Base_dVec_dVec_Base_dVec_dVNil)))) (v_Vuna_dCompiler_dElab_dTermination_dgroupMessage comp)))

let rec v_Vuna_dCompiler_dElab_dTermination_dcollectClauses = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (if (v_Base_dPair_dfirstOf mc7) then (match (((((((v_Vuna_dCompiler_dElab_dTermination_dstrClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__216) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219) -> (if dtb__218 then ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses dtb__217) mc1) mc2) mc3) mc4) mc5) mc6) (C_Base_dPair_dPair_Base_dPair_dPair (true, ((v_Base_dList_dappend (v_Base_dPair_dsecondOf mc7)) dtb__219)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (false, (v_Base_dPair_dsecondOf mc7))))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk (mc7)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc7))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__220, dtb__221) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__220) mc1)) mc0) mc2) mc3) mc4) dtb__220) mc5) mc7)) (fun acc2 -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__221) acc2)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc7))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun remaining -> (fun maxP -> (if ((bi_le_int remaining) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg comp))) else ((fun p -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure comp) defs) ctors) projs) p) facts) comp) (C_Base_dPair_dPair_Base_dPair_dPair (true, C_Base_dList_dList_Base_dList_dNil))) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__222) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__222))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__223) -> (match dtb__223 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__224, dtb__225) -> (if dtb__224 then ((fun modes -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty modes) then (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame modes) then (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) dtb__225) then (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) ((bi_sub remaining) 1)) maxP) else (C_Base_dResult_dResult_Base_dResult_dOk (0))) else (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) ((bi_sub remaining) 1)) maxP)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) ((bi_sub remaining) 1)) maxP))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((v_Base_dList_dmap v_Base_dPair_dsecondOf) dtb__225))) else (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) ((bi_sub remaining) 1)) maxP))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((bi_sub maxP) remaining))))))))))

let v_Vuna_dCompiler_dElab_dTermination_dtryMeasure = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun p -> (fun maxP -> (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) ((bi_sub maxP) p)) maxP))))))))

let v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (match (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasure comp) defs) ctors) projs) facts) 0) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf comp) defs)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__226) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__226))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__227) -> (match ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread comp) defs) ctors) projs) facts) dtb__227) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__228) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__228))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__229) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck comp) defs) ctors) projs) facts) dtb__229)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dcheckComp = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun g -> (fun facts -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__230, dtb__231) -> (match dtb__231 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Base_dList_dmemName dtb__230) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__230) g)) then (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup comp) defs) ctors) projs) facts) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup comp) defs) ctors) projs) facts)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)) comp)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dcheckSccs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckComp dtb__232) mc1) mc2) mc3) mc4) mc5)) (fun n -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccs dtb__233) mc1) mc2) mc3) mc4) mc5)) (fun m -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_add n) m)))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls = (fun decls -> ((fun defs -> ((fun ctors -> ((fun projs -> ((fun facts -> ((fun g -> ((fun gT -> ((fun nodes -> ((fun rgT -> ((fun fuel -> ((fun post -> ((fun comps -> ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccs (v_Base_dList_dreverse comps)) defs) ctors) projs) gT) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf post) fuel) rgT) v_Vuna_dCompiler_dCommon_dtblEmpty) C_Base_dList_dList_Base_dList_dNil))) (((v_Vuna_dCompiler_dElab_dTermination_dpostOrder gT) g) nodes))) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes))) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf g))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) (v_Vuna_dCompiler_dElab_dTermination_dadjTblOf g))) (v_Vuna_dCompiler_dElab_dTermination_dcallGraph defs))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) 16) C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf defs))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf decls))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs decls)))
