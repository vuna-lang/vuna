open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
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
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr t_Base_dList_dList) * ((string, (int, (int, int t_Base_dList_dList) t_Base_dPair_dPair) t_Base_dPair_dPair) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge of (int) * (int) * (bool)

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteRegion = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (match dtb__25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__28))), dtb__28)), (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__26)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__30) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__29) mc9)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__32) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__34) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match dtb__35 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> (if ((bi_le_int mc0) 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__36) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__37)) mc7) dtb__38) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (match dtb__39 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__42) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (if ((bi_le_int mc0) 0) then mc9 else (match dtb__43 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__45, dtb__46, dtb__47) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__44) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__46) mc9))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__48, dtb__49) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__44) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__48) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun e -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__50, dtb__51, dtb__52) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__50) dtb__51) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__53, dtb__54, dtb__55) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) dtb__54) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__56, dtb__57, dtb__58, dtb__59) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__56) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__60) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) (C_Base_dList_dList_Base_dList_dCons (dtb__60, region))) dtb__58) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__57) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__57) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__56) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__61, dtb__62, dtb__63) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__62) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__64, dtb__65, dtb__66, dtb__67) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__65) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__64) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__68, dtb__69, dtb__70, dtb__71, dtb__72) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__71) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__70) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__73, dtb__74, dtb__75) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__73) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__76, dtb__77, dtb__78) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__77) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__79, dtb__80, dtb__81) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__80) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__79) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__82, dtb__83) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__82) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__84, dtb__85, dtb__86) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__85) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__84) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__87, dtb__88) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__87)) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__89, dtb__90) -> (if ((v_Base_dList_dmemName dtb__89) comp) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, dtb__89, C_Base_dList_dList_Base_dList_dNil, sizes, region)), acc)) else acc)
  | _ -> acc
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, dtb__91, args, sizes, region)), acc)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__92, dtb__93) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__92) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__94, dtb__95) -> (match dtb__94 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__96, dtb__97, dtb__98) -> (match dtb__96 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__99, dtb__100) -> (match dtb__100 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__95 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (match dtb__102 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__97) acc1)) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__101) dtb__99))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__101) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__95 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__105, dtb__106) -> (if ((v_Base_dList_dmemName dtb__105) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__105) C_Base_dList_dList_Base_dList_dNil) dtb__103) dtb__106) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__107, dtb__108, dtb__109) -> (match dtb__107 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__110, dtb__111) -> (if ((v_Base_dList_dmemName dtb__110) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__110) dtb__108) dtb__103) dtb__109) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__94)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__95 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match dtb__113 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__114, dtb__115) -> (if ((v_Base_dList_dmemName dtb__114) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__114) C_Base_dList_dList_Base_dList_dNil) dtb__112) dtb__115) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__116, dtb__117, dtb__118) -> (match dtb__116 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__119, dtb__120) -> (if ((v_Base_dList_dmemName dtb__119) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__119) dtb__117) dtb__112) dtb__118) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__94)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__95 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (match dtb__122 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124) -> (if ((v_Base_dList_dmemName dtb__123) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__123) C_Base_dList_dList_Base_dList_dNil) dtb__121) dtb__124) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__125, dtb__126, dtb__127) -> (match dtb__125 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__128, dtb__129) -> (if ((v_Base_dList_dmemName dtb__128) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__128) dtb__126) dtb__121) dtb__127) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__94)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun g -> (fun pargs -> (fun lst -> (fun cbsp -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, g, fullArgs, elems, region)), acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((v_Base_dList_dappend pargs) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("$elem", cbsp)), C_Base_dList_dList_Base_dList_dNil))))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))))))))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__131) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC 100000) mc0) mc1) mc2) mc4) mc3) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__130))) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf dtb__130)) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__132, dtb__133) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__133) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__132) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__132) mc3)) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun comp -> (fun ctors -> (fun projs -> (fun defs -> (fun facts -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defs) facts) comp) C_Base_dList_dList_Base_dList_dNil))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__134, dtb__135, dtb__136) -> dtb__134
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__137, dtb__138, dtb__139) -> dtb__138
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__140, dtb__141, dtb__142) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun m -> (if ((bi_eq_int m) 0) then false else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__143, dtb__144) -> (match dtb__143 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> (match dtb__146 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> (match dtb__148 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, dtb__150) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__147) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (if ((bi_lt_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__151)) then (C_Base_dList_dList_Base_dList_dCons (mc0, (C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152)))) else (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__151)) then (if ((bi_le_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__151)) then (C_Base_dList_dList_Base_dList_dCons (mc0, (C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__151, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__152)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__151, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__152)))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__153) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__154))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a -> (fun b -> (C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom a), (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo a), (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge a) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge b))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (match dtb__156 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__155, C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__155)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__157)) then (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__155)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__157)) then (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__155) dtb__157), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__158))) else (C_Base_dList_dList_Base_dList_dCons (dtb__155, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__156)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__155, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__156))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__159, dtb__160) -> false
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__161)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__163)) then (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__161)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__163)) then (if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__161)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__163)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__162) dtb__164) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a -> (fun b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__165)) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0), (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__165), (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge mc0) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__165)))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__166))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__166))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__167) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__168) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 -> (fun g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__169) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__170))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__171) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__172) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf mc0)) (v_Base_dPair_dfirstOf dtb__175)) then (if ((bi_eq_str (v_Base_dPair_dsecondOf mc0)) (v_Base_dPair_dsecondOf dtb__175)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__174)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__174))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__177) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__178))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__179) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__180) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__181 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> (match dtb__183 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186) -> (if ((bi_eq_str mc0) dtb__185) then (if ((bi_eq_str mc1) dtb__186) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), ((v_Base_dList_dappend dtb__184) (C_Base_dList_dList_Base_dList_dCons (mc2, C_Base_dList_dList_Base_dList_dNil))))), dtb__182)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186)), dtb__184)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__182)))) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186)), dtb__184)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__182))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), (C_Base_dList_dList_Base_dList_dCons (mc2, C_Base_dList_dList_Base_dList_dNil)))), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f -> (fun g -> (fun edges -> (fun table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup (C_Base_dPair_dPair_Base_dPair_dPair (f, g))) table) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__187) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__187) then (C_Base_dPair_dPair_Base_dPair_dPair (table, true)) else (if ((bi_ge_int (v_Base_dList_dlength dtb__187)) v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (match ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__188)) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (if dtb__191 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__189) dtb__190) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__192, dtb__193) -> (match dtb__192 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, dtb__195) -> (match dtb__194 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> (if ((bi_eq_str dtb__196) mc1) then (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__197) mc2) dtb__195) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__199) -> (if dtb__199 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__193) dtb__198) dtb__199) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, false)))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__193) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, mc5))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f -> (fun g -> (fun a -> (fun table -> (fun acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__200) mc3) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, dtb__203) -> (if dtb__203 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__201) mc3) dtb__202) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__204, dtb__205) -> (match dtb__204 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__206, dtb__207) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__208) dtb__209) dtb__207) mc1) mc2) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__210, dtb__211) -> (if dtb__211 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__205) mc1) dtb__210) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__210, false)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, true))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun table -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__212, dtb__213) -> (match dtb__212 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__214) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__215) dtb__216) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__213) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a -> (fun b -> (if ((bi_eq_int (v_Base_dList_dlength a)) (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__217, dtb__218) -> (if dtb__218 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__217) then (C_Base_dPair_dPair_Base_dPair_dPair (dtb__217, true)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__217) ((bi_sub fuel) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__217, false)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i -> (fun j -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s)) j) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__219) -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__219) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes s)) ctors) projs) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller s)) facts) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteRegion s)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__220) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (i, j, (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__220))), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i -> (fun count -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (if ((bi_le_int count) 0) then C_Base_dList_dList_Base_dList_dNil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) ((bi_sub count) 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) ((bi_sub count) 1)) s) ctors) projs) facts)))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (if ((bi_le_int i) 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s))) s) ctors) projs) facts) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s))) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI ((bi_sub i) 1)) s) ctors) projs) facts))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors -> (fun projs -> (fun facts -> (fun s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes s))) s) ctors) projs) facts)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__221, dtb__222) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__222) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__221)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee dtb__221)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__221)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites -> (fun ctors -> (fun projs -> (fun facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> (match dtb__223 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__225, dtb__226) -> (match dtb__225 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (if ((bi_eq_str dtb__227) dtb__228) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__226) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__224) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__224))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__229, dtb__230) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__229) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__230) else (C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__230))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (match dtb__231 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> (match dtb__233 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__235, dtb__236) -> (if ((bi_eq_str dtb__235) dtb__236) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__235) dtb__234)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__232)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__232))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun e -> ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom e))) ((bi_concat "->>") (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo e)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun e -> ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom e))) ((bi_concat "->") (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo e)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun e -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge e) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__237, dtb__238) -> (match dtb__238 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__237)
  | _ -> ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__237)) ((bi_concat ",") (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__238)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__239, dtb__240) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__239) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__240) else (C_Base_dList_dList_Base_dList_dCons (((bi_concat mc0) ((bi_concat "{") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__239)) "}"))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__240))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__241, dtb__242) -> (match dtb__241 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> (match dtb__243 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, dtb__246) -> (if ((bi_eq_str dtb__245) dtb__246) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__245) dtb__244)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__242)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__242))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun msg -> ((fun sites -> ((fun table0 -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) 240) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__247, dtb__248) -> (if dtb__248 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__247) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat msg) ((bi_concat " [SCT \230\151\160\228\184\139\233\153\141\231\142\175: ") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__247)) "]")))))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defs) facts))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> (match dtb__249 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__251, dtb__252) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__251))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name -> (fun defs -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef name) defs) with
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | C_Base_dList_dList_Base_dList_dCons (dtb__253, dtb__254) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__253)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__255) -> dtb__255
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__256, dtb__257, dtb__258, dtb__259) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__256) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__260) -> (if ((bi_eq_str dtb__260) mc0) then true else false)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel -> (fun site -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs site)) 0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__261) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__262, dtb__263, dtb__264) -> (match dtb__262 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__265, dtb__266) -> (if ((bi_eq_str dtb__265) "-") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__267, dtb__268) -> (match dtb__267 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__269, dtb__270) -> (match dtb__268 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__271, dtb__272) -> (match dtb__271 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__273, dtb__274) -> (match dtb__272 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_eq_str dtb__269) callerFuel) then (if ((bi_gt_int dtb__273) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__263) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__275, dtb__276) -> (if ((bi_eq_str dtb__275) callerFuel) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__261)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__277, dtb__278) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__277)) mc1)) dtb__277) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__278) false) mc4)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__279) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__278) mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__277), (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee dtb__277))), (if dtb__279 then 1 else 0))), mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp -> (fun defs -> (fun sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defs) sites) true) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__280, dtb__281) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__280) mc1) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__282, dtb__283) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__282)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__284) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__284) (v_Base_dPair_dsecondOf dtb__282)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded dtb__281) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if ((bi_gt_int strictCount) 0) then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded comp) defs) then (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (C_Base_dResult_dResult_Base_dResult_dErr (msg)) else (C_Base_dResult_dResult_Base_dResult_dOk (0))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((v_Base_dList_dmap v_Base_dPair_dsecondOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defs) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defs) facts))))))))
