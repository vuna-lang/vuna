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
let rec v_Vuna_dCompiler_dElab_dTermination_dpatNames = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__0) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__1, dtb__2, dtb__3) -> ((v_Base_dList_dconcatMap (fun q -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (v_Base_dPair_dsecondOf q)))) dtb__2)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__4, dtb__5, dtb__6) -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) dtb__5)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__7, dtb__8, dtb__9) -> (C_Base_dList_dList_Base_dList_dCons (dtb__7, (v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__8)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__10, dtb__11) -> (C_Base_dList_dList_Base_dList_dCons (dtb__10, C_Base_dList_dList_Base_dList_dNil))
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTermination_dpatsNames = (fun ps -> ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dTermination_dpatNames) ps))

let rec v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__12, dtb__13) -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__12)))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__14, dtb__15, dtb__16) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTermination_dpatNames dtb__14), ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB mc0) dtb__15)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt mc0) dtb__17) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> (match ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts ((v_Base_dList_dappend dtb__19) mc0)) dtb__18) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> (C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, ((v_Base_dList_dappend dtb__20) dtb__22)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dexprRefsB = (fun bound e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__23, dtb__24) -> (if ((v_Base_dList_dmemName dtb__23) bound) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons (dtb__23, C_Base_dList_dList_Base_dList_dNil)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__25, dtb__26) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__27, dtb__28) -> C_Base_dList_dList_Base_dList_dNil
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__29, dtb__30, dtb__31) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend dtb__29) bound)) dtb__30)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__32, dtb__33, dtb__34) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__32)) ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound)) dtb__33))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__37)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (C_Base_dList_dList_Base_dList_dCons (dtb__35, bound))) dtb__38))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__40, dtb__41, dtb__42, dtb__43) -> ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun bd -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (v_Base_dPair_dsecondOf bd)))) dtb__40)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend ((v_Base_dList_dconcatMap (fun bd -> (v_Vuna_dCompiler_dElab_dTermination_dpatNames (v_Base_dPair_dfirstOf bd)))) dtb__40)) bound)) dtb__41))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__44, dtb__45, dtb__46) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__44)) ((v_Base_dList_dconcatMap (fun alt -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatNames (v_Base_dPair_dfirstOf alt))) bound)) (v_Base_dPair_dsecondOf alt)))) dtb__45))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__47, dtb__48, dtb__49, dtb__50) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__47)) ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__48)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__49)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__51, dtb__52, dtb__53) -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__51)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__54, dtb__55, dtb__56) -> ((v_Base_dList_dconcatMap (fun q -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (v_Base_dPair_dsecondOf q)))) dtb__55)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__57, dtb__58, dtb__59) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__57)) ((v_Base_dList_dconcatMap (fun q -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) (v_Base_dPair_dsecondOf q)))) dtb__58))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__60, dtb__61) -> (v_Base_dPair_dsecondOf ((v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts bound) dtb__60))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__62, dtb__63, dtb__64) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__62)) ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB bound) dtb__63))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__65, dtb__66) -> ((v_Base_dList_dconcatMap (fun c -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB ((v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (v_Base_dPair_dfirstOf c))) bound)) (v_Base_dPair_dsecondOf c)))) dtb__65)
  | _ -> C_Base_dList_dList_Base_dList_dNil
))

let v_Vuna_dCompiler_dElab_dTermination_drefsOfDef = (fun clauses -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup ((v_Base_dList_dconcatMap (fun c -> ((v_Vuna_dCompiler_dElab_dTermination_dexprRefsB (v_Vuna_dCompiler_dElab_dTermination_dpatsNames (v_Base_dPair_dfirstOf c))) (v_Base_dPair_dsecondOf c)))) clauses)))

let rec v_Vuna_dCompiler_dElab_dTermination_dmapEdges = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__67, dtb__68) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf dtb__67), ((v_Base_dList_dfilter (fun r -> ((v_Base_dHashMap_dmember r) mc0))) (v_Vuna_dCompiler_dElab_dTermination_drefsOfDef (v_Base_dPair_dsecondOf dtb__67))))), ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges mc0) dtb__68)))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dcallGraph = (fun defs -> ((v_Vuna_dCompiler_dElab_dTermination_dmapEdges (v_Base_dHashMap_dofNames (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) defs))

let v_Vuna_dCompiler_dElab_dTermination_dadjOf = (fun n g -> (match ((v_Base_dHashMap_dlookup n) g) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__69) -> dtb__69
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dadjTblOf = (fun g -> ((v_Base_dHashMap_dinsertAll g) v_Base_dHashMap_dempty))

let rec v_Vuna_dCompiler_dElab_dTermination_daddSrcs = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> ((fun cur -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs mc0) dtb__71) (((v_Base_dHashMap_dinsert dtb__70) (C_Base_dList_dList_Base_dList_dCons (mc0, cur))) mc2))) (match ((v_Base_dHashMap_dlookup dtb__70) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__72) -> dtb__72
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__73, dtb__74) -> (match dtb__73 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__75, dtb__76) -> (((v_Vuna_dCompiler_dElab_dTermination_daddSrcs dtb__75) dtb__76) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf dtb__74))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> v_Base_dHashMap_dempty
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dreplacePair = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> (match dtb__77 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80) -> (if (dtb__79 = mc0) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), dtb__78)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__79, dtb__80)), (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair mc0) mc1) dtb__78))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_daddEdge = (fun n m acc -> (match ((v_Base_dList_dlookupPair n) acc) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__81) -> (((v_Vuna_dCompiler_dElab_dTermination_dreplacePair n) (C_Base_dList_dList_Base_dList_dCons (m, dtb__81))) acc)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (n, (C_Base_dList_dList_Base_dList_dCons (m, C_Base_dList_dList_Base_dList_dNil)))), acc))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_daddEdges = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (((v_Vuna_dCompiler_dElab_dTermination_daddEdges mc0) dtb__83) (((v_Vuna_dCompiler_dElab_dTermination_daddEdge dtb__82) mc0) mc2))
  | C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dtransposeGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (match dtb__84 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo dtb__85) (((v_Vuna_dCompiler_dElab_dTermination_daddEdges dtb__86) dtb__87) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (match dtb__88 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup dtb__91))), (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed dtb__89)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dtranspose = (fun g -> (v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed ((v_Vuna_dCompiler_dElab_dTermination_dtransposeGo g) C_Base_dList_dList_Base_dList_dNil)))

let rec v_Vuna_dCompiler_dElab_dTermination_dedgeCount = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (match dtb__92 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> ((v_Base_dList_dlength dtb__95) + (v_Vuna_dCompiler_dElab_dTermination_dedgeCount dtb__93))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dgraphFuel = (fun g nodes -> (((4 * (v_Base_dList_dlength nodes)) + (4 * (v_Vuna_dCompiler_dElab_dTermination_dedgeCount g))) + 16))

let rec v_Vuna_dCompiler_dElab_dTermination_ddfsPost = (fun steps fuel g visited post -> (if (fuel <= 0) then (C_Base_dPair_dPair_Base_dPair_dPair (visited, post)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (match dtb__96 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> (if dtb__99 then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__97) (fuel - 1)) g) visited) (C_Base_dList_dList_Base_dList_dCons (dtb__98, post))) else (if ((v_Base_dHashMap_dmember dtb__98) visited) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost dtb__97) (fuel - 1)) g) visited) post) else (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost ((v_Base_dList_dappend ((v_Base_dList_dmap (fun m -> (C_Base_dPair_dPair_Base_dPair_dPair (m, false)))) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__98) g))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, true)), dtb__97)))) (fuel - 1)) g) (((v_Base_dHashMap_dinsert dtb__98) true) visited)) post)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (visited, post))
  | _ -> failwith "DT: impossible branch"
)) steps)))

let rec v_Vuna_dCompiler_dElab_dTermination_ddfsAll = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (if (mc1 <= 0) then mc4 else (if ((v_Base_dHashMap_dmember dtb__100) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__101) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_ddfsPost (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, false)), C_Base_dList_dList_Base_dList_dNil))) mc1) mc2) mc3) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__102, dtb__103) -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll dtb__101) (mc1 - 1)) mc2) dtb__102) dtb__103)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dpostOrder = (fun gT g nodes -> (((((v_Vuna_dCompiler_dElab_dTermination_ddfsAll nodes) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes)) gT) v_Base_dHashMap_dempty) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTermination_dcollectComp = (fun stack fuel rg assigned comp -> (if (fuel <= 0) then (C_Base_dPair_dPair_Base_dPair_dPair (assigned, comp)) else (match stack with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (assigned, comp))
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (if ((v_Base_dHashMap_dmember dtb__104) assigned) then (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp dtb__105) (fuel - 1)) rg) assigned) comp) else (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__104) rg)) dtb__105)) (fuel - 1)) rg) (((v_Base_dHashMap_dinsert dtb__104) true) assigned)) (C_Base_dList_dList_Base_dList_dCons (dtb__104, comp))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dsccOf = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (if (mc1 <= 0) then mc4 else (if ((v_Base_dHashMap_dmember dtb__106) mc3) then (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__107) (mc1 - 1)) mc2) mc3) mc4) else (match (((((v_Vuna_dCompiler_dElab_dTermination_dcollectComp (C_Base_dList_dList_Base_dList_dCons (dtb__106, C_Base_dList_dList_Base_dList_dNil))) (mc1 - 1)) mc2) mc3) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__108, dtb__109) -> (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf dtb__107) (mc1 - 1)) mc2) dtb__108) (C_Base_dList_dList_Base_dList_dCons (dtb__109, mc4)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (match dtb__110 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, dtb__113) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__113))), dtb__113)), (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__111)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dstrWalk = (fun fuel comp ctors projs p sizes caller facts region e acc -> (if (fuel <= 0) then acc else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__114, dtb__115, dtb__116) -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__114) dtb__115) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__117, dtb__118, dtb__119) -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__117) dtb__118) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__117) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__120, dtb__121, dtb__122, dtb__123) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__120) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__124) -> ((fun acc1 -> ((fun acc2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) (C_Base_dList_dList_Base_dList_dCons (dtb__124, region))) dtb__122) acc2)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__121) acc1))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__120) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__122) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__121) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__120) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__125, dtb__126, dtb__127) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__126) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__128, dtb__129, dtb__130, dtb__131) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__129) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__128) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__135) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__134) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__137, dtb__138, dtb__139) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__137) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__140, dtb__141, dtb__142) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__141) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__143, dtb__144, dtb__145) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__144) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__143) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__146, dtb__147) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__146) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__148, dtb__149, dtb__150) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__149) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__148) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__151, dtb__152) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) (v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds dtb__151)) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__153, dtb__154) -> (if ((v_Base_dList_dmemName dtb__153) comp) then (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc) else acc)
  | _ -> acc
)))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__155) -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) args) sizes) ctors) projs) caller) facts) region) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__156) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) dtb__155) dtb__156) acc))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__157, dtb__158) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__157) then ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc) else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc))
  | _ -> ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) args) acc)
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__159, dtb__160) -> (match dtb__159 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__161, dtb__162, dtb__163) -> (match dtb__161 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__165 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__160 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__166, dtb__167) -> (match dtb__167 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun acc1 -> ((fun sizes2 -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes2) caller) facts) region) dtb__162) acc1)) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__166) dtb__164))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__166) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (match dtb__160 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__168, dtb__169) -> (match dtb__169 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__170, dtb__171) -> (if ((v_Base_dList_dmemName dtb__170) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__170) C_Base_dList_dList_Base_dList_dNil) dtb__168) dtb__171) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__172, dtb__173, dtb__174) -> (match dtb__172 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__175, dtb__176) -> (if ((v_Base_dList_dmemName dtb__175) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__175) dtb__173) dtb__168) dtb__174) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__159)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (match dtb__160 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match dtb__178 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__179, dtb__180) -> (if ((v_Base_dList_dmemName dtb__179) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__179) C_Base_dList_dList_Base_dList_dNil) dtb__177) dtb__180) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__181, dtb__182, dtb__183) -> (match dtb__181 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__184, dtb__185) -> (if ((v_Base_dList_dmemName dtb__184) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__184) dtb__182) dtb__177) dtb__183) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__159)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (match dtb__160 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match dtb__187 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__188, dtb__189) -> (if ((v_Base_dList_dmemName dtb__188) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__188) C_Base_dList_dList_Base_dList_dNil) dtb__186) dtb__189) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__190, dtb__191, dtb__192) -> (match dtb__190 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__193, dtb__194) -> (if ((v_Base_dList_dmemName dtb__193) comp) then ((((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) dtb__193) dtb__191) dtb__186) dtb__192) acc) else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc))
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) dtb__159)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)
)
  | _ -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) acc)
)) args)))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline = (fun fuel comp ctors projs p sizes caller facts region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel p) fullArgs) elems) ctors) projs) caller) facts) region) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid acc2)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> ((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode caller) g) dtb__195) acc2)
  | _ -> failwith "DT: impossible branch"
)) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) pargs) acc1))) ((v_Base_dList_dappend pargs) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("$elem", cbsp)), C_Base_dList_dList_Base_dList_dNil))))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) lst) acc))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp = (fun fuel comp ctors projs p sizes caller facts region fn args acc -> (if (fuel <= 0) then acc else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) args) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (fuel - 1)) comp) ctors) projs) p) sizes) caller) facts) region) fn) acc))))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__197) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__196) mc10)))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 mc11 -> (match mc10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match dtb__198 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__200, dtb__201) -> (if (mc0 <= 0) then mc11 else ((((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) mc9) dtb__199) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc5) mc9) dtb__200)) mc6) mc7) mc8) dtb__201) mc11)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc11 else mc11)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> (match dtb__202 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__204, dtb__205) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__203) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__205) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__207) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__209) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__210, dtb__211) -> (if (mc0 <= 0) then mc10 else (match dtb__210 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__212, dtb__213, dtb__214) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__211) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__213) mc10))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__215, dtb__216) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__211) (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__215) mc10))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dstrClause = (fun comp ctors projs p caller facts clause -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dstrWalk 100000) comp) ctors) projs) p) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf clause))) caller) facts) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf clause)) (C_Base_dPair_dPair_Base_dPair_dPair (true, C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTermination_dgroupMessage = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (match dtb__218 with
  | C_Base_dList_dList_Base_dList_dNil -> (dtb__217 ^ " (recursive call does not structurally decrease)")
  | _ -> (String.concat "" ["recursive group {"; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
)
  | _ -> (String.concat "" ["recursive group {"; (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma mc0); "} (mutual recursion: no parameter position decreases on every recursive call)"])
))

let v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg = (fun comp -> ((fun desc -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCannotProveTermination (desc))) (C_Base_dVec_dVec_Base_dVec_dVCons (desc, C_Base_dVec_dVec_Base_dVec_dVNil)))) (v_Vuna_dCompiler_dElab_dTermination_dgroupMessage comp)))

let rec v_Vuna_dCompiler_dElab_dTermination_dcollectClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__219, dtb__220) -> (if (v_Base_dPair_dfirstOf mc7) then (match (((((((v_Vuna_dCompiler_dElab_dTermination_dstrClause mc1) mc2) mc3) mc4) mc5) mc6) dtb__219) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__221, dtb__222) -> (if dtb__221 then ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses dtb__220) mc1) mc2) mc3) mc4) mc5) mc6) (C_Base_dPair_dPair_Base_dPair_dPair (true, ((v_Base_dList_dappend (v_Base_dPair_dsecondOf mc7)) dtb__222)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (false, (v_Base_dPair_dsecondOf mc7))))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk (mc7)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc7))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectClauses ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__223) mc1)) mc0) mc2) mc3) mc4) dtb__223) mc5) mc7)) (fun acc2 -> ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure mc0) mc1) mc2) mc3) mc4) mc5) dtb__224) acc2)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (mc7))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo = (fun comp defs ctors projs facts remaining maxP -> (if (remaining <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg comp))) else ((fun p -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__225) -> (match dtb__225 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (if dtb__226 then ((fun modes -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty modes) then (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame modes) then (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) dtb__227) then (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) (remaining - 1)) maxP) else (C_Base_dResult_dResult_Base_dResult_dOk (0))) else (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) (remaining - 1)) maxP)) else (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) (remaining - 1)) maxP))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((v_Base_dList_dmap v_Base_dPair_dsecondOf) dtb__227))) else (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) (remaining - 1)) maxP))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__228) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__228))
  | _ -> failwith "DT: impossible branch"
)) ((((((((v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure comp) defs) ctors) projs) p) facts) comp) (C_Base_dPair_dPair_Base_dPair_dPair (true, C_Base_dList_dList_Base_dList_dNil))))) (maxP - remaining))))

let v_Vuna_dCompiler_dElab_dTermination_dtryMeasure = (fun comp defs ctors projs facts p maxP -> (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo comp) defs) ctors) projs) facts) (maxP - p)) maxP))

let v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup = (fun comp defs ctors projs facts -> (match (((((((v_Vuna_dCompiler_dElab_dTermination_dtryMeasure comp) defs) ctors) projs) facts) 0) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf comp) defs)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__229) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__229))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__230) -> (match ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread comp) defs) ctors) projs) facts) dtb__230) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__231) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__231))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__232) -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck comp) defs) ctors) projs) facts) dtb__232)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dcheckComp = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (match dtb__234 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Base_dList_dmemName dtb__233) ((v_Vuna_dCompiler_dElab_dTermination_dadjOf dtb__233) mc4)) then (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5) else (C_Base_dResult_dResult_Base_dResult_dOk (0)))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup mc0) mc1) mc2) mc3) mc5)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dcheckSccs = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__235, dtb__236) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckComp dtb__235) mc1) mc2) mc3) mc4) mc5)) (fun n -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccs dtb__236) mc1) mc2) mc3) mc4) mc5)) (fun m -> (C_Base_dResult_dResult_Base_dResult_dOk ((n + m)))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls = (fun decls -> ((fun defs -> ((fun ctors -> ((fun projs -> ((fun facts -> ((fun g -> ((fun gT -> ((fun nodes -> ((fun rgT -> ((fun fuel -> ((fun post -> ((fun comps -> ((((((v_Vuna_dCompiler_dElab_dTermination_dcheckSccs (v_Base_dList_dreverse comps)) defs) ctors) projs) gT) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dsccOf post) fuel) rgT) v_Base_dHashMap_dempty) C_Base_dList_dList_Base_dList_dNil))) (((v_Vuna_dCompiler_dElab_dTermination_dpostOrder gT) g) nodes))) ((v_Vuna_dCompiler_dElab_dTermination_dgraphFuel g) nodes))) (v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf g))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames defs))) (v_Vuna_dCompiler_dElab_dTermination_dadjTblOf g))) (v_Vuna_dCompiler_dElab_dTermination_dcallGraph defs))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts defs) 16) C_Base_dList_dList_Base_dList_dNil))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf defs))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf decls))) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs decls)))
