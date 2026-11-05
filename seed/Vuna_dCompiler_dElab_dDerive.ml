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
let v_Vuna_dCompiler_dElab_dDerive_dtraitShortName = (fun tname -> (v_Base_dPair_dsecondOf (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot tname))))

let v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal = (fun tname methodName -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot tname)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__0, dtb__1) -> (match dtb__0 with
  | C_Base_dList_dList_Base_dList_dNil -> methodName
  | _ -> (String.concat "" [(v_Vuna_dCompiler_dCommon_djoinDots dtb__0); "."; methodName])
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__2, dtb__3, dtb__4) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__2) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__3))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__5, dtb__6, dtb__7, dtb__8, dtb__9) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__7) then true else ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__8))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__10, dtb__11, dtb__12) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__10) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__11))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__13, dtb__14) -> (dtb__13 = mc0)
  | _ -> false
))
and v_Vuna_dCompiler_dElab_dDerive_danyExprMentions = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__15) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyExprMentions mc0) dtb__16))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match dtb__17 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName mc0) dtb__20) then true else ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions mc0) dtb__18))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (if ((v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions dtb__23) mc1) then (C_Base_dList_dList_Base_dList_dCons (dtb__23, ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__24) mc1))) else ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams dtb__24) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (mc0, ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (p, mc2)))) mc1), mc2))
))

let v_Vuna_dCompiler_dElab_dDerive_dinstHead = (fun tn dname params sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (tn, sp)), (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dname, sp))) params) sp), C_Base_dList_dList_Base_dList_dNil)), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dshowOne = (fun proj v sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (proj, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (v, sp)), C_Base_dList_dList_Base_dList_dNil)), sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dshowFields = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (match dtb__26 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__25) mc2), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (")", mc2)), C_Base_dList_dList_Base_dList_dNil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dElab_dDerive_dshowOne mc0) dtb__25) mc2), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("++", mc2)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (" ", mc2)), (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) dtb__26) mc2), C_Base_dList_dList_Base_dList_dNil)))), mc2)), C_Base_dList_dList_Base_dList_dNil)))), mc2))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (")", mc2))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dshowCtor = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (mc1, mc3))
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("++", mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr ((String.concat "" ["("; mc1; " "]), mc3)), (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dElab_dDerive_dshowFields mc0) mc2) mc3), C_Base_dList_dList_Base_dList_dNil)))), mc3))
))

let rec v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo = (fun remaining prefix n -> (if (remaining <= 0) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((prefix ^ (bi_strFromInt (n - remaining))), (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (remaining - 1)) prefix) n)))))

let v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt = (fun prefix i n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo (n - i)) prefix) n))

let v_Vuna_dCompiler_dElab_dDerive_dvarNames = (fun prefix n -> (((v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt prefix) 0) n))

let rec v_Vuna_dCompiler_dElab_dDerive_dshowAlts = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (match dtb__27 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__29, dtb__30, dtb__31, dtb__32) -> ((fun vs -> ((fun pat -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, ((((v_Vuna_dCompiler_dElab_dDerive_dshowCtor mc0) dtb__29) vs) mc2))), (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts mc0) dtb__28) mc2)))) (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__29, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc2)))) vs), mc2)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dshowBody = (fun proj ctors scrut sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (scrut, sp)), (((v_Vuna_dCompiler_dElab_dDerive_dshowAlts proj) ctors) sp), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dgtBody = (fun ltProj sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (ltProj, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dgeBody = (fun leProj sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (leProj, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dboolTrue = (fun sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (1, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (1, sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dboolFalse = (fun sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (1, sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dconjFields = (fun mc0 mc1 mc2 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__35, dtb__36) -> (match dtb__34 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__33, mc2)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__35, mc2)), C_Base_dList_dList_Base_dList_dNil)))), mc2))
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("&&", mc2)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", mc2)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__33, mc2)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__35, mc2)), C_Base_dList_dList_Base_dList_dNil)))), mc2)), (C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dElab_dDerive_dconjFields dtb__34) dtb__36) mc2), C_Base_dList_dList_Base_dList_dNil)))), mc2))
)
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc2)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc2)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_deqInner = (fun cn ar sp -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (cn, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, sp)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)), sp)), (((v_Vuna_dCompiler_dElab_dDerive_dconjFields ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") ar)) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") ar)) sp))), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp))), C_Base_dList_dList_Base_dList_dNil)))))

let v_Vuna_dCompiler_dElab_dDerive_deqAlt = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__37, dtb__38, dtb__39, dtb__40) -> ((fun vs -> ((fun pat -> ((fun body -> (C_Base_dPair_dPair_Base_dPair_dPair (pat, body))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", mc1)), (((v_Vuna_dCompiler_dElab_dDerive_deqInner dtb__37) dtb__39) mc1), mc1)))) (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__37, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc1)))) vs), mc1)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__39))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_deqBody = (fun ctors sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), ((v_Base_dList_dmap (fun c -> ((v_Vuna_dCompiler_dElab_dDerive_deqAlt c) sp))) ctors), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dneqBody = (fun eqProj sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (eqProj, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dltFields = (fun mc0 mc1 mc2 mc3 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__43, dtb__44) -> (match dtb__42 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("<", mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__41, mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__43, mc3)), C_Base_dList_dList_Base_dList_dNil)))), mc3))
  | _ -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("||", mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("<", mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__41, mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__43, mc3)), C_Base_dList_dList_Base_dList_dNil)))), mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("&&", mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc0, mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__41, mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__43, mc3)), C_Base_dList_dList_Base_dList_dNil)))), mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("&&", mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (mc0, mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__43, mc3)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__41, mc3)), C_Base_dList_dList_Base_dList_dNil)))), mc3)), (C_Base_dList_dList_Base_dList_dCons (((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) dtb__42) dtb__44) mc3), C_Base_dList_dList_Base_dList_dNil)))), mc3)), C_Base_dList_dList_Base_dList_dNil)))), mc3)), C_Base_dList_dList_Base_dList_dNil)))), mc3))
)
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc3)
)
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc3)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dDerive_dordInnerGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__45, dtb__46) -> (match dtb__45 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__47, dtb__48, dtb__49, dtb__50) -> ((fun gs -> ((fun pat -> ((fun body -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo mc0) mc1) mc2) dtb__46) (mc4 + 1)) mc5)))) (if (mc4 = mc1) then ((((v_Vuna_dCompiler_dElab_dDerive_dltFields mc0) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") mc2)) gs) mc5) else (if (mc4 < mc1) then (v_Vuna_dCompiler_dElab_dDerive_dboolFalse mc5) else (v_Vuna_dCompiler_dElab_dDerive_dboolTrue mc5))))) (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__47, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc5)))) gs), mc5)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fb") dtb__49))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dordInner = (fun leProj i ar all sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dordInnerGo leProj) i) ar) all) 0) sp))

let rec v_Vuna_dCompiler_dElab_dDerive_dordAlts = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__51, dtb__52) -> (match dtb__51 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__53, dtb__54, dtb__55, dtb__56) -> ((fun vs -> ((fun pat -> ((fun body -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pat, body)), (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts mc0) mc1) dtb__52) (mc3 + 1)) mc4)))) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", mc4)), (((((v_Vuna_dCompiler_dElab_dDerive_dordInner mc0) mc3) dtb__55) mc1) mc4), mc4)))) (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__53, ((v_Base_dList_dmap (fun v -> (C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (v, mc4)))) vs), mc4)))) ((v_Vuna_dCompiler_dElab_dDerive_dvarNames "fa") dtb__55))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dordBody = (fun leProj ctors sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), (((((v_Vuna_dCompiler_dElab_dDerive_dordAlts leProj) ctors) ctors) 0) sp), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dleBody = (fun ltProj sp -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("||", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (ltProj, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (ltProj, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sy", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("sx", sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)), (v_Vuna_dCompiler_dElab_dDerive_dboolFalse sp), (v_Vuna_dCompiler_dElab_dDerive_dboolTrue sp), sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)))

let v_Vuna_dCompiler_dElab_dDerive_dderiveInstance = (fun dname params ctors tn sp -> ((fun hd -> ((fun used -> ((fun ctxExprs -> (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Show") then ((fun proj -> ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctxExprs, hd, ms, sp))))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("show", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), C_Base_dList_dList_Base_dList_dNil)), ((((v_Vuna_dCompiler_dElab_dDerive_dshowBody proj) ctors) "sx") sp), sp)), C_Base_dList_dList_Base_dList_dNil)))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "show")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Eq") then ((fun eqProj -> ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctxExprs, hd, ms, sp))))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("eq", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dDerive_deqBody ctors) sp), sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("neq", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dDerive_dneqBody eqProj) sp), sp)), C_Base_dList_dList_Base_dList_dNil)))))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "eq")) else (if ((v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn) = "Ord") then ((fun ltProj -> ((fun leProj -> ((fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctxExprs, hd, ms, sp))))) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("lt", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), (((v_Vuna_dCompiler_dElab_dDerive_dordBody leProj) ctors) sp), sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("le", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dDerive_dleBody ltProj) sp), sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("gt", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgtBody ltProj) sp), sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun ("ge", (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sx", sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar ("sy", sp)), C_Base_dList_dList_Base_dList_dNil)))), ((v_Vuna_dCompiler_dElab_dDerive_dgeBody leProj) sp), sp)), C_Base_dList_dList_Base_dList_dNil)))))))))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "le"))) ((v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal tn) "lt")) else ((fun kind -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(v_Vuna_dCompiler_dCommon_dshowSpanLoc sp); ": cannot derive `"; kind; "` (supported: Show, Eq, Ord)"])))) (v_Vuna_dCompiler_dElab_dDerive_dtraitShortName tn)))))) ((v_Base_dList_dmap (fun p -> (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (tn, sp)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (p, sp)), C_Base_dList_dList_Base_dList_dNil)), sp)))) used))) ((v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams params) ctors))) ((((v_Vuna_dCompiler_dElab_dDerive_dinstHead tn) dname) params) sp)))

let rec v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dDerive_dderiveInstance mc0) mc1) mc2) dtb__57) mc4)) (fun decl -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo mc0) mc1) mc2) dtb__58) mc4) (C_Base_dList_dList_Base_dList_dCons (decl, mc5)))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse mc5)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dderivingsFor = (fun dname params ctors derivings sp -> ((((((v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo dname) params) ctors) derivings) sp) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__59, dtb__60) -> (match dtb__59 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65, dtb__66) -> (if ((v_Base_dList_dlength dtb__65) = 0) then (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__60) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dDerive_dderivingsFor dtb__61) dtb__62) dtb__64) dtb__65) dtb__66)) (fun insts -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__60)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend insts) more))))))))
  | _ -> (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings dtb__60)
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings = (fun decls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings decls)) (fun insts -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend decls) insts))))))
