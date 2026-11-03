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
  | C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__26) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__25) mc9)))
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__27 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__29, dtb__30) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__28) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__30) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (fun mc10 -> (match mc9 with
  | C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match dtb__31 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__33, dtb__34) -> (if ((bi_le_int mc0) 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__32) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__33)) mc7) dtb__34) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (match dtb__35 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__37, dtb__38) -> (if ((bi_le_int mc0) 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__36) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__38) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (fun mc8 -> (fun mc9 -> (match mc8 with
  | C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if ((bi_le_int mc0) 0) then mc9 else (match dtb__39 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__41, dtb__42, dtb__43) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__42) mc9))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__44, dtb__45) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub mc0) 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__44) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
)))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun e -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__46, dtb__47, dtb__48) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) dtb__47) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__49, dtb__50, dtb__51) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) dtb__50) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__49) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__52, dtb__53, dtb__54, dtb__55) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__52) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) (C_Base_dList_dList_Cons (dtb__56, region))) dtb__54) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__54) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__53) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__57, dtb__58, dtb__59) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__58) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__60, dtb__61, dtb__62, dtb__63) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__61) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__60) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__67) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__66) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__69, dtb__70, dtb__71) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__69) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__72, dtb__73, dtb__74) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__73) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__75, dtb__76, dtb__77) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__76) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__75) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInstSel (dtb__78, dtb__79, dtb__80) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__78) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__81, dtb__82) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__81) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__83, dtb__84, dtb__85) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__84) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__83) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__86, dtb__87) -> (if ((v_Base_dList_dmemName dtb__86) comp) then (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, dtb__86, C_Base_dList_dList_Nil, sizes, region)), acc)) else acc)
  | _ -> acc
))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__88) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, dtb__88, args, sizes, region)), acc)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__89, dtb__90) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__89) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun fn -> (fun args -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Cons (dtb__91, dtb__92) -> (match dtb__91 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__93, dtb__94, dtb__95) -> (match dtb__93 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (match dtb__97 with
  | C_Base_dList_dList_Nil -> (match dtb__92 with
  | C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (match dtb__99 with
  | C_Base_dList_dList_Nil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__94) acc1)) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__98) dtb__96))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__98) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__92 with
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (match dtb__101 with
  | C_Base_dList_dList_Nil -> (match dtb__91 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__102, dtb__103, dtb__104) -> (match dtb__102 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__105, dtb__106) -> (if ((v_Base_dList_dmemName dtb__105) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__105) dtb__103) dtb__100) dtb__104) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__107, dtb__108) -> (if ((v_Base_dList_dmemName dtb__107) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__107) C_Base_dList_dList_Nil) dtb__100) dtb__108) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__92 with
  | C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dList_dList_Nil -> (match dtb__91 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__111, dtb__112, dtb__113) -> (match dtb__111 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__114, dtb__115) -> (if ((v_Base_dList_dmemName dtb__114) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__114) dtb__112) dtb__109) dtb__113) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__116, dtb__117) -> (if ((v_Base_dList_dmemName dtb__116) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__116) C_Base_dList_dList_Nil) dtb__109) dtb__117) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__92 with
  | C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (match dtb__119 with
  | C_Base_dList_dList_Nil -> (match dtb__91 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__120, dtb__121, dtb__122) -> (match dtb__120 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124) -> (if ((v_Base_dList_dmemName dtb__123) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__123) dtb__121) dtb__118) dtb__122) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__125, dtb__126) -> (if ((v_Base_dList_dmemName dtb__125) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__125) C_Base_dList_dList_Nil) dtb__118) dtb__126) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))))))))))))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel -> (fun comp -> (fun ctors -> (fun projs -> (fun caller -> (fun facts -> (fun sizes -> (fun region -> (fun g -> (fun pargs -> (fun lst -> (fun cbsp -> (fun acc -> (if ((bi_le_int fuel) 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dMkSite (caller, g, fullArgs, elems, region)), acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((v_Base_dList_dappend pargs) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("$elem", cbsp)), C_Base_dList_dList_Nil))))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC ((bi_sub fuel) 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))))))))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__128) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC 100000) mc0) mc1) mc2) mc4) mc3) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__127))) C_Base_dList_dList_Nil) (v_Base_dPair_dsecondOf dtb__127)) mc6))
  | C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__130) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__129) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__129) mc3)) mc6))
  | C_Base_dList_dList_Nil -> mc6
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun comp -> (fun ctors -> (fun projs -> (fun defs -> (fun facts -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defs) facts) comp) C_Base_dList_dList_Nil))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom = (fun e -> (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__131, dtb__132, dtb__133) -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo = (fun e -> (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__134, dtb__135, dtb__136) -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge = (fun e -> (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (dtb__137, dtb__138, dtb__139) -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun m -> (if ((bi_eq_int m) 0) then false else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (match dtb__140 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> (match dtb__143 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (match dtb__145 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__144) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__141))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__148, dtb__149) -> (if ((bi_lt_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__148)) then (C_Base_dList_dList_Cons (mc0, (C_Base_dList_dList_Cons (dtb__148, dtb__149)))) else (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__148)) then (if ((bi_le_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__148)) then (C_Base_dList_dList_Cons (mc0, (C_Base_dList_dList_Cons (dtb__148, dtb__149)))) else (C_Base_dList_dList_Cons (dtb__148, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__149)))) else (C_Base_dList_dList_Cons (dtb__148, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__149)))))
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (mc0, C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__150, dtb__151) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__150) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__151))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a -> (fun b -> (C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom a), (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo a), (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge a) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge b))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__152, dtb__153) -> (match dtb__153 with
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons (dtb__152, C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__154, dtb__155) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__152)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__154)) then (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__152)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__154)) then (C_Base_dList_dList_Cons (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__152) dtb__154), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__155))) else (C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__153)))) else (C_Base_dList_dList_Cons (dtb__152, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__153))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__156, dtb__157) -> false
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Cons (dtb__158, dtb__159) -> (match mc1 with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__158)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__160)) then (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__158)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__160)) then (if (((v_Base_dEq_deq v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uBool) (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__158)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__160)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__159) dtb__161) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a -> (fun b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (if ((bi_eq_int (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo mc0)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom dtb__162)) then (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom mc0), (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo dtb__162), (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge mc0) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__162)))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__163))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__163))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__164, dtb__165) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__164) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__165) mc1))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 -> (fun g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__166, dtb__167) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge dtb__166) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__167))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__168) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__169) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (match dtb__170 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__172, dtb__173) -> (if ((bi_eq_str (v_Base_dPair_dfirstOf mc0)) (v_Base_dPair_dfirstOf dtb__172)) then (if ((bi_eq_str (v_Base_dPair_dsecondOf mc0)) (v_Base_dPair_dsecondOf dtb__172)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__171)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__171))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__174, dtb__175) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__174) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__175))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__176, dtb__177) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__176) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__177) mc1) else false)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__178, dtb__179) -> (match dtb__178 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (match dtb__180 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (if ((bi_eq_str mc0) dtb__182) then (if ((bi_eq_str mc1) dtb__183) then (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), ((v_Base_dList_dappend dtb__181) (C_Base_dList_dList_Cons (mc2, C_Base_dList_dList_Nil))))), dtb__179)) else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183)), dtb__181)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__179)))) else (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183)), dtb__181)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__179))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), (C_Base_dList_dList_Cons (mc2, C_Base_dList_dList_Nil)))), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f -> (fun g -> (fun edges -> (fun table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup (C_Base_dPair_dPair_Base_dPair_dPair (f, g))) table) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__184) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__184) then (C_Base_dPair_dPair_Base_dPair_dPair (table, true)) else (if ((bi_ge_int (v_Base_dList_dlength dtb__184)) v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__185, dtb__186) -> (match ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__185)) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__187, dtb__188) -> (if dtb__188 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__186) dtb__187) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__187, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (match dtb__191 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> (if ((bi_eq_str dtb__193) mc1) then (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__194) mc2) dtb__192) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (if dtb__196 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__190) dtb__195) dtb__196) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, false)))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__190) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, mc5))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f -> (fun g -> (fun a -> (fun table -> (fun acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__197, dtb__198) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__197) mc3) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, dtb__200) -> (if dtb__200 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__198) mc3) dtb__199) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__201, dtb__202) -> (match dtb__201 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__203, dtb__204) -> (match dtb__203 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__205) dtb__206) dtb__204) mc1) mc2) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> (if dtb__208 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__202) mc1) dtb__207) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, false)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, true))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun table -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match dtb__209 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, dtb__212) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__211) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__213) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__212) dtb__213) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__210) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a -> (fun b -> (if ((bi_eq_int (v_Base_dList_dlength a)) (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table -> (fun fuel -> (if ((bi_le_int fuel) 0) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> (if dtb__215 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__214) then (C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, true)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__214) ((bi_sub fuel) 1))) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, false)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i -> (fun j -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s)) j) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216) -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__216) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes s)) ctors) projs) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller s)) facts) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteRegion s)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__217) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dMkScEdge (i, j, (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__217))), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i -> (fun count -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (if ((bi_le_int count) 0) then C_Base_dList_dList_Nil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) ((bi_sub count) 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) ((bi_sub count) 1)) s) ctors) projs) facts)))))))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i -> (fun s -> (fun ctors -> (fun projs -> (fun facts -> (if ((bi_le_int i) 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s))) s) ctors) projs) facts) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs s))) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI ((bi_sub i) 1)) s) ctors) projs) facts))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors -> (fun projs -> (fun facts -> (fun s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteSizes s))) s) ctors) projs) facts)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__219) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__218)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee dtb__218)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__218)) mc4))
  | C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites -> (fun ctors -> (fun projs -> (fun facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) C_Base_dList_dList_Nil)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__220, dtb__221) -> (match dtb__220 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__222, dtb__223) -> (match dtb__222 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__224, dtb__225) -> (if ((bi_eq_str dtb__224) dtb__225) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__223) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__221) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__221))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__226, dtb__227) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__226) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__227) else (C_Base_dList_dList_Cons (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__227))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> (match dtb__230 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> (if ((bi_eq_str dtb__232) dtb__233) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__232) dtb__231)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__229)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__229))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun e -> ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom e))) ((bi_concat "->>") (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo e)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun e -> ((bi_concat (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeFrom e))) ((bi_concat "->") (bi_strFromInt (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeTo e)))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun e -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dscStrictEdge e) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__234, dtb__235) -> (match dtb__235 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__234)
  | _ -> ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__234)) ((bi_concat ",") (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__235)))
)
  | C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__236, dtb__237) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__236) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__237) else (C_Base_dList_dList_Cons (((bi_concat mc0) ((bi_concat "{") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__236)) "}"))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__237))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__238, dtb__239) -> (match dtb__238 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__240, dtb__241) -> (match dtb__240 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, dtb__243) -> (if ((bi_eq_str dtb__242) dtb__243) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__242) dtb__241)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__239)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__239))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun msg -> ((fun sites -> ((fun table0 -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) 240) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__244, dtb__245) -> (if dtb__245 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__244) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat msg) ((bi_concat " [SCT \230\151\160\228\184\139\233\153\141\231\142\175: ") ((bi_concat (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__244)) "]")))))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defs) facts))))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun pats -> (match pats with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__246, dtb__247) -> (match dtb__246 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__248, dtb__249) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__248))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name -> (fun defs -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef name) defs) with
  | C_Base_dList_dList_Nil -> ""
  | C_Base_dList_dList_Cons (dtb__250, dtb__251) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__250)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__252) -> dtb__252
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun p0 -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__253, dtb__254, dtb__255, dtb__256) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__253) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__257) -> (if ((bi_eq_str dtb__257) p0) then true else false)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel -> (fun site -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteArgs site)) 0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__258) -> (match dtb__258 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__259, dtb__260) -> (if ((bi_eq_str dtb__259) callerFuel) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__261, dtb__262, dtb__263) -> (match dtb__261 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__264, dtb__265) -> (if ((bi_eq_str dtb__264) "-") then (match dtb__262 with
  | C_Base_dList_dList_Cons (dtb__266, dtb__267) -> (match dtb__266 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__268, dtb__269) -> (match dtb__267 with
  | C_Base_dList_dList_Cons (dtb__270, dtb__271) -> (match dtb__270 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__272, dtb__273) -> (match dtb__271 with
  | C_Base_dList_dList_Nil -> (if ((bi_eq_str dtb__268) callerFuel) then (if ((bi_gt_int dtb__272) 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__274, dtb__275) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__274)) mc1)) dtb__274) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__275) false) mc4)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__276) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__275) mc3) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCaller dtb__274), (v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCallee dtb__274))), (if dtb__276 then 1 else 0))), mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp -> (fun defs -> (fun sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defs) sites) true) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__277, dtb__278) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef dtb__277) mc1) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__279, dtb__280) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__279)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__281) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__281) (v_Base_dPair_dsecondOf dtb__279)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded dtb__278) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp -> (fun defs -> (fun ctors -> (fun projs -> (fun facts -> (fun msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if ((bi_gt_int strictCount) 0) then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded comp) defs) then (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (C_Base_dResult_dResult_Base_dResult_dErr (msg)) else (C_Base_dResult_dResult_Base_dResult_dOk (0))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((v_Base_dList_dmap v_Base_dPair_dsecondOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defs) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defs) facts))))))))
