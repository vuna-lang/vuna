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
let v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase = (fun alts -> (if (v_Vuna_dCompiler_dElab_dCase_danyNestedPat alts) then true else (v_Vuna_dCompiler_dElab_dCase_dhasDupNames (v_Vuna_dCompiler_dElab_dCase_daltNames alts))))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo = (fun n acc -> (if (n <= 0) then acc else ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo (n - 1)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (acc, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), C_Base_dList_dList_Base_dList_dNil)))))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm = (fun n -> ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo n) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor, C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult = (fun sp n -> (if (n < 0) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNatLiteralOutOfRange) else (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm n)))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm = (fun t -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ("natToInt")), t, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue = (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dintTypeName, C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue = (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dnatTypeName, C_Base_dList_dList_Base_dList_dNil))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__0) -> (match dtb__0 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__1, dtb__2) -> (match dtb__2 with
  | C_Base_dList_dList_Base_dList_dNil -> (dtb__1 = v_Vuna_dCompiler_dIntrinsics_dintTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy = (fun ec v -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__3) -> (match dtb__3 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__4, dtb__5) -> (match dtb__5 with
  | C_Base_dList_dList_Base_dList_dNil -> (dtb__4 = v_Vuna_dCompiler_dIntrinsics_dnatTypeName)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) v)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm = (fun ec expected actual term -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) actual) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm term))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands = (fun ec aTy bTy aTerm bTerm -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm), (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) bTy) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, bTy)), (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm aTerm), bTerm)))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) aTy) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) bTy) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (aTy, v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)), (C_Base_dPair_dPair_Base_dPair_dPair (aTerm, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm bTerm))))))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName = (fun name -> (if (if (if (name = "+") then true else (name = "-")) then true else (name = "*")) then true else (name = "/")))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName = (fun mc0 -> (if (mc0 = "+") then "natAdd" else (if (mc0 = "-") then "natSub" else (if (mc0 = "*") then "natMul" else "natDiv"))))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 = (fun name a b -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name)), a, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), b, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 = (fun name a b -> (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName name))), a, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), b, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))

let v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__6, dtb__7) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__8, dtb__9, dtb__10) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__8)) (fun value2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (value2, dtb__9, dtb__10))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__11, dtb__12) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt mc0)) dtb__11)) (fun stmts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (stmts2, dtb__12))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__13, dtb__14, dtb__15) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__13)) (fun base2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun fv -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (v_Base_dPair_dsecondOf fv))) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf fv), v2)))))))) dtb__14)) (fun fields2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (base2, fields2, dtb__15))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__16, dtb__17, dtb__18) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun fv -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) (v_Base_dPair_dsecondOf fv))) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf fv), v2)))))))) dtb__17)) (fun fields2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__16, fields2, dtb__18))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__19, dtb__20, dtb__21) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__19)) (fun base2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (base2, dtb__20, dtb__21))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__22, dtb__23, dtb__24, dtb__25) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__22)) (fun c2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__23)) (fun t2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__24)) (fun el2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, t2, el2, dtb__25))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__26, dtb__27, dtb__28) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__26)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__27)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__28))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__29, dtb__30, dtb__31, dtb__32) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind mc0)) dtb__29)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__30)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__31, dtb__32))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__35)) (fun dom2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__36)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__33, dtb__34, dom2, cod2, dtb__37))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__38, dtb__39, dtb__40) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__38)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0)) dtb__39)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__40))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__41, dtb__42, dtb__43) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__42)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__41, b2, dtb__43))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__44, dtb__45) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__44, dtb__45))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__46, dtb__47) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__46, dtb__47))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__48, dtb__49) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__48, dtb__49))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__50, dtb__51) -> ((v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable mc0)) dtb__50)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__53)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, v2))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__54, dtb__55) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__54)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (v2, dtb__55))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__56, dtb__57, dtb__58) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns mc0) dtb__57)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__56, v2, dtb__58))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel = (fun fuel globals ctx ec dd idxs scrutVal expected cname args psp body -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dd)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 psp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownConstructorInCase (cname, (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd)))) cname) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dd))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__59) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dCase_dbindCtorTele ctx) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__59)) args)) (fun p -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (match dtb__61 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__62, dtb__63) -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty dtb__63) then (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 psp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBranchTooManyArgs (cname))) cname) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dCase_dunifyIdxList ec) C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__60)) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn dtb__60) dtb__59)) ((v_Base_dList_dmap (fun v -> (((v_Vuna_dCompiler_dElab_dTypes_drefineValue C_Base_dList_dList_Base_dList_dNil) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) v))) idxs))) (fun refsIdx -> (match (((v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify ec) dtb__60) refsIdx) with
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleIndex -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchIndex)
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchImpossibleEmptyCtx -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImpossibleBranchEmptyCtx)
  | C_Vuna_dCompiler_dElab_dCase_dBranchVerdict_Vuna_dCompiler_dElab_dCase_dBranchOk -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee ec) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth dtb__60)) refsIdx) ((v_Vuna_dCompiler_dElab_dCase_dctorValueIn dtb__60) dtb__59)) scrutVal)) (fun refs2 -> ((fun refinedExpected -> ((fun branchCtx2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) branchCtx2) ec) body) refinedExpected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt (cname, dtb__62, dtb__64)), dtb__65))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_dctxRefine dtb__60) refs2))) (((v_Vuna_dCompiler_dElab_dTypes_drefineValue refs2) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) expected))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 mc9 mc10 -> (match mc9 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__66 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__70, dtb__71, dtb__72) -> ((v_Base_dResult_dandThen ((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6) mc7) mc8) dtb__70) dtb__71) dtb__72) dtb__69)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__73, dtb__74) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (mc0 - 1)) mc1) mc2) dtb__74) mc4) mc5) mc6) mc7) mc8) dtb__67) (C_Base_dList_dList_Base_dList_dCons (dtb__73, mc10)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__75, dtb__76) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__67) mc10) dtb__69) dtb__75) dtb__76)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__77) -> (((((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) mc6) mc8) dtb__67) mc10) dtb__69) "_") dtb__77)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__68)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dOnlyCtorPatterns)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc10), mc3)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel = (fun fuel globals ctx ec scrutTy dd idxs expected rest acc body pname psp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> (if (v_Vuna_dCompiler_dElab_dMeta_dnonEmpty rest) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 psp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCatchAllNotLast) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79) -> ((fun binds -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dCaseAlt_Vuna_dCompiler_dCore_dTerm_dCaseAlt ("", binds, dtb__78)), acc))), dtb__79))))) (if (pname = "_") then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (pname, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) scrutTy))), C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
))))) (if (pname = "_") then ctx else (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue pname) scrutTy) ctx)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat alts)) (fun _u -> (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase alts) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel (fuel - 1)) globals) ctx) ec) scrut) alts) expected) sp) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) scrut)) (fun ps -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (match dtb__81 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__82, dtb__83) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel (fuel - 1)) globals) ctx) dtb__83) dtb__80) dtb__82) alts) expected) sp)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ps))))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel = (fun fuel globals ctx ec scrut alts expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun name -> ((fun clauses -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr (v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable ec)) clauses) name)) (fun bodyExpr -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (name, sp)), scrut)), C_Base_dList_dList_Base_dList_dNil)), bodyExpr, false, sp))) expected)))) ((v_Base_dList_dmap (fun alt -> (C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((v_Base_dPair_dfirstOf alt), C_Base_dList_dList_Base_dList_dNil)), (v_Base_dPair_dsecondOf alt))))) alts))) ("nd_scrut" ^ (bi_strFromInt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel = (fun fuel globals ctx ec scrutTerm scrutTy alts expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__84) -> (match dtb__84 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__85, dtb__86) -> (if (if (dtb__85 = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then ((v_Base_dList_dlength dtb__86) = 0) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) alts) expected) sp) else (if (dtb__85 = "Int") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "Int") alts) expected) sp) else (if (dtb__85 = "String") then (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel (fuel - 1)) globals) ctx) ec) scrutTerm) "String") alts) expected) sp) else (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel (fuel - 1)) globals) ctx) ec) scrutTerm) scrutTy) dtb__85) dtb__86) alts) expected) sp))))
  | _ -> ((fun _u -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)) (v_Vuna_dCompiler_dDebug_dnote ("caseFam: " ^ (v_Vuna_dCompiler_dCore_dEval_dshowValue ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy)))))
)
  | _ -> ((fun _u -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)) (v_Vuna_dCompiler_dDebug_dnote ("caseFam: " ^ (v_Vuna_dCompiler_dCore_dEval_dshowValue ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy)))))
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) scrutTy))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel = (fun fuel globals ctx ec scrutTerm alts expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor) expected) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> (match dtb__88 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> (match dtb__89 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__87, dtb__91)), dtb__90))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel (fuel - 1)) globals) ctx) ec) alts) v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor) expected) sp)) (fun q -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> (match dtb__93 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (scrutTerm, dtb__87, dtb__92)), dtb__95))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel = (fun fuel globals ctx ec alts target expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (fuel - 1)) globals) ctx) ec) alts) target) expected) sp) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__96 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> (match dtb__98 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__100, dtb__101, dtb__102) -> (if (dtb__100 = mc5) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__99) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, (C_Base_dPair_dPair_Base_dPair_dPair (mc8, dtb__104))))))
  | _ -> failwith "DT: impossible branch"
))) else (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__97) mc5) mc6) mc7) mc8))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__105, dtb__106) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__99) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__97) mc5) mc6) mc7) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__107)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__109) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__99) mc6)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel (mc0 - 1)) mc1) mc2) mc3) dtb__97) mc5) mc6) mc7) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__110)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__98)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dBoolCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match mc8 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__112, (C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, mc3))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 mc7) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotExhaustive (mc5))) mc5)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel = (fun fuel globals ctx ec scrutTerm tyName alts expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) ec) scrutTerm) tyName) alts) expected) sp)) (fun p -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> (match dtb__114 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (if dtb__115 then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__116)))) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseNeedsFallback))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match dtb__117 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (match dtb__119 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__121, dtb__122) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__121))) dtb__120) dtb__118) mc7) mc8)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__123, dtb__124) -> (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__123))) dtb__120) dtb__118) mc7) mc8)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__125, dtb__126) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel (mc0 - 1)) mc1) mc2) mc3) mc4) mc5) dtb__125) dtb__120) mc7) mc8)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, dtb__128) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__128))))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__129) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) dtb__120) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, (C_Base_dPair_dPair_Base_dPair_dPair (true, dtb__131))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__119)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseRestriction)
)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (false)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)), (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (0)))), (C_Base_dPair_dPair_Base_dPair_dPair (false, mc3)))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel = (fun fuel globals ctx ec scrutTerm tyName litTerm body rest expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__132, dtb__133) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel (fuel - 1)) globals) ctx) dtb__133) scrutTerm) tyName) rest) expected) sp)) (fun q -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> (match dtb__135 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal ((v_Vuna_dCompiler_dElab_dMeta_dlitEqName tyName))), scrutTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), litTerm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__132, dtb__134)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel = (fun fuel globals ctx ec scrutTerm tyName name body expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun ctx2 -> ((fun rig -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx2) ec) body) expected)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__138)), scrutTerm, rig)), dtb__139))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Base_dList_dNil))))))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (tyName, C_Base_dList_dList_Base_dList_dNil))))) ctx))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel = (fun fuel globals ctx ec scrutTerm scrutTy fam idxs alts expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup fam) (v_Vuna_dCompiler_dElab_dTypes_decDatas ec)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNotInductiveFamily)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__140) -> ((v_Base_dResult_dandThen (((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel (fuel - 1)) globals) ctx) ec) scrutTy) dtb__140) idxs) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) scrutTerm)) expected) alts) C_Base_dList_dList_Base_dList_dNil)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__141, dtb__142) -> (((((((((v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone dtb__142) ctx) dtb__140) idxs) alts) expected) sp) scrutTerm) dtb__141)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel = (fun fuel globals ctx ec scrut alts sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> ((fun metaTy -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) dtb__144) scrut) alts) metaTy) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, dtb__146) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__145, (C_Base_dPair_dPair_Base_dPair_dPair (metaTy, dtb__146))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__143))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel = (fun fuel globals ctx ec c sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) c) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil))))) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__147) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__147))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__148) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) c)) (fun pc -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, dtb__150) -> (match dtb__150 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__151, dtb__152) -> (if (v_Vuna_dCompiler_dElab_dMeta_disBoolType dtb__151) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__149, dtb__152)))) else ((v_Vuna_dCompiler_dElab_dTypes_derrAt sp) (String.concat "" ["if condition must be "; v_Vuna_dCompiler_dIntrinsics_dboolTypeName; " (got "; ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__151); ")"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match expr with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__153, dtb__154) -> (if (dtb__153 = "Type") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (v_Vuna_dCompiler_dCore_dTerm_dlevelZero)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc v_Vuna_dCompiler_dCore_dTerm_dlevelZero))), ec)))))) else (if (dtb__153 = "_") then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__154) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dHoleNoExpectedType) else (((((v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef globals) ctx) ec) dtb__153) dtb__154)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__155, dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__155)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("Int", C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__157, dtb__158) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__157)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal ("String", C_Base_dList_dList_Base_dList_dNil)))), ec))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) dtb__159) dtb__160) dtb__161) dtb__162) dtb__163)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__164, dtb__165, dtb__166) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel (fuel - 1)) globals) ctx) ec) dtb__164) dtb__165) dtb__166)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__167, dtb__168, dtb__169) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__169) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaNoSignature)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__170, dtb__171, dtb__172, dtb__173) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel (fuel - 1)) globals) ctx) ec) dtb__170) dtb__173)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__175) dtb__171)) (fun pt -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177) -> (match dtb__177 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__179) dtb__172)) (fun pe -> ((fun nd_uscrut25 -> (match nd_uscrut25 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> (match dtb__181 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__182, dtb__183) -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__183) dtb__178) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__183) dtb__182) else false) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__174, dtb__176, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__180))), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__183)))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__183) dtb__178) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__183) dtb__182) else false) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__174, (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__176), dtb__180)), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__183)))))) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__183) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__178) dtb__182)) (fun ec4 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__174, dtb__176, dtb__180)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, ec4))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pe)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__184, dtb__185, dtb__186, dtb__187) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) ec) dtb__184) dtb__185) dtb__186) dtb__187)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__188, dtb__189) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__188, dtb__189)))) (fun e2 -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) e2)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__190, dtb__191, dtb__192) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel (fuel - 1)) globals) ctx) ec) dtb__190) dtb__191) dtb__192)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__193, dtb__194, dtb__195) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__195) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordFieldAccessUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__196, dtb__197, dtb__198) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__198) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordsUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__199, dtb__200, dtb__201) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__201) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dRecordUpdateUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__202, dtb__203) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__203) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dDoUnsupported)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__204, dtb__205, dtb__206) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel (fuel - 1)) globals) ctx) ec) dtb__204) dtb__205) dtb__206)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unreordered infix/paren in elaboration"))
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel = (fun fuel globals ctx ec value ty sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) ty)) (fun pt -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> (match dtb__208 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__209, dtb__210) -> ((fun tyVal -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__210) value) tyVal)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, dtb__212) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__211, (C_Base_dPair_dPair_Base_dPair_dPair (tyVal, dtb__212))))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__207))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel = (fun fuel globals ctx ec name implicit dom cod sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dom)) (fun pd -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, dtb__214) -> (match dtb__214 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__215, dtb__216) -> ((fun lvl -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx2) dtb__216) cod)) (fun pc -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__217, dtb__218) -> (match dtb__218 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__219, dtb__220) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (name, implicit, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig implicit) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__213)), dtb__213, dtb__217)), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (((v_Vuna_dCompiler_dCore_dTerm_dlevelMax dtb__215) dtb__219))), dtb__220))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pc)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBind name) dtb__213) ctx))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pd)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel = (fun fuel globals ctx ec fn args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__221, dtb__222) -> (if (dtb__221 = "->") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> (match dtb__224 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__225, dtb__226) -> (match dtb__226 with
  | C_Base_dList_dList_Base_dList_dNil -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel (fuel - 1)) globals) ctx) ec) "_") false) dtb__223) dtb__225) sp)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dInvalidArrowType)
)) args) else (if (dtb__221 = "Type") then ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__227, dtb__228) -> (match dtb__227 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__229, dtb__230) -> (match dtb__228 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (dtb__229 < 0) then ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__230) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUniverseLevelNonNegative) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType ((v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__229))), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType ((v_Vuna_dCompiler_dCore_dTerm_dlevelSucc (v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__229)))), ec)))))))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__222) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__222) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 dtb__222) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTypeLevelArg)
)) args) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__231, dtb__232) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__231) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__233) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__231) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__234) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__234))) args) sp)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__235, dtb__236) -> (match dtb__236 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__238)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__231))) dtb__235), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__237, dtb__238))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__231) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__239) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__231) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__240) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__240))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__239)) args) sp)) (fun pa -> ((fun nd_uscrut19 -> (match nd_uscrut19 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__241, dtb__242) -> (match dtb__242 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__244)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__231))) dtb__241), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__243, dtb__244))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__231) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__245) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__245))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__232) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__231))) dtb__231)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
)))
  | _ -> (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__246, dtb__247) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__246) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__248) -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) dtb__246) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__249) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__249))) args) sp)) (fun pa -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__250, dtb__251) -> (match dtb__251 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__252, dtb__253) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__253)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__246))) dtb__250), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__252, dtb__253))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup dtb__246) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__254) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__246) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__255) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__255))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__254)) args) sp)) (fun pa -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__256, dtb__257) -> (match dtb__257 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__259)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__246))) dtb__256), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__258, dtb__259))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__246) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__260) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__260))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 dtb__247) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (dtb__246))) dtb__246)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
)
)) fn)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel = (fun fuel globals ctx ec fn args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__261, dtb__262) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__261) args) sp)) (fun mspec -> (match mspec with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__263) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__263))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel (fuel - 1)) globals) ctx) ec) fn) args) sp)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel = (fun fuel globals ctx ec fn args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) fn)) (fun pf -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__264, dtb__265) -> (match dtb__265 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__266, dtb__267) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) dtb__267) dtb__266) args) sp)) (fun pa -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__268, dtb__269) -> (match dtb__269 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, dtb__271) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__271)) dtb__264) dtb__268), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, dtb__271))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pf)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel = (fun fuel globals ctx ec ty args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo 64) globals) ctx) ec) ty) args) sp)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo = (fun fuel globals ctx ec ty args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__272, dtb__273, dtb__274, dtb__275, dtb__276) -> (if dtb__273 then (if ((v_Vuna_dCompiler_dElab_dDict_disDictDomain ec) dtb__275) then (if ((v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta ec) dtb__275) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec) dtb__275) dtb__276) args) sp) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel (fuel - 1)) globals) ec) ctx) dtb__275) args) sp)) (fun ec0 -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__277) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec0)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__275)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__275) dtb__276) args) sp) else (if ((v_Vuna_dCompiler_dElab_dDict_disRigidDictArg ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__275)) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel (fuel - 1)) globals) ctx) ec0) dtb__275) dtb__276) args) sp) else (C_Base_dResult_dResult_Base_dResult_dErr (dtb__277))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__278) -> (match dtb__278 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280) -> ((fun ty2 -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__280) ty2) args) sp)) (fun q -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__281, dtb__282) -> (match dtb__282 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, dtb__284) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__281)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__283, dtb__284))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__276) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__279)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn globals) ctx) ec0) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec0) dtb__275)) sp))))) else (if (((v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain ctx) ec) dtb__275) then (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__285, dtb__286) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__286) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__276) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__285))) args) sp)) (fun p -> ((fun nd_uscrut18 -> (match nd_uscrut18 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__287, dtb__288) -> (match dtb__288 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__289, dtb__290) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__285, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), dtb__287)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__289, dtb__290))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
) else ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 sp) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dImplicitParamKind))) else (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__291, dtb__292) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__291) dtb__275)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__293, dtb__294) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) dtb__294) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__276) ((v_Vuna_dCompiler_dElab_dTypes_devalCtx ctx) dtb__293))) dtb__292) sp)) (fun q -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__295, dtb__296) -> (match dtb__296 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__297, dtb__298) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__293, ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__275))), dtb__295)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__297, dtb__298))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) q)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, (C_Base_dPair_dPair_Base_dPair_dPair (forced, ec))))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__299, dtb__300) -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__299)) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dTooManyArgs)
  | _ -> failwith "DT: impossible branch"
)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ty))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel = (fun fuel globals ctx ec dom clo args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun m -> (match ((v_Vuna_dCompiler_dElab_dTypes_dnewMeta ctx) ec) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, dtb__302) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo (fuel - 1)) globals) ctx) ((v_Vuna_dCompiler_dElab_dTypes_decAddDictGoal dtb__302) (C_Vuna_dCompiler_dElab_dTypes_dDtDictGoal_Vuna_dCompiler_dElab_dTypes_dDtDictGoal (m, ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__302) dom))))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure clo) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__301))) args) sp)) (fun p -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__303, dtb__304) -> (match dtb__304 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__305, dtb__306) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), dtb__303)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__305, dtb__306))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dTypes_decNext ec))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel = (fun fuel globals ec ctx dom args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dDict_ddictClassArg ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__307) -> (match ((v_Vuna_dCompiler_dElab_dDict_ddictArgKind ec) dom) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__308) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVMeta (dtb__309, dtb__310) -> (match dtb__310 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__307) dtb__308) args) sp)) (fun ecProbe -> (match ((v_Vuna_dCompiler_dCore_dTerm_dmetaLookup dtb__309) (v_Vuna_dCompiler_dElab_dTypes_decSolTbl ecProbe)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311) -> (match ((((((v_Vuna_dCompiler_dCore_dConv_dsolveMeta (v_Vuna_dCompiler_dElab_dTypes_decDefTbl ec)) (v_Vuna_dCompiler_dElab_dTypes_decSolsP ec)) 0) dtb__309) C_Base_dList_dList_Base_dList_dNil) dtb__311) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__312) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dTypes_decPutSols ec) (v_Vuna_dCompiler_dCore_dTerm_dsolsList dtb__312))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__313) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__307) dtb__308) args) sp)
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) ec) ctx) dtb__307) dtb__308) args) sp)
)) dtb__307)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel = (fun fuel globals ec ctx argTy argKind args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match args with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | C_Base_dList_dList_Base_dList_dCons (dtb__314, dtb__315) -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__316) -> (match dtb__316 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, dtb__318) -> (match dtb__318 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__319, dtb__320) -> ((fun forced -> (if (v_Vuna_dCompiler_dCore_dTerm_disTypeValue forced) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__320) ctx) argTy) argKind) dtb__315) sp) else (if (((((v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind globals) dtb__320) ctx) forced) argKind) then (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__320) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) argTy) (v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf forced)) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__321) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__321))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__322) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__320) ctx) argTy) argKind) dtb__315) sp)
  | _ -> failwith "DT: impossible branch"
) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel (fuel - 1)) globals) dtb__320) ctx) argTy) argKind) dtb__315) sp)))) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__320) dtb__319))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__323) -> (C_Base_dResult_dResult_Base_dResult_dOk (ec))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__314))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName name) then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__324, dtb__325) -> (match dtb__325 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__326, dtb__327) -> (match dtb__327 with
  | C_Base_dList_dList_Base_dList_dNil -> (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy ec) expected) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__324) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__328, dtb__329) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__329) dtb__326) v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__330, dtb__331) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__328) dtb__330), dtb__331))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy ec) expected) then ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__324) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__332, dtb__333) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__333) dtb__326) v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__335) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__332) dtb__334), dtb__335))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (v_Vuna_dCompiler_dElab_dTerm_dImpl_disArithOpName name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__336, dtb__337) -> (match dtb__337 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__338, dtb__339) -> (match dtb__339 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__336)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__340, dtb__341) -> (match dtb__341 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__342, dtb__343) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__343) dtb__338)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__344, dtb__345) -> (match dtb__345 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__346, dtb__347) -> (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__347) dtb__342) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__347) dtb__346) else false) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__340) dtb__344), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__347)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__347) dtb__342) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__347) dtb__346) else false) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__340) dtb__344), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__347)))))))) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__347) dtb__342) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__347) dtb__346) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__338) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__348) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__338)) dtb__348)) (fun bNat -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) dtb__340) bNat), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__347))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__340)) dtb__344), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__347))))))))
  | _ -> failwith "DT: impossible branch"
) else (if (if ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy dtb__347) dtb__342) then ((v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy dtb__347) dtb__346) else false) then (match (v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr dtb__336) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__349) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan dtb__336)) dtb__349)) (fun aNat -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2 name) aNat) dtb__344), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue, dtb__347))))))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2 name) dtb__340) (v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm dtb__344)), (C_Base_dPair_dPair_Base_dPair_dPair (v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue, dtb__347))))))))
  | _ -> failwith "DT: impossible branch"
) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__350, dtb__351, dtb__352) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel (fuel - 1)) globals) ctx) ec) dtb__351)) (fun pt -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__353, dtb__354) -> (match dtb__354 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__356) dtb__350) ((v_Vuna_dCompiler_dCore_dEval_deval (v_Vuna_dCompiler_dElab_dTypes_dctxEnv ctx)) dtb__353))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pt)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__357, dtb__358) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__357, dtb__358)))) (fun e2 -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) e2) expected)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__359, dtb__360, dtb__361, dtb__362) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel (fuel - 1)) globals) ctx) ec) dtb__359) dtb__360) dtb__361) expected) dtb__362)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__363, dtb__364, dtb__365) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel (fuel - 1)) globals) ctx) ec) dtb__363) dtb__364) expected) dtb__365)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__366, dtb__367, dtb__368, dtb__369) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__370, dtb__371, dtb__372, dtb__373, dtb__374) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__375, dtb__376, dtb__377) -> (match dtb__375 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__378, dtb__379) -> (if (dtb__378 = "->") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else (if (dtb__378 = "Type") then ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__375) dtb__376) expected) dtb__377)))
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) dtb__375) dtb__376) expected) dtb__377)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__380, dtb__381, dtb__382) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (fuel - 1)) globals) ctx) ec) dtb__380) dtb__381) expected) dtb__382)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__383, dtb__384) -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__385, dtb__386) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__387) -> (match dtb__387 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__388, dtb__389) -> (match dtb__389 with
  | C_Base_dList_dList_Base_dList_dNil -> (if (dtb__388 = v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult dtb__386) dtb__385)) (fun t -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (t, ec)))))) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) expected))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__390, dtb__391) -> (if (dtb__390 = "_") then ((fun pmeta -> (match pmeta with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__392, dtb__393) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__392, dtb__393))))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dElab_dTypes_dnewHoleMeta ctx) ec) dtb__391) expected)) else ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel (fuel - 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__390, dtb__391))) C_Base_dList_dList_Base_dList_dNil) expected) dtb__391))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) expr) expected)
)) expr)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel = (fun fuel globals ctx ec binds body rec_u expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) expected) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind ec)) binds)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs rec_u) binds2)) (fun _u -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel (fuel - 1)) globals) ctx) ec) binds2) body) rec_u) sp)))))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 mc8 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__394, dtb__395) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel (mc0 - 1)) mc1) mc2) mc3) dtb__394) dtb__395) mc5) mc6) mc7) mc8))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc7))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel = (fun fuel globals ctx ec bind rest body rec_u expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (v_Base_dPair_dfirstOf bind) with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__396, dtb__397) -> ((fun value -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__398, dtb__399) -> (match dtb__399 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__400, dtb__401) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx2) dtb__401) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__402, dtb__403) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__396, rig, dtb__402)), dtb__398, rig)), dtb__403))))
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__396) dtb__400) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__400))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (v_Base_dPair_dsecondOf bind))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__404) -> ((fun value -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__405, dtb__406) -> (match dtb__406 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__407, dtb__408) -> ((fun rig -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel (fuel - 1)) globals) ctx) dtb__408) rest) body) rec_u) expected) sp)) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__409, dtb__410) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__409))), dtb__405, rig)), dtb__410))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__407))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))) (v_Base_dPair_dsecondOf bind))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((v_Base_dPair_dsecondOf bind), (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dPair_dfirstOf bind), (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (rest, body, rec_u, sp)))), C_Base_dList_dList_Base_dList_dNil)), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan (v_Base_dPair_dfirstOf bind))))) expected)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel = (fun fuel globals ctx ec binds body rec_u sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__411, dtb__412) -> (match dtb__411 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__413, dtb__414) -> (match dtb__413 with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__415, dtb__416) -> ((((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel (fuel - 1)) globals) ctx) ec) dtb__415) dtb__414) dtb__412) body) rec_u) sp)
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__417) -> (((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel (fuel - 1)) globals) ctx) ec) dtb__414) dtb__412) body) rec_u) sp)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__414, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__413, (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__412, body, rec_u, sp)))), C_Base_dList_dList_Base_dList_dNil)), (v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__413))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) body)
  | _ -> failwith "DT: impossible branch"
)) binds)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel = (fun fuel globals ctx ec name value rest body rec_u sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> (match dtb__419 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> ((fun rig -> ((fun ctx2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx2) dtb__421) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__422, dtb__423) -> (match dtb__423 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__424, dtb__425) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, dtb__422)), dtb__418, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__424, dtb__425))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue name) dtb__420) ctx))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__420))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel = (fun fuel globals ctx ec value rest body rec_u sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) value)) (fun pv -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__426, dtb__427) -> (match dtb__427 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, dtb__429) -> ((fun rig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel (fuel - 1)) globals) ctx) dtb__429) rest) body) rec_u) sp)) (fun pb -> ((fun nd_uscrut21 -> (match nd_uscrut21 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__430, dtb__431) -> (match dtb__431 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__432, dtb__433) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam ("_", rig, (((v_Vuna_dCompiler_dCore_dTerm_dshift 0) 1) dtb__430))), dtb__426, rig)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__432, dtb__433))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig false) dtb__428))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pv)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel = (fun fuel globals ctx ec expr expected -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__434) -> (match dtb__434 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__435, dtb__436) -> (match dtb__436 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__437, dtb__438) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__438) expected) dtb__437) dtb__435) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__439) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__439, ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__438)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__438) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__437) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__440) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [(v_Vuna_dCompiler_dCommon_dshowSpanLoc (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)); ": "; dtb__440])))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__441) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__435, ((v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals globals) dtb__441)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__442) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__442))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel = (fun mc0 mc1 mc2 mc3 mc4 mc5 mc6 mc7 -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__443, dtb__444) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun forced -> (match forced with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449) -> ((fun lvl -> ((fun v -> ((fun ctx2 -> ((fun expected2 -> ((fun lamRig -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel (mc0 - 1)) mc1) ctx2) mc3) dtb__444) mc5) expected2) mc7)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__450, dtb__451) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__443, lamRig, dtb__450)), dtb__451))))
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dElab_dMeta_dbinderRig dtb__446) dtb__448))) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__449) v))) (((v_Vuna_dCompiler_dElab_dTypes_dctxBindValue dtb__443) dtb__448) mc2))) ((v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue dtb__445) lvl))) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth mc2))
  | _ -> ((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0 mc7) C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dLambdaTooManyParams)
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal mc3) mc6)))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (mc0 - 1)) mc1) mc2) mc3) mc5) mc6))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__452, dtb__453, dtb__454) -> (match dtb__452 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__455, dtb__456) -> (if (if (dtb__455 = "->") then true else (dtb__455 = "Type")) then (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr) else (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__455) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__457) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__455) then (match (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__455) dtb__453) dtb__456) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__458) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__459) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__459))
  | _ -> failwith "DT: impossible branch"
) else (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__460, dtb__461) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__460) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__462) -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (((v_Vuna_dCompiler_dElab_dMeta_dtypeLookup globals) ec) dtb__460) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__463) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__463))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__464) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__460)), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__464, ec))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel (fuel - 1)) globals) ctx) ec) expr)
)) expr)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel = (fun fuel globals ctx ec expr -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) expr)) (fun p -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, dtb__466) -> (match dtb__466 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__467, dtb__468) -> ((fun forced -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf forced) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__469) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, (C_Base_dPair_dPair_Base_dPair_dPair (dtb__469, dtb__468))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan expr)) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dExpectedType (((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__467)))) ((v_Vuna_dCompiler_dCore_dEval_dshowValueAt (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__467))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__468) dtb__467))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__470, dtb__471) -> (match ((v_Vuna_dCompiler_dElab_dTypes_dctxLookup dtb__470) ctx) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__472) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (if ((v_Vuna_dCompiler_dElab_dMeta_disSortVal ec) expected) then (((v_Vuna_dCompiler_dElab_dMeta_disTypeName globals) ec) dtb__470) else false) then ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) dtb__470) args) expected) dtb__471) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__473) -> (match dtb__473 with
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVEDef (dtb__474) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
  | C_Vuna_dCompiler_dElab_dMeta_dValueEntry_Vuna_dCompiler_dElab_dMeta_dVECtor (dtb__475) -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel (fuel - 1)) globals) ctx) ec) dtb__470) args) expected) dtb__471)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dvalueLookup globals) ec) dtb__470)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel (fuel - 1)) globals) ctx) ec) fn) args) expected) sp)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun p -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__476, dtb__477) -> (match dtb__477 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__478, dtb__479) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__479) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVType (dtb__478)))) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__476, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) p)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match (((v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup name) globals) ec) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__480) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) dtb__480)) args) sp)) (fun pa -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__481, dtb__482) -> (match dtb__482 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__483, dtb__484) -> (match (v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf ((v_Vuna_dCompiler_dElab_dTypes_dforceVal dtb__484) dtb__483)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__485) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__481), (C_Base_dPair_dPair_Base_dPair_dPair (dtb__485, dtb__484))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dAppliedNotType (name))) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if ((v_Vuna_dCompiler_dElab_dDict_disEqMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__486, dtb__487) -> (match dtb__487 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__488, dtb__489) -> (match dtb__489 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__486)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__490, dtb__491) -> (match dtb__491 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__492, dtb__493) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__493) dtb__488)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__494, dtb__495) -> (match dtb__495 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__496, dtb__497) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__497) dtb__492) dtb__496) dtb__490) dtb__494) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__498) -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf dtb__498))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf dtb__498))) sp) (v_Base_dPair_dfirstOf (v_Base_dPair_dfirstOf dtb__498))) dtb__497)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__497) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__492) dtb__496)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy globals) ctx) name) dtb__490) dtb__494) sp) dtb__492) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if ((v_Vuna_dCompiler_dElab_dDict_disCmpMethod ec) name) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__499, dtb__500) -> (match dtb__500 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__501, dtb__502) -> (match dtb__502 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) ec) dtb__499)) (fun pa -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__503, dtb__504) -> (match dtb__504 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__505, dtb__506) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel (fuel - 1)) globals) ctx) dtb__506) dtb__501)) (fun pb -> ((fun nd_uscrut26 -> (match nd_uscrut26 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__507, dtb__508) -> (match dtb__508 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__509, dtb__510) -> (match (((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands dtb__510) dtb__505) dtb__509) dtb__503) dtb__507) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__511) -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) (v_Base_dPair_dfirstOf (v_Base_dPair_dsecondOf dtb__511))) (v_Base_dPair_dsecondOf (v_Base_dPair_dsecondOf dtb__511))) sp) (v_Base_dPair_dfirstOf (v_Base_dPair_dfirstOf dtb__511))) dtb__510)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__510) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) dtb__505) dtb__509)) (fun ec3 -> ((((((((v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy globals) ctx) name) dtb__503) dtb__507) sp) dtb__505) ec3)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pb)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r -> (match r with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__512) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__512))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r2 -> (match r2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__513) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__513))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)) (fun r3 -> (match r3 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__514) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__514))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel (fuel - 1)) globals) ctx) ec) name) args) sp)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel = (fun fuel globals ctx ec name args sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (if (if (name = "&&") then true else (name = "||")) then ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__515, dtb__516) -> (match dtb__516 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__517, dtb__518) -> (match dtb__518 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) ec) dtb__515) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))))) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__519, dtb__520) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel (fuel - 1)) globals) ctx) dtb__520) dtb__517) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))))) (fun pb -> (match pb with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__521, dtb__522) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit name) dtb__519) dtb__521), (C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (v_Vuna_dCompiler_dIntrinsics_dboolTypeName, C_Base_dList_dList_Base_dList_dNil)))), dtb__522))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)
  | _ -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dNeedsTwoArgs (name))) name)
)) args) else (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)))))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel = (fun fuel globals ctx ec fn args expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match fn with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__523, dtb__524) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel (fuel - 1)) globals) ctx) ec) dtb__523) args) expected) sp)) (fun arith -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel (fuel - 1)) globals) ctx) ec) dtb__523) args) sp)) (fun mspec -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__525) -> (match dtb__525 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__526, dtb__527) -> (match dtb__527 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__528, dtb__529) -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__529) expected) dtb__528) dtb__526) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__530) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__530, dtb__529))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__529) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__528)) (fun ec2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__526, ec2))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) mspec)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__531) -> (match dtb__531 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__532, dtb__533) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__532, dtb__533))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) arith)))
  | _ -> ((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel (fuel - 1)) globals) ctx) ec) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn, args, sp))) expected)
)))
and v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel = (fun fuel globals ctx ec name args expected sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: inference fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc ec) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dUnknownName (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__534) -> ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel (fuel - 1)) globals) ctx) ec) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorType dtb__534))) args) sp)) (fun pa -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__535, dtb__536) -> (match dtb__536 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__537, dtb__538) -> ((fun ctorTerm -> (match ((((v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm dtb__538) expected) dtb__537) ctorTerm) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__539) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__539, dtb__538))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((((v_Vuna_dCompiler_dElab_dMeta_dconvEc dtb__538) (v_Vuna_dCompiler_dElab_dTypes_dctxDepth ctx)) expected) dtb__537) with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__540) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__540)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__535), dtb__540))))
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__541) -> ((((v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2 sp) (C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dCtorError (name, dtb__541))) name) dtb__541)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm (v_Vuna_dCompiler_dElab_dTypes_decDatas dtb__538)) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (name))) dtb__535))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) pa)))
  | _ -> failwith "DT: impossible branch"
)))
