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
and v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField = (fun t -> (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, dtb__40) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__40)) (fun p2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__39, p2))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFixity_dcollectChain = (fun t -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__41, dtb__42, dtb__43, dtb__44) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__42)) (fun l2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain t) dtb__43)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__45, dtb__46) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (l2, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__45)), dtb__46))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) e)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (e2, C_Base_dList_dList_Base_dList_dNil))))))
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr = (fun t -> (fun e -> (match e with
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__47, dtb__48) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__47, dtb__48))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__49, dtb__50) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__49, dtb__50))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__51, dtb__52) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__51, dtb__52))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__53, dtb__54, dtb__55, dtb__56) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain t) (C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__53, dtb__54, dtb__55, dtb__56)))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb ((bi_add ((bi_mul 2) (v_Base_dList_dlength dtb__58))) 2)) t) 0) dtb__57) dtb__58) dtb__56)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (if ((bi_eq_int (v_Base_dList_dlength dtb__60)) 0) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__59)) else (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder left an operator")))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__61, dtb__62) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__61)
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__63, dtb__64, dtb__65) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__64)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__63, b, dtb__65))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__66, dtb__67, dtb__68) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__66)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) a))) dtb__67)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__68))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__71)) (fun dom2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__72)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__69, dtb__70, dom2, cod2, dtb__73))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__74, dtb__75, dtb__76, dtb__77) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds t) dtb__74)) (fun binds2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__75)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__76, dtb__77))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__78, dtb__79) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses t) dtb__78)) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (cs, dtb__79))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__80, dtb__81, dtb__82) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__80)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts t) dtb__81)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__82))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__83, dtb__84, dtb__85, dtb__86) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__83)) (fun c2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__84)) (fun th2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__85)) (fun el2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, th2, el2, dtb__86))))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__87, dtb__88, dtb__89) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__87)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__88, dtb__89))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__90, dtb__91, dtb__92) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields t) dtb__91)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__90, fs, dtb__92))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__93, dtb__94, dtb__95) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__93)) (fun b -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields t) dtb__94)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__95))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__96, dtb__97) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt t) v))) dtb__96)) (fun ss -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (ss, dtb__97))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__98, dtb__99, dtb__100) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__98)) (fun i2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__99)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (i2, t2, dtb__100))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds = (fun t -> (fun binds -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBind t) v))) binds)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBind = (fun t -> (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__101, dtb__102) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__101)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__102)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, v2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderFields = (fun t -> (fun fields -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderField t) v))) fields)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderField = (fun t -> (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, dtb__104) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__104)) (fun v2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__103, v2))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses = (fun t -> (fun clauses -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClause t) v))) clauses)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts = (fun t -> (fun alts -> ((v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt t) a))) alts)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt = (fun t -> (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__105)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__106)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClause = (fun t -> (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun pat -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) pat))) dtb__107)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__108)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (pats2, b2))))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt = (fun t -> (fun stmt -> (match stmt with
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__109, dtb__110, dtb__111) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__109)) (fun p2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__110)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__111))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__112, dtb__113) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__112)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__113))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor = (fun t -> (fun c -> (match c with
  | C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__114, dtb__115, dtb__116, dtb__117) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__115)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__114, ty2, dtb__116, dtb__117))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField = (fun t -> (fun f -> (match f with
  | C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__118, dtb__119, dtb__120) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__119)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__118, ty2, dtb__120))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod = (fun t -> (fun m -> (match m with
  | C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__121, dtb__122, dtb__123) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__122)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__121, ty2, dtb__123))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl = (fun t -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__124, dtb__125, dtb__126) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__125)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__124, ty2, dtb__126))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__127, dtb__128, dtb__129, dtb__130) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) p))) dtb__128)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__129)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__127, pats2, b2, dtb__130))))))))
  | dtb__131 -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__131))
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl = (fun t -> (fun d -> (match d with
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__132, dtb__133, dtb__134, dtb__135, dtb__136, dtb__137) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__134)) (fun k2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun c -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor t) c))) dtb__135)) (fun cs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__132, dtb__133, k2, cs, dtb__136, dtb__137))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__138, dtb__139, dtb__140) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__139)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__138, ty2, dtb__140))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__141, dtb__142, dtb__143) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__142)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__141, ty2, dtb__143))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__144, dtb__145, dtb__146, dtb__147) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) p))) dtb__145)) (fun pats2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__146)) (fun b2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__144, pats2, b2, dtb__147))))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__148, dtb__149, dtb__150, dtb__151, dtb__152) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField t) v))) dtb__150)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__148, dtb__149, fs, dtb__151, dtb__152))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__153, dtb__154, dtb__155, dtb__156) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod t) v))) dtb__155)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__153, dtb__154, ms, dtb__156))))))
  | C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__157, dtb__158, dtb__159, dtb__160) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) e))) dtb__157)) (fun ctx2 -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr t) dtb__158)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl t) v))) dtb__159)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__160))))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram = (fun t -> (fun decls -> ((v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl t) v))) decls)))
