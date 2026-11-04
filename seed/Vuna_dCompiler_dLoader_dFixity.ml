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
type t_Vuna_dCompiler_dLoader_dFixity_dFixityTable = C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable of (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dFixity_dChainOp = C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dMkChainOp of (string) * (bool) * (t_Vuna_dCompiler_dFrontend_dAst_dExpr)

let v_Vuna_dCompiler_dLoader_dFixity_dtableOf = (fun ds -> (C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (true, ds)))

let v_Vuna_dCompiler_dLoader_dFixity_dtableOfKeepOps = (fun ds -> (C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (false, ds)))

let v_Vuna_dCompiler_dLoader_dFixity_drenameMode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dfixityDecls = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (dtb__2, dtb__3) -> dtb__3
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dsyntaxFixityDecls = (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("->", 1, 2, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFixity_dfindTarget = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> (match (v_Vuna_dCompiler_dFrontend_dAst_dfixityTarget dtb__4) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> (if (dtb__6 = mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dfixityOp dtb__4))) else ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget dtb__5) mc1))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget dtb__5) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dsymbolOfTargetIn = (fun ds name -> ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget ds) name))

let rec v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (if ((v_Vuna_dCompiler_dFrontend_dAst_dfixityOp dtb__7) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__7)) else ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc0) dtb__8))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl = (fun t op -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl op) (v_Vuna_dCompiler_dLoader_dFixity_dfixityDecls t)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl op) v_Vuna_dCompiler_dLoader_dFixity_dsyntaxFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity = (fun t op -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl t) op) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dfixityLevel dtb__10), (v_Vuna_dCompiler_dFrontend_dAst_dfixityAssoc dtb__10)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_daliasOf = (fun t op -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl t) op) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (match (v_Vuna_dCompiler_dFrontend_dAst_dfixityTarget dtb__11) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> dtb__12
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> op
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> op
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dchainOp = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dMkChainOp (dtb__13, dtb__14, dtb__15) -> dtb__13
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dchainIsBacktick = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dMkChainOp (dtb__16, dtb__17, dtb__18) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dchainRhs = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dMkChainOp (dtb__19, dtb__20, dtb__21) -> dtb__21
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dunknownFixityMsg = (fun op -> (String.concat "" ["unknown fixity for operator "; op; " (declare it with infixl/infixr/infix)"]))

let v_Vuna_dCompiler_dLoader_dFixity_dfixityOf = (fun t c -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity t) (v_Vuna_dCompiler_dLoader_dFixity_dchainOp c)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__22) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__22))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (v_Vuna_dCompiler_dLoader_dFixity_dchainIsBacktick c) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (9, 1)))) else (C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dLoader_dFixity_dunknownFixityMsg (v_Vuna_dCompiler_dLoader_dFixity_dchainOp c)))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm = (fun t c lhs rhs sp -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode t) then (if ((v_Vuna_dCompiler_dLoader_dFixity_dchainOp c) = ">>") then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", sp)), (C_Base_dList_dList_Base_dList_dCons (lhs, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_seq_ignore", C_Base_dList_dList_Base_dList_dNil)), rhs, sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf t) (v_Vuna_dCompiler_dLoader_dFixity_dchainOp c)), sp)), (C_Base_dList_dList_Base_dList_dCons (lhs, (C_Base_dList_dList_Base_dList_dCons (rhs, C_Base_dList_dList_Base_dList_dNil)))), sp))) else (if (v_Vuna_dCompiler_dLoader_dFixity_dchainIsBacktick c) then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick ((v_Vuna_dCompiler_dLoader_dFixity_dchainOp c), lhs, rhs, sp)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dFixity_dchainOp c), sp)), (C_Base_dList_dList_Base_dList_dCons (lhs, (C_Base_dList_dList_Base_dList_dCons (rhs, C_Base_dList_dList_Base_dList_dNil)))), sp)))))

let rec v_Vuna_dCompiler_dLoader_dFixity_dclimb = (fun fuel t minPrec lhs rest sp -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder fuel exhausted")) else (match rest with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, C_Base_dList_dList_Base_dList_dNil))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dfixityOf t) dtb__23) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__25) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__25))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__26) -> ((fun level -> ((fun assoc -> ((fun nextMin -> ((fun rhs -> (if (level < minPrec) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, rest)))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb (fuel - 1)) t) nextMin) rhs) dtb__24) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__27, dtb__28) -> ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb (fuel - 1)) t) minPrec) (((((v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm t) dtb__23) lhs) dtb__27) sp)) dtb__28) sp)
  | _ -> failwith "DT: impossible branch"
))))) (v_Vuna_dCompiler_dLoader_dFixity_dchainRhs dtb__23))) (if (assoc = 2) then level else (level + 1)))) (v_Base_dPair_dsecondOf dtb__26))) (v_Base_dPair_dfirstOf dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern = (fun t pat -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__29, dtb__30) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__29, dtb__30))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__31) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__31))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__32, dtb__33) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__32, dtb__33))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__34, dtb__35) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__34, dtb__35))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__36, dtb__37, dtb__38) -> ((fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) p))) dtb__37)) (fun pats2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, pats2, dtb__38))))))) (if (if (dtb__36 = "::") then (v_Vuna_dCompiler_dLoader_dFixity_drenameMode t) else false) then ((v_Vuna_dCompiler_dLoader_dFixity_daliasOf t) "::") else dtb__36))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__39, dtb__40, dtb__41) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__40)) (fun inner2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__39, inner2, dtb__41))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__42, dtb__43, dtb__44) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField t) p))) dtb__43)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__42, fs, dtb__44))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__46)) (fun p2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, p2))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFixity_dcollectChain = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__47, dtb__48, dtb__49, dtb__50) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__48)) (fun l2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain mc0) dtb__49)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__51, dtb__52) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (l2, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dMkChainOp (dtb__47, true, dtb__51)), dtb__52))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__53, dtb__54, dtb__55, dtb__56) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__54)) (fun l2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain mc0) dtb__55)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (l2, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dMkChainOp (dtb__53, false, dtb__57)), dtb__58))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) mc1)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (e2, C_Base_dList_dList_Base_dList_dNil))))))
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderChain = (fun t e -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain t) e)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb ((2 * (v_Base_dList_dlength dtb__60)) + 2)) t) 0) dtb__59) dtb__60) (v_Vuna_dCompiler_dFrontend_dAst_dexprSpan e))) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> (if ((v_Base_dList_dlength dtb__62) = 0) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__61)) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder left an operator")))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__63, dtb__64, dtb__65) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__63)) (fun i2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__64)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (i2, t2, dtb__65))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__66, dtb__67) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt mc0) v))) dtb__66)) (fun ss -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (ss, dtb__67))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__68, dtb__69, dtb__70) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__68)) (fun b -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields mc0) dtb__69)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__70))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__71, dtb__72, dtb__73) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields mc0) dtb__72)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__71, fs, dtb__73))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__74, dtb__75, dtb__76) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__74)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__75, dtb__76))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__77, dtb__78, dtb__79, dtb__80) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__77)) (fun c2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__78)) (fun th2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__79)) (fun el2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, th2, el2, dtb__80))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__81, dtb__82, dtb__83) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__81)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts mc0) dtb__82)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__83))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__84, dtb__85) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses mc0) dtb__84)) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (cs, dtb__85))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__86, dtb__87, dtb__88, dtb__89) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds mc0) dtb__86)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__87)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__88, dtb__89))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__92)) (fun dom2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__93)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__90, dtb__91, dom2, cod2, dtb__94))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__95, dtb__96, dtb__97) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__95)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) a))) dtb__96)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__97))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__98, dtb__99, dtb__100) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__99)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__98, b, dtb__100))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__101, dtb__102) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__101)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__103, dtb__104, dtb__105) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__103)) (fun e2 -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode mc0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_section", C_Base_dList_dList_Base_dList_dNil)), (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf mc0) dtb__104), dtb__105)), (C_Base_dList_dList_Base_dList_dCons (e2, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("vuna_section", dtb__105)), C_Base_dList_dList_Base_dList_dNil)))), dtb__105)), dtb__105)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (e2, dtb__104, dtb__105)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__106, dtb__107, dtb__108) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__107)) (fun e2 -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode mc0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_section", C_Base_dList_dList_Base_dList_dNil)), (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf mc0) dtb__106), dtb__108)), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("vuna_section", dtb__108)), (C_Base_dList_dList_Base_dList_dCons (e2, C_Base_dList_dList_Base_dList_dNil)))), dtb__108)), dtb__108)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__106, e2, dtb__108)))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__109, dtb__110) -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode mc0) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf mc0) dtb__109), dtb__110)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__109, dtb__110)))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__111, dtb__112, dtb__113, dtb__114) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderChain mc0) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__111, dtb__112, dtb__113, dtb__114)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__115, dtb__116, dtb__117, dtb__118) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderChain mc0) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__115, dtb__116, dtb__117, dtb__118)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__119, dtb__120) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__119, dtb__120))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__121, dtb__122) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__121, dtb__122))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__123, dtb__124))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds = (fun t binds -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBind t) v))) binds))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBind = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__125)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__126)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, v2))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderFields = (fun t fields -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderField t) v))) fields))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderField = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, dtb__128) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__128)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__127, v2))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses = (fun t clauses -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClause t) v))) clauses))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts = (fun t alts -> ((v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt t) a))) alts))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__129, dtb__130) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__129)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__130)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClause = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__131, dtb__132) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun pat -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) pat))) dtb__131)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__132)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (pats2, b2))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__133, dtb__134) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__133)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__134))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__135, dtb__136, dtb__137) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__135)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__136)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__137))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__138, dtb__139, dtb__140, dtb__141) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__139)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__138, ty2, dtb__140, dtb__141))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__142, dtb__143, dtb__144) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__143)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__142, ty2, dtb__144))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__145, dtb__146, dtb__147) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__146)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__145, ty2, dtb__147))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__148, dtb__149, dtb__150, dtb__151) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) p))) dtb__149)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__150)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__148, pats2, b2, dtb__151))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__152, dtb__153, dtb__154, dtb__155) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__153)) (fun ctx2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__154)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__152, ctx2, ty2, dtb__155))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__156, dtb__157, dtb__158, dtb__159) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__156)) (fun ctx2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__157)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl mc0) v))) dtb__158)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__159))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__160, dtb__161, dtb__162, dtb__163) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod mc0) v))) dtb__162)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__160, dtb__161, ms, dtb__163))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__164, dtb__165, dtb__166, dtb__167, dtb__168) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField mc0) v))) dtb__166)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__164, dtb__165, fs, dtb__167, dtb__168))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__169, dtb__170, dtb__171, dtb__172) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) p))) dtb__170)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__171)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__169, pats2, b2, dtb__172))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__173, dtb__174, dtb__175, dtb__176) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__174)) (fun ctx2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__175)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__173, ctx2, ty2, dtb__176))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__177, dtb__178, dtb__179) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__178)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__177, ty2, dtb__179))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__180, dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__182)) (fun k2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun c -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor mc0) c))) dtb__183)) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__180, dtb__181, k2, cs, dtb__184, dtb__185))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram = (fun t decls -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl t) v))) decls))
