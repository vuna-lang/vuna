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

let v_Vuna_dCompiler_dLoader_dFixity_dtableOf = (fun ds -> (C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (true, ds)))

let v_Vuna_dCompiler_dLoader_dFixity_dtableOfKeepOps = (fun ds -> (C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (false, ds)))

let v_Vuna_dCompiler_dLoader_dFixity_dbuiltinFixityDecls = (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("->", 1, 2, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (">>=", 1, 2, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("bind")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (">>", 1, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("||", 2, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("&&", 3, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("==", 4, 1, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("eq")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("/=", 4, 1, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("neq")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("<", 4, 1, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("lt")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("<=", 4, 1, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("le")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (">", 4, 1, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("gt")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (">=", 4, 1, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("ge")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("++", 5, 2, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("::", 5, 2, (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ("Cons")), (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("+", 6, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("-", 6, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("*", 7, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("/", 7, 1, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Base_dList_dNil))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dLoader_dFixity_dfindTarget = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match (v_Vuna_dCompiler_dFrontend_dAst_dfixityTarget dtb__0) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2) -> (if ((bi_eq_str dtb__2) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dFrontend_dAst_dfixityOp dtb__0))) else ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget dtb__1) mc1))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget dtb__1) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dsymbolOfTarget = (fun name -> ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget v_Vuna_dCompiler_dLoader_dFixity_dbuiltinFixityDecls) name))

let rec v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> (if ((bi_eq_str (v_Vuna_dCompiler_dFrontend_dAst_dfixityOp dtb__3)) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__3)) else ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc0) dtb__4))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (dtb__5, dtb__6) -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc1) dtb__6) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__7) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dfixityLevel dtb__7), (v_Vuna_dCompiler_dFrontend_dAst_dfixityAssoc dtb__7)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc1) v_Vuna_dCompiler_dLoader_dFixity_dbuiltinFixityDecls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__8) -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dFrontend_dAst_dfixityLevel dtb__8), (v_Vuna_dCompiler_dFrontend_dAst_dfixityAssoc dtb__8)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dPair_dPair_Base_dPair_dPair (9, 1))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_daliasOf = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (dtb__9, dtb__10) -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc1) dtb__10) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (match (v_Vuna_dCompiler_dFrontend_dAst_dfixityTarget dtb__11) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> dtb__12
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc1) v_Vuna_dCompiler_dLoader_dFixity_dbuiltinFixityDecls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__13) -> (match (v_Vuna_dCompiler_dFrontend_dAst_dfixityTarget dtb__13) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__14) -> dtb__14
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mc1
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_drenameMode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dMkFixityTable (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm = (fun t -> (fun op -> (fun lhs -> (fun rhs -> (fun sp -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode t) then (if ((bi_eq_str op) ">>") then (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", sp)), (C_Base_dList_dList_Base_dList_dCons (lhs, (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((C_Base_dList_dList_Base_dList_dCons ("vuna_seq_ignore", C_Base_dList_dList_Base_dList_dNil)), rhs, sp)), C_Base_dList_dList_Base_dList_dNil)))), sp)) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf t) op), sp)), (C_Base_dList_dList_Base_dList_dCons (lhs, (C_Base_dList_dList_Base_dList_dCons (rhs, C_Base_dList_dList_Base_dList_dNil)))), sp))) else (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (op, sp)), (C_Base_dList_dList_Base_dList_dCons (lhs, (C_Base_dList_dList_Base_dList_dCons (rhs, C_Base_dList_dList_Base_dList_dNil)))), sp))))))))

let rec v_Vuna_dCompiler_dLoader_dFixity_dclimb = (fun fuel -> (fun t -> (fun minPrec -> (fun lhs -> (fun rest -> (fun sp -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder fuel exhausted")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (match dtb__17 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__19, dtb__20) -> ((fun fx -> ((fun level -> ((fun assoc -> (if ((bi_lt_int level) minPrec) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, rest)))) else ((fun nextMin -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb ((bi_sub fuel) 1)) t) nextMin) dtb__20) dtb__18) sp)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__21, dtb__22) -> ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb ((bi_sub fuel) 1)) t) minPrec) (((((v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm t) dtb__19) lhs) dtb__21) sp)) dtb__22) sp)
  | _ -> failwith "DT: impossible branch"
)))) (if ((bi_eq_int assoc) 2) then level else ((bi_add level) 1))))) (v_Base_dPair_dsecondOf fx))) (v_Base_dPair_dfirstOf fx))) ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity t) dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (lhs, C_Base_dList_dList_Base_dList_dNil))))
  | _ -> failwith "DT: impossible branch"
)) rest))))))))

let rec v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern = (fun t -> (fun pat -> (match pat with
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__23, dtb__24) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__23, dtb__24))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__25) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__25))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__26, dtb__27) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__26, dtb__27))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__28, dtb__29) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__28, dtb__29))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__30, dtb__31, dtb__32) -> ((fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) p))) dtb__31)) (fun pats2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, pats2, dtb__32))))))) (if (if ((bi_eq_str dtb__30) "::") then (v_Vuna_dCompiler_dLoader_dFixity_drenameMode t) else false) then ((v_Vuna_dCompiler_dLoader_dFixity_daliasOf t) "::") else dtb__30))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__33, dtb__34, dtb__35) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__34)) (fun inner2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__33, inner2, dtb__35))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__36, dtb__37, dtb__38) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField t) p))) dtb__37)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__36, fs, dtb__38))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__40)) (fun p2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, p2))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFixity_dcollectChain = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__41, dtb__42, dtb__43, dtb__44) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__42)) (fun l2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain mc0) dtb__43)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (l2, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__45)), dtb__46))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) mc1)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (e2, C_Base_dList_dList_Base_dList_dNil))))))
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__47, dtb__48, dtb__49) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__47)) (fun i2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__48)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (i2, t2, dtb__49))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__50, dtb__51) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt mc0) v))) dtb__50)) (fun ss -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (ss, dtb__51))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__52, dtb__53, dtb__54) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__52)) (fun b -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields mc0) dtb__53)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__54))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__55, dtb__56, dtb__57) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields mc0) dtb__56)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__55, fs, dtb__57))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__58, dtb__59, dtb__60) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__58)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__59, dtb__60))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__61, dtb__62, dtb__63, dtb__64) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__61)) (fun c2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__62)) (fun th2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__63)) (fun el2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, th2, el2, dtb__64))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__65, dtb__66, dtb__67) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__65)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts mc0) dtb__66)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__67))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__68, dtb__69) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses mc0) dtb__68)) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (cs, dtb__69))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__70, dtb__71, dtb__72, dtb__73) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds mc0) dtb__70)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__71)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__72, dtb__73))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__74, dtb__75, dtb__76, dtb__77, dtb__78) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__76)) (fun dom2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__77)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__74, dtb__75, dom2, cod2, dtb__78))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__79, dtb__80, dtb__81) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__79)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) a))) dtb__80)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__81))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__82, dtb__83, dtb__84) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__83)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__82, b, dtb__84))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__85, dtb__86) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__85)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__87, dtb__88, dtb__89, dtb__90) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain mc0) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__87, dtb__88, dtb__89, dtb__90)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb ((bi_add ((bi_mul 2) (v_Base_dList_dlength dtb__92))) 2)) mc0) 0) dtb__91) dtb__92) dtb__90)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (if ((bi_eq_int (v_Base_dList_dlength dtb__94)) 0) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__93)) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder left an operator")))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__95, dtb__96) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__95, dtb__96))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__97, dtb__98) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__97, dtb__98))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__99, dtb__100) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__99, dtb__100))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds = (fun t -> (fun binds -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBind t) v))) binds)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBind = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__101)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__102)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, v2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderFields = (fun t -> (fun fields -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderField t) v))) fields)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderField = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__104)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, v2))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses = (fun t -> (fun clauses -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClause t) v))) clauses)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts = (fun t -> (fun alts -> ((v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt t) a))) alts)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__105)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__106)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClause = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun pat -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) pat))) dtb__107)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__108)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (pats2, b2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__109, dtb__110) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__109)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__110))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__111, dtb__112, dtb__113) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__111)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__112)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__113))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__114, dtb__115, dtb__116, dtb__117) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__115)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__114, ty2, dtb__116, dtb__117))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__118, dtb__119, dtb__120) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__119)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__118, ty2, dtb__120))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__121, dtb__122, dtb__123) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__122)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__121, ty2, dtb__123))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__124, dtb__125, dtb__126, dtb__127) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) p))) dtb__125)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__126)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__124, pats2, b2, dtb__127))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__128, dtb__129, dtb__130) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__129)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__128, ty2, dtb__130))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk (mc1))
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__131, dtb__132, dtb__133, dtb__134) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__131)) (fun ctx2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__132)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl mc0) v))) dtb__133)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__134))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__135, dtb__136, dtb__137, dtb__138) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod mc0) v))) dtb__137)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__135, dtb__136, ms, dtb__138))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField mc0) v))) dtb__141)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__139, dtb__140, fs, dtb__142, dtb__143))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__144, dtb__145, dtb__146, dtb__147) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) p))) dtb__145)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__146)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__144, pats2, b2, dtb__147))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__148, dtb__149, dtb__150) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__149)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__148, ty2, dtb__150))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__151, dtb__152, dtb__153) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__152)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__151, ty2, dtb__153))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__154, dtb__155, dtb__156, dtb__157, dtb__158, dtb__159) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__156)) (fun k2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun c -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor mc0) c))) dtb__157)) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__154, dtb__155, k2, cs, dtb__158, dtb__159))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram = (fun t -> (fun decls -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl t) v))) decls)))
