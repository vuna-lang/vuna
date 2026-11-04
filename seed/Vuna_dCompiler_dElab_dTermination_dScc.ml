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
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr t_Base_dList_dList) * ((string, (int, (int, int t_Base_dList_dList) t_Base_dPair_dPair) t_Base_dPair_dPair) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge of (int) * (int) * (bool)

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller = (fun s -> (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__0, dtb__1, dtb__2, dtb__3, dtb__4) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee = (fun s -> (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs = (fun s -> (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes = (fun s -> (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteRegion = (fun s -> (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__26) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__25) mc9)))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (match dtb__27 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__28) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__30) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (if ((bi_le_int mc0) 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__32) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__33)) mc7) dtb__34) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match dtb__35 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__36) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__38) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__39, dtb__40) -> (if ((bi_le_int mc0) 0) then mc9 else (match dtb__39 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__41, dtb__42, dtb__43) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__42) mc9))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__44, dtb__45) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__44) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun e -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__46, dtb__47, dtb__48) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) dtb__47) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__49, dtb__50, dtb__51) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) dtb__50) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__52, dtb__53, dtb__54, dtb__55) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__52) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) (C_Base_dList_dList_Base_dList_dCons (dtb__56, region))) dtb__54) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__54) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__57, dtb__58, dtb__59) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__60, dtb__61, dtb__62, dtb__63) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__61) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__60) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__67) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__66) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__69, dtb__70, dtb__71) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__69) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__72, dtb__73, dtb__74) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__73) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__75, dtb__76, dtb__77) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__76) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__75) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__78, dtb__79) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__78) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__80, dtb__81, dtb__82) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__81) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__80) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__83, dtb__84) -> (if ((v_Base_dList_dmemName dtb__83) comp) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, dtb__83, C_Base_dList_dList_Base_dList_dNil, sizes, region)), acc)) else acc)
  | _ -> acc
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__85) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, dtb__85, args, sizes, region)), acc)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__86, dtb__87) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__86) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> (match dtb__88 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__90, dtb__91, dtb__92) -> (match dtb__90 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__93, dtb__94) -> (match dtb__94 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__89 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (match dtb__96 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__91) acc1)) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__95) dtb__93))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__95) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__89 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__98 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__99, dtb__100) -> (if ((v_Base_dList_dmemName dtb__99) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__99) C_Base_dList_dList_Base_dList_dNil) dtb__97) dtb__100) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__101, dtb__102, dtb__103) -> (match dtb__101 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__104, dtb__105) -> (if ((v_Base_dList_dmemName dtb__104) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__104) dtb__102) dtb__97) dtb__103) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__88)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__89 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__106, dtb__107) -> (match dtb__107 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__108, dtb__109) -> (if ((v_Base_dList_dmemName dtb__108) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__108) C_Base_dList_dList_Base_dList_dNil) dtb__106) dtb__109) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__110, dtb__111, dtb__112) -> (match dtb__110 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__113, dtb__114) -> (if ((v_Base_dList_dmemName dtb__113) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__113) dtb__111) dtb__106) dtb__112) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__88)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__89 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match dtb__116 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__117, dtb__118) -> (if ((v_Base_dList_dmemName dtb__117) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__117) C_Base_dList_dList_Base_dList_dNil) dtb__115) dtb__118) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__119, dtb__120, dtb__121) -> (match dtb__119 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__122, dtb__123) -> (if ((v_Base_dList_dmemName dtb__122) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__122) dtb__120) dtb__115) dtb__121) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__88)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun g -> (fun pargs -> (fun lst -> (fun cbsp -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, g, fullArgs, elems, region)), acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((v_Base_dList_dappend pargs) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("$elem", cbsp)), C_Base_dList_dList_Base_dList_dNil))))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))))))))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__125) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC 100000) mc0) mc1) mc2) mc4) mc3) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__124))) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf dtb__124)) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__127) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__126) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__126) mc3)) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun comp -> (fun ctors -> (fun projs -> (fun defs -> (fun facts -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defs) facts) comp) C_Base_dList_dList_Base_dList_dNil))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom = (fun e -> (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__128, dtb__129, dtb__130) -> dtb__128
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo = (fun e -> (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__131, dtb__132, dtb__133) -> dtb__132
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge = (fun e -> (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__134, dtb__135, dtb__136) -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun m -> (if ((bi_eq_int m) 0) then false else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (match dtb__137 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__139, dtb__140) -> (match dtb__140 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, dtb__142) -> (match dtb__142 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__141) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__138))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> (if ((bi_lt_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__145)) then (C_Base_dList_dList_Base_dList_dCons (mc0, (C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146)))) else (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__145)) then (if ((bi_le_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__145)) then (C_Base_dList_dList_Base_dList_dCons (mc0, (C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__145, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__146)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__145, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__146)))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__147, dtb__148) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__147) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__148))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a -> (fun b -> (C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom a), (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo a), (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge a) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge b))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> (match dtb__150 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__149, C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__149)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__151)) then (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__149)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__151)) then (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__149) dtb__151), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__152))) else (C_Base_dList_dList_Base_dList_dCons (dtb__149, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__150)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__149, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__150))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> false
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__155)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__157)) then (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__155)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__157)) then (if (((v_Base_dEq_deq v_Base_dEq_dEq_uBase_dEq_dEq_uBase_dBool_dBool) (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__155)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__157)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__156) dtb__158) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a -> (fun b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__159, dtb__160) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__159)) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0), (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__159), (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge mc0) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__159)))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__160))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__160))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__161) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__162) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 -> (fun g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__163) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__164))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__165) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__166) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__167 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf mc0)) (v_Base_dPair_dfirstOf dtb__169)) then (if ((bi_eq_str (v_Base_dPair_dsecondOf mc0)) (v_Base_dPair_dsecondOf dtb__169)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__170)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__168)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__168))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__171) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__172))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__173) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__174) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (match dtb__175 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__177, dtb__178) -> (match dtb__177 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> (if ((bi_eq_str mc0) dtb__179) then (if ((bi_eq_str mc1) dtb__180) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), ((v_Base_dList_dappend dtb__178) (C_Base_dList_dList_Base_dList_dCons (mc2, C_Base_dList_dList_Base_dList_dNil))))), dtb__176)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180)), dtb__178)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__176)))) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180)), dtb__178)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__176))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), (C_Base_dList_dList_Base_dList_dCons (mc2, C_Base_dList_dList_Base_dList_dNil)))), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f -> (fun g -> (fun edges -> (fun table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup (C_Base_dPair_dPair_Base_dPair_dPair (f, g))) table) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__181) then (C_Base_dPair_dPair_Base_dPair_dPair (table, true)) else (if ((bi_ge_int (v_Base_dList_dlength dtb__181)) v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (match ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__182)) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> (if dtb__185 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__183) dtb__184) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match dtb__186 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> (match dtb__188 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (if ((bi_eq_str dtb__190) mc1) then (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__191) mc2) dtb__189) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> (if dtb__193 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__187) dtb__192) dtb__193) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, false)))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__187) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, mc5))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f -> (fun g -> (fun a -> (fun table -> (fun acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__194, dtb__195) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__194) mc3) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> (if dtb__197 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__195) mc3) dtb__196) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match dtb__198 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__200, dtb__201) -> (match dtb__200 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__202, dtb__203) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__202) dtb__203) dtb__201) mc1) mc2) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__204, dtb__205) -> (if dtb__205 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__199) mc1) dtb__204) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__204, false)))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> (match dtb__206 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__208) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__210) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__209) dtb__210) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__207) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a -> (fun b -> (if ((bi_eq_int (v_Base_dList_dlength a)) (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, dtb__212) -> (if dtb__212 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__211) then (C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, true)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__211) ((bi_sub fuel) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, false)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i -> (fun j -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s)) j) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__213) -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__213) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes s)) ctors) projs) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller s)) facts) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteRegion s)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__214) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (i, j, (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__214))), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i -> (fun count -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (if ((bi_le_int count) 0) then C_Base_dList_dList_Base_dList_dNil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) ((bi_sub count) 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) ((bi_sub count) 1)) s) ctors) projs) facts)))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (if ((bi_le_int i) 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s))) s) ctors) projs) facts) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s))) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI ((bi_sub i) 1)) s) ctors) projs) facts))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors -> (fun projs -> (fun facts -> (fun s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes s))) s) ctors) projs) facts)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__215, dtb__216) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__216) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__215)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee dtb__215)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__215)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites -> (fun ctors -> (fun projs -> (fun facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) C_Base_dList_dList_Base_dList_dNil)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (match dtb__217 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__219, dtb__220) -> (match dtb__219 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__221, dtb__222) -> (if ((bi_eq_str dtb__221) dtb__222) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__220) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__218) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__218))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__223) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__224) else (C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__224))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__225, dtb__226) -> (match dtb__225 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> (match dtb__227 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__229, dtb__230) -> (if ((bi_eq_str dtb__229) dtb__230) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__229) dtb__228)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__226)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__226))
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
  | C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (match dtb__232 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__231)
  | _ -> ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__231)) ((bi_concat ",") (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__232)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__233) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__234) else (C_Base_dList_dList_Base_dList_dCons (((bi_concat mc0) ((bi_concat "{") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__233)) "}"))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__234))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__235, dtb__236) -> (match dtb__235 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238) -> (match dtb__237 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, dtb__240) -> (if ((bi_eq_str dtb__239) dtb__240) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__239) dtb__238)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__236)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__236))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun msg -> ((fun sites -> ((fun table0 -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) 240) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (if dtb__242 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__241) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat msg) ((bi_concat " [SCT \230\151\160\228\184\139\233\153\141\231\142\175: ") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__241)) "]")))))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defs) facts))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun pats -> (match pats with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__243, dtb__244) -> (match dtb__243 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__245, dtb__246) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__245))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name -> (fun defs -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef name) defs) with
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__247)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__249) -> dtb__249
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun p0 -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__250, dtb__251, dtb__252, dtb__253) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__250) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__254) -> (if ((bi_eq_str dtb__254) p0) then true else false)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel -> (fun site -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs site)) 0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__255) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__256, dtb__257, dtb__258) -> (match dtb__256 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__259, dtb__260) -> (if ((bi_eq_str dtb__259) "-") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__261, dtb__262) -> (match dtb__261 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__263, dtb__264) -> (match dtb__262 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__265, dtb__266) -> (match dtb__265 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__267, dtb__268) -> (match dtb__266 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_eq_str dtb__263) callerFuel) then (if ((bi_gt_int dtb__267) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__257) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__269, dtb__270) -> (if ((bi_eq_str dtb__269) callerFuel) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__255)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__271, dtb__272) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__271)) mc1)) dtb__271) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__272) false) mc4)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__273) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__272) mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__271), (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee dtb__271))), (if dtb__273 then 1 else 0))), mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp -> (fun defs -> (fun sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defs) sites) true) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__274, dtb__275) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__274) mc1) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__276, dtb__277) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__276)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__278) (v_Base_dPair_dsecondOf dtb__276)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded dtb__275) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if ((bi_gt_int strictCount) 0) then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded comp) defs) then (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (C_Base_dResult_dResult_Base_dResult_dErr (msg)) else (C_Base_dResult_dResult_Base_dResult_dOk (0))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((v_Base_dList_dmap v_Base_dPair_dsecondOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defs) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defs) facts))))))))
