open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
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
type t_Vuna_dCompiler_dElab_dTermination_dScc_dSite = C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr t_Base_dList_dList) * ((string, (int, (int, int t_Base_dList_dList) t_Base_dPair_dPair) t_Base_dPair_dPair) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge = C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge of (int) * (int) * (bool)

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__2, dtb__3) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__3))), dtb__3)), (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__1)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__5) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__4) mc9)))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (match dtb__6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__8, dtb__9) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__7) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__9) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (match dtb__10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__12, dtb__13) -> (if (mc0 <= 0) then mc10 else (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) mc8) dtb__11) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict mc6) mc8) dtb__12)) mc7) dtb__13) mc10)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc10 else mc10)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> (match dtb__14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__16, dtb__17) -> (if (mc0 <= 0) then mc9 else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__15) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__17) mc9)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 -> (match mc8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (if (mc0 <= 0) then mc9 else (match dtb__18 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__20, dtb__21, dtb__22) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__21) mc9))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__23, dtb__24) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__19) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc7) dtb__23) mc9))
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then mc9 else mc9)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC = (fun fuel comp ctors projs caller facts sizes region e acc -> (if (fuel <= 0) then acc else (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__25, dtb__26, dtb__27) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__25) dtb__26) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__28, dtb__29, dtb__30) -> (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) dtb__29) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__28) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__31, dtb__32, dtb__33, dtb__34) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__31) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__35) -> ((fun acc1 -> ((fun acc2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) (C_Base_dList_dList_Base_dList_dCons (dtb__35, region))) dtb__33) acc2)) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) acc1))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__31) acc))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__33) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__32) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__31) acc)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__36, dtb__37, dtb__38) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__37) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__39, dtb__40, dtb__41, dtb__42) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__40) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__39) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__46) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__45) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__48, dtb__49, dtb__50) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__48) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__51, dtb__52, dtb__53) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__52) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__54, dtb__55, dtb__56) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__55) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__54) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__57, dtb__58) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__57) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__59, dtb__60, dtb__61) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__60) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__59) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__62, dtb__63) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) (v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds dtb__62)) acc)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__64, dtb__65) -> (if ((v_Base_dList_dmemName dtb__64) comp) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (caller, dtb__64, C_Base_dList_dList_Base_dList_dNil, sizes, region)), acc)) else acc)
  | _ -> acc
)))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead comp) fn) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66) -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (caller, dtb__66, args, sizes, region)), acc)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__67, dtb__68) -> (if (v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike dtb__67) then (((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) args) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc)))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) fn) acc))
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap = (fun fuel comp ctors projs caller facts sizes region fn args acc -> (if (fuel <= 0) then acc else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__69, dtb__70) -> (match dtb__69 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__71, dtb__72, dtb__73) -> (match dtb__71 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__74, dtb__75) -> (match dtb__75 with
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__70 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (match dtb__77 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun acc1 -> ((fun sizes2 -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes2) region) dtb__72) acc1)) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) dtb__76) dtb__74))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__76) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> (match dtb__70 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (match dtb__79 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__80, dtb__81) -> (if ((v_Base_dList_dmemName dtb__80) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__80) C_Base_dList_dList_Base_dList_dNil) dtb__78) dtb__81) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__82, dtb__83, dtb__84) -> (match dtb__82 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__85, dtb__86) -> (if ((v_Base_dList_dmemName dtb__85) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__85) dtb__83) dtb__78) dtb__84) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__69)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__70 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__87, dtb__88) -> (match dtb__88 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__89, dtb__90) -> (if ((v_Base_dList_dmemName dtb__89) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__89) C_Base_dList_dList_Base_dList_dNil) dtb__87) dtb__90) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__91, dtb__92, dtb__93) -> (match dtb__91 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__94, dtb__95) -> (if ((v_Base_dList_dmemName dtb__94) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__94) dtb__92) dtb__87) dtb__93) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__69)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> (match dtb__70 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (match dtb__97 with
  | C_Base_dList_dList_Base_dList_dNil -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__98, dtb__99) -> (if ((v_Base_dList_dmemName dtb__98) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__98) C_Base_dList_dList_Base_dList_dNil) dtb__96) dtb__99) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__100, dtb__101, dtb__102) -> (match dtb__100 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__103, dtb__104) -> (if ((v_Base_dList_dmemName dtb__103) comp) then (((((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) dtb__103) dtb__101) dtb__96) dtb__102) acc) else ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc))
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) dtb__69)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)
)
  | _ -> ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) args) acc)
)) args)))
and v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline = (fun fuel comp ctors projs caller facts sizes region g pargs lst cbsp acc -> (if (fuel <= 0) then acc else ((fun acc1 -> ((fun elems -> ((fun fullArgs -> ((fun acc2 -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (caller, g, fullArgs, elems, region)), acc2))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) pargs) acc1))) ((v_Base_dList_dappend pargs) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("$elem", cbsp)), C_Base_dList_dList_Base_dList_dNil))))) (((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes sizes) lst) "$elem"))) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC (fuel - 1)) comp) ctors) projs) caller) facts) sizes) region) lst) acc))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc3) mc4) dtb__106) ((((((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC 100000) mc0) mc1) mc2) mc4) mc3) (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries (v_Base_dPair_dfirstOf dtb__105))) C_Base_dList_dList_Base_dList_dNil) (v_Base_dPair_dsecondOf dtb__105)) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 -> (match mc5 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo mc0) mc1) mc2) mc3) mc4) dtb__108) (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses mc0) mc1) mc2) mc4) dtb__107) ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__107) mc3)) mc6))
  | C_Base_dList_dList_Base_dList_dNil -> mc6
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect = (fun comp ctors projs defTbl facts -> (((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo comp) ctors) projs) defTbl) facts) comp) C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict = (fun m -> (m <> 0))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__109 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (match dtb__112 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> (match dtb__114 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt dtb__113) (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf dtb__110))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__119, dtb__120, dtb__121) -> dtb__119
  | _ -> failwith "DT: impossible branch"
) < (match dtb__117 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__122, dtb__123, dtb__124) -> dtb__122
  | _ -> failwith "DT: impossible branch"
)) then (C_Base_dList_dList_Base_dList_dCons (mc0, (C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118)))) else (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__125, dtb__126, dtb__127) -> dtb__125
  | _ -> failwith "DT: impossible branch"
) = (match dtb__117 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__128, dtb__129, dtb__130) -> dtb__128
  | _ -> failwith "DT: impossible branch"
)) then (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__131, dtb__132, dtb__133) -> dtb__132
  | _ -> failwith "DT: impossible branch"
) <= (match dtb__117 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__134, dtb__135, dtb__136) -> dtb__135
  | _ -> failwith "DT: impossible branch"
)) then (C_Base_dList_dList_Base_dList_dCons (mc0, (C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__117, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__118)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__117, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge mc0) dtb__118)))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge dtb__137) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges dtb__138))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict = (fun a b -> (C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge ((match a with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__139, dtb__140, dtb__141) -> dtb__139
  | _ -> failwith "DT: impossible branch"
), (match a with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__142, dtb__143, dtb__144) -> dtb__143
  | _ -> failwith "DT: impossible branch"
), (if (match a with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__145, dtb__146, dtb__147) -> dtb__147
  | _ -> failwith "DT: impossible branch"
) then true else (match b with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__148, dtb__149, dtb__150) -> dtb__150
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (match dtb__152 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons (dtb__151, C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> (if ((match dtb__151 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__155, dtb__156, dtb__157) -> dtb__155
  | _ -> failwith "DT: impossible branch"
) = (match dtb__153 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__158, dtb__159, dtb__160) -> dtb__158
  | _ -> failwith "DT: impossible branch"
)) then (if ((match dtb__151 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__161, dtb__162, dtb__163) -> dtb__162
  | _ -> failwith "DT: impossible branch"
) = (match dtb__153 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__164, dtb__165, dtb__166) -> dtb__165
  | _ -> failwith "DT: impossible branch"
)) then (C_Base_dList_dList_Base_dList_dCons (((v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict dtb__151) dtb__153), (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__154))) else (C_Base_dList_dList_Base_dList_dCons (dtb__151, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__152)))) else (C_Base_dList_dList_Base_dList_dCons (dtb__151, (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges dtb__152))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges = (fun edges -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges (v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges edges)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> false
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (if ((match dtb__169 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__173, dtb__174, dtb__175) -> dtb__173
  | _ -> failwith "DT: impossible branch"
) = (match dtb__171 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__176, dtb__177, dtb__178) -> dtb__176
  | _ -> failwith "DT: impossible branch"
)) then (if ((match dtb__169 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__179, dtb__180, dtb__181) -> dtb__180
  | _ -> failwith "DT: impossible branch"
) = (match dtb__171 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__182, dtb__183, dtb__184) -> dtb__183
  | _ -> failwith "DT: impossible branch"
)) then (if (((v_Base_dEq_deq v_Eq_uBase_dBool_dBool) (match dtb__169 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__185, dtb__186, dtb__187) -> dtb__187
  | _ -> failwith "DT: impossible branch"
)) (match dtb__171 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__188, dtb__189, dtb__190) -> dtb__190
  | _ -> failwith "DT: impossible branch"
)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon dtb__170) dtb__172) else false) else false) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq = (fun a b -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges a)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges b)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__191, dtb__192) -> (if ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__193, dtb__194, dtb__195) -> dtb__194
  | _ -> failwith "DT: impossible branch"
) = (match dtb__191 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__196, dtb__197, dtb__198) -> dtb__196
  | _ -> failwith "DT: impossible branch"
)) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge ((match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__199, dtb__200, dtb__201) -> dtb__199
  | _ -> failwith "DT: impossible branch"
), (match dtb__191 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__202, dtb__203, dtb__204) -> dtb__203
  | _ -> failwith "DT: impossible branch"
), (if (match mc0 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__205, dtb__206, dtb__207) -> dtb__207
  | _ -> failwith "DT: impossible branch"
) then true else (match dtb__191 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__208, dtb__209, dtb__210) -> dtb__210
  | _ -> failwith "DT: impossible branch"
)))), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__192))) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith mc0) dtb__192))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith dtb__211) mc1)) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo dtb__212) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges = (fun g1 g2 -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo g1) g2)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__213, dtb__214) -> (if (match dtb__213 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__215, dtb__216, dtb__217) -> dtb__217
  | _ -> failwith "DT: impossible branch"
) then true else (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict dtb__214))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent = (fun edges -> ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges edges) edges)) edges))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK = (fun edges -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent edges) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict edges) else true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__218, dtb__219) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__218) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__219) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap = 512

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__220, dtb__221) -> (match dtb__220 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__222, dtb__223) -> (if ((v_Base_dPair_dfirstOf mc0) = (v_Base_dPair_dfirstOf dtb__222)) then (if ((v_Base_dPair_dsecondOf mc0) = (v_Base_dPair_dsecondOf dtb__222)) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__223)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__221)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup mc0) dtb__221))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__224, dtb__225) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq mc0) dtb__224) then true else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas mc0) dtb__225))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__226, dtb__227) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas dtb__226) mc1) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__227) mc1) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (match dtb__228 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__230, dtb__231) -> (match dtb__230 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> (if (mc0 = dtb__232) then (if (mc1 = dtb__233) then (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), ((v_Base_dList_dappend dtb__231) (C_Base_dList_dList_Base_dList_dCons (mc2, C_Base_dList_dList_Base_dList_dNil))))), dtb__229)) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233)), dtb__231)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__229)))) else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233)), dtb__231)), ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair mc0) mc1) mc2) dtb__229))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (mc0, mc1)), (C_Base_dList_dList_Base_dList_dCons (mc2, C_Base_dList_dList_Base_dList_dNil)))), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd = (fun f g edges table -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup (C_Base_dPair_dPair_Base_dPair_dPair (f, g))) table) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__234) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas edges) dtb__234) then (C_Base_dPair_dPair_Base_dPair_dPair (table, true)) else (if ((v_Base_dList_dlength dtb__234) >= v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (C_Base_dPair_dPair_Base_dPair_dPair (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair f) g) edges) table), true))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__235, dtb__236) -> (match ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd mc0) mc1) ((v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges mc2) dtb__235)) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238) -> (if dtb__238 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) mc1) mc2) dtb__236) dtb__237) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__239, dtb__240) -> (match dtb__239 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (match dtb__241 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> (if (dtb__243 = mc1) then (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs mc0) dtb__244) mc2) dtb__242) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, dtb__246) -> (if dtb__246 then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__240) dtb__245) dtb__246) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, false)))
  | _ -> failwith "DT: impossible branch"
) else ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo mc0) mc1) mc2) dtb__240) mc4) mc5))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, mc5))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne = (fun f g a table acc -> ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo f) g) a) table) acc) true))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne mc0) mc1) dtb__247) mc3) mc4) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, dtb__250) -> (if dtb__250 then (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs mc0) mc1) dtb__248) mc3) dtb__249) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__249, false)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc4, true))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__251, dtb__252) -> (match dtb__251 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__253, dtb__254) -> (match dtb__253 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__255, dtb__256) -> (match (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs dtb__255) dtb__256) dtb__254) mc1) mc2) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__257, dtb__258) -> (if dtb__258 then (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo dtb__252) mc1) dtb__257) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__257, false)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair (mc2, true))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep = (fun table -> (((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo table) table) table))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__259, dtb__260) -> (match dtb__259 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__261, dtb__262) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup dtb__261) mc1) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__263) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset dtb__262) dtb__263) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset dtb__260) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame = (fun a b -> (if ((v_Base_dList_dlength a) = (v_Base_dList_dlength b)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset a) b) else false))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop = (fun table fuel -> (if (fuel <= 0) then (C_Base_dPair_dPair_Base_dPair_dPair (table, false)) else (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep table) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265) -> (if dtb__265 then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame table) dtb__264) then (C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, true)) else ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop dtb__264) (fuel - 1))) else (C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, false)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt = (fun i j s ctors projs facts -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__266, dtb__267, dtb__268, dtb__269, dtb__270) -> dtb__268
  | _ -> failwith "DT: impossible branch"
)) j) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__271) -> (match ((((((((v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg i) dtb__271) (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__272, dtb__273, dtb__274, dtb__275, dtb__276) -> dtb__275
  | _ -> failwith "DT: impossible branch"
)) ctors) projs) (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__277, dtb__278, dtb__279, dtb__280, dtb__281) -> dtb__277
  | _ -> failwith "DT: impossible branch"
)) facts) (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> dtb__286
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__287) -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (i, j, (v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict dtb__287))), C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ = (fun i count s ctors projs facts -> (if (count <= 0) then C_Base_dList_dList_Base_dList_dNil else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt i) (count - 1)) s) ctors) projs) facts)) ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (count - 1)) s) ctors) projs) facts))))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI = (fun i s ctors projs facts -> (if (i <= 0) then ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ 0) (v_Base_dList_dlength (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__288, dtb__289, dtb__290, dtb__291, dtb__292) -> dtb__290
  | _ -> failwith "DT: impossible branch"
))) s) ctors) projs) facts) else ((v_Base_dList_dappend ((((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ i) (v_Base_dList_dlength (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__293, dtb__294, dtb__295, dtb__296, dtb__297) -> dtb__295
  | _ -> failwith "DT: impossible branch"
))) s) ctors) projs) facts)) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (i - 1)) s) ctors) projs) facts))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf = (fun ctors projs facts s -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI (v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf (match s with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__298, dtb__299, dtb__300, dtb__301, dtb__302) -> dtb__301
  | _ -> failwith "DT: impossible branch"
))) s) ctors) projs) facts))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__303, dtb__304) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo dtb__304) mc1) mc2) mc3) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair (match dtb__303 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__305, dtb__306, dtb__307, dtb__308, dtb__309) -> dtb__305
  | _ -> failwith "DT: impossible branch"
)) (match dtb__303 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> dtb__311
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf mc1) mc2) mc3) dtb__303)) mc4))
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable = (fun sites ctors projs facts -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo sites) ctors) projs) facts) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__315, dtb__316) -> (match dtb__315 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, dtb__318) -> (match dtb__317 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__319, dtb__320) -> (if (dtb__319 = dtb__320) then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK dtb__318) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__316) else false) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__316))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__321, dtb__322) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__321) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__322) else (C_Base_dList_dList_Base_dList_dCons (mc0, ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs mc0) dtb__322))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__323, dtb__324) -> (match dtb__323 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, dtb__326) -> (match dtb__325 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__327, dtb__328) -> (if (dtb__327 = dtb__328) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs dtb__327) dtb__326)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__324)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs dtb__324))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__329, dtb__330, dtb__331) -> dtb__329
  | _ -> failwith "DT: impossible branch"
)); "->>"; (bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__332, dtb__333, dtb__334) -> dtb__333
  | _ -> failwith "DT: impossible branch"
))]))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText = (fun e -> (String.concat "" [(bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__335, dtb__336, dtb__337) -> dtb__335
  | _ -> failwith "DT: impossible branch"
)); "->"; (bi_strFromInt (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__338, dtb__339, dtb__340) -> dtb__339
  | _ -> failwith "DT: impossible branch"
))]))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText = (fun e -> (if (match e with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge_Vuna_dCompiler_dElab_dTermination_dScc_dScEdge (dtb__341, dtb__342, dtb__343) -> dtb__343
  | _ -> failwith "DT: impossible branch"
) then (v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText e) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText e)))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__344, dtb__345) -> (match dtb__345 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__344)
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText dtb__344); ","; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__345)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__346, dtb__347) -> (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK dtb__346) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__347) else (C_Base_dList_dList_Base_dList_dCons ((String.concat "" [mc0; "{"; (v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText dtb__346); "}"]), ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText mc0) dtb__347))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__348, dtb__349) -> (match dtb__348 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__350, dtb__351) -> (match dtb__350 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__352, dtb__353) -> (if (dtb__352 = dtb__353) then ((v_Base_dList_dappend ((v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText dtb__352) dtb__351)) (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__349)) else (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText dtb__349))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag = (fun table -> (v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma (v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText table))))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun table0 -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop table0) 240) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__354, dtb__355) -> (if dtb__355 then (if (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable dtb__354) then (C_Base_dResult_dResult_Base_dResult_dOk (0)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [msg; " [SCT \230\151\160\228\184\139\233\153\141\231\142\175: "; (v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag dtb__354); "]"])))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable sites) ctors) projs) facts))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__356, dtb__357) -> (match dtb__356 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__358, dtb__359) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__358))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf = (fun name defTbl -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl name) defTbl) with
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | C_Base_dList_dList_Base_dList_dCons (dtb__360, dtb__361) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__360)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__362) -> dtb__362
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__363, dtb__364, dtb__365, dtb__366) -> (match (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar dtb__363) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__367) -> (dtb__367 = mc0)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict = (fun callerFuel site -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr (match site with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__368, dtb__369, dtb__370, dtb__371, dtb__372) -> dtb__370
  | _ -> failwith "DT: impossible branch"
)) 0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__373) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__374, dtb__375, dtb__376) -> (match dtb__374 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__377, dtb__378) -> (if (dtb__377 = "-") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__379, dtb__380) -> (match dtb__379 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__381, dtb__382) -> (match dtb__380 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__383, dtb__384) -> (match dtb__383 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__385, dtb__386) -> (match dtb__384 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (dtb__381 = callerFuel) then (if (dtb__385 > 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (true)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__375) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__387, dtb__388) -> (if (dtb__387 = callerFuel) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (false)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__373)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__389, dtb__390) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf (match dtb__389 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395) -> dtb__391
  | _ -> failwith "DT: impossible branch"
)) mc1)) dtb__389) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__390) false) mc4)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__396) -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo mc0) mc1) dtb__390) mc3) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__389 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> dtb__397
  | _ -> failwith "DT: impossible branch"
), (match dtb__389 with
  | C_Vuna_dCompiler_dElab_dTermination_dScc_dSite_Vuna_dCompiler_dElab_dTermination_dScc_dSite (dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> dtb__403
  | _ -> failwith "DT: impossible branch"
))), (if dtb__396 then 1 else 0))), mc4)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf = (fun comp defTbl sites -> (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo comp) defTbl) sites) true) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__407, dtb__408) -> (match ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl dtb__407) mc1) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__409, dtb__410) -> (match (v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName (v_Base_dPair_dfirstOf dtb__409)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__411) -> (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard dtb__411) (v_Base_dPair_dsecondOf dtb__409)) then ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded dtb__408) mc1) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread = (fun comp defTbl ctors projs facts msg -> ((fun sites -> ((fun edges -> ((fun strictCount -> (if (strictCount > 0) then (if ((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded comp) defTbl) then (if ((v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle comp) edges) then (C_Base_dResult_dResult_Base_dResult_dErr (msg)) else (C_Base_dResult_dResult_Base_dResult_dOk (0))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg))) else (C_Base_dResult_dResult_Base_dResult_dErr (msg)))) (v_Base_dList_dlength (v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes ((v_Base_dList_dmap v_Base_dPair_dsecondOf) edges))))) (((v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf comp) defTbl) sites))) (((((v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect comp) ctors) projs) defTbl) facts)))
