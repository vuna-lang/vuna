open Vuna_runtime
type t_Vuna_dCompiler_dLoader_dFixity_dFixityTable = C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dFixityTable of (bool) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dFixity_dChainOp = C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp of (string) * (bool) * (Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr)

let v_Vuna_dCompiler_dLoader_dFixity_dtableOf = (fun ds -> (C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dFixityTable (true, ds)))

let v_Vuna_dCompiler_dLoader_dFixity_dtableOfKeepOps = (fun ds -> (C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dFixityTable (false, ds)))

let v_Vuna_dCompiler_dLoader_dFixity_drenameMode = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dFixityTable (dtb__0, dtb__1) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dsyntaxFixityDecls = (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl ("->", 1, 2, Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dLoader_dFixity_dfindTarget = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (match (match dtb__2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__4, dtb__5, dtb__6, dtb__7, dtb__8) -> dtb__7
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__9) -> (if (dtb__9 = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((match dtb__2 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget dtb__3) mc1))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget dtb__3) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dsymbolOfTargetIn = (fun ds name -> ((v_Vuna_dCompiler_dLoader_dFixity_dfindTarget ds) name))

let rec v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (if ((match dtb__15 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__17
  | _ -> failwith "DT: impossible branch"
) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__15)) else ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl mc0) dtb__16))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl = (fun t op -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl op) (match t with
  | C_Vuna_dCompiler_dLoader_dFixity_dFixityTable_Vuna_dCompiler_dLoader_dFixity_dFixityTable (dtb__22, dtb__23) -> dtb__23
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl op) v_Vuna_dCompiler_dLoader_dFixity_dsyntaxFixityDecls)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity = (fun t op -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl t) op) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__25) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> dtb__27
  | _ -> failwith "DT: impossible branch"
), (match dtb__25 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__33
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_daliasOf = (fun t op -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl t) op) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__36) -> (match (match dtb__36 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dFixityDecl_Vuna_dCompiler_dFrontend_dAst_dFixityDecl (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> dtb__40
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__42) -> dtb__42
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> op
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> op
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dunknownFixityMsg = (fun op -> (String.concat "" ["unknown fixity for operator "; op; " (declare it with infixl/infixr/infix)"]))

let v_Vuna_dCompiler_dLoader_dFixity_dfixityOf = (fun t c -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity t) (match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__43, dtb__44, dtb__45) -> dtb__43
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__46) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__46))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if (match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__47, dtb__48, dtb__49) -> dtb__48
  | _ -> failwith "DT: impossible branch"
) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (9, 1)))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((v_Vuna_dCompiler_dLoader_dFixity_dunknownFixityMsg (match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__50, dtb__51, dtb__52) -> dtb__50
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm = (fun t c lhs rhs sp -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode t) then (if ((match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__53, dtb__54, dtb__55) -> dtb__53
  | _ -> failwith "DT: impossible branch"
) = ">>") then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("bind", sp)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (lhs, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna_seq_ignore", Base_dList.C_Base_dList_dList_Base_dList_dNil)), rhs, sp)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf t) (match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__56, dtb__57, dtb__58) -> dtb__56
  | _ -> failwith "DT: impossible branch"
)), sp)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (lhs, (Base_dList.C_Base_dList_dList_Base_dList_dCons (rhs, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), sp))) else (if (match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__59, dtb__60, dtb__61) -> dtb__60
  | _ -> failwith "DT: impossible branch"
) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick ((match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__62, dtb__63, dtb__64) -> dtb__62
  | _ -> failwith "DT: impossible branch"
), lhs, rhs, sp)) else (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ((match c with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__65, dtb__66, dtb__67) -> dtb__65
  | _ -> failwith "DT: impossible branch"
), sp)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (lhs, (Base_dList.C_Base_dList_dList_Base_dList_dCons (rhs, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), sp)))))

let rec v_Vuna_dCompiler_dLoader_dFixity_dclimb = (fun fuel t minPrec lhs rest sp -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder fuel exhausted")) else (match rest with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (lhs, Base_dList.C_Base_dList_dList_Base_dList_dNil))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match ((v_Vuna_dCompiler_dLoader_dFixity_dfixityOf t) dtb__68) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__70) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__70))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__71) -> ((fun level -> ((fun assoc -> ((fun nextMin -> ((fun rhs -> (if (level < minPrec) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (lhs, rest)))) else ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb (fuel - 1)) t) nextMin) rhs) dtb__69) sp)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__72, dtb__73) -> ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb (fuel - 1)) t) minPrec) (((((v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm t) dtb__68) lhs) dtb__72) sp)) dtb__73) sp)
  | _ -> failwith "DT: impossible branch"
))))) (match dtb__68 with
  | C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__74, dtb__75, dtb__76) -> dtb__76
  | _ -> failwith "DT: impossible branch"
))) (if (assoc = 2) then level else (level + 1)))) (Base_dPair.v_Base_dPair_dsecondOf dtb__71))) (Base_dPair.v_Base_dPair_dfirstOf dtb__71))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern = (fun t pat -> (match pat with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__77, dtb__78) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__77, dtb__78))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__79) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__79))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__80, dtb__81) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__80, dtb__81))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__82, dtb__83) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__82, dtb__83))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__84, dtb__85, dtb__86) -> ((fun name2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) p))) dtb__85)) (fun pats2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (name2, pats2, dtb__86))))))) (if (if (dtb__84 = "::") then (v_Vuna_dCompiler_dLoader_dFixity_drenameMode t) else false) then ((v_Vuna_dCompiler_dLoader_dFixity_daliasOf t) "::") else dtb__84))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__87, dtb__88, dtb__89) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern t) dtb__88)) (fun inner2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__87, inner2, dtb__89))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__90, dtb__91, dtb__92) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField t) p))) dtb__91)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__90, fs, dtb__92))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__94)) (fun p2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, p2))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dFixity_dcollectChain = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__95, dtb__96, dtb__97, dtb__98) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__96)) (fun l2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain mc0) dtb__97)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (l2, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__95, true, dtb__99)), dtb__100))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__101, dtb__102, dtb__103, dtb__104) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__102)) (fun l2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain mc0) dtb__103)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__105, dtb__106) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (l2, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dLoader_dFixity_dChainOp_Vuna_dCompiler_dLoader_dFixity_dChainOp (dtb__101, false, dtb__105)), dtb__106))))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) mc1)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (e2, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderChain = (fun t e -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dcollectChain t) e)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__107, dtb__108) -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dFixity_dclimb ((2 * (Base_dList.v_Base_dList_dlength dtb__108)) + 2)) t) 0) dtb__107) dtb__108) (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dexprSpan e))) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (if ((Base_dList.v_Base_dList_dlength dtb__110) = 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__109)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: infix reorder left an operator")))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__111, dtb__112, dtb__113) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInterpParts mc0) dtb__112)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__111, ps, dtb__113))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__114, dtb__115, dtb__116) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__114)) (fun i2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__115)) (fun t2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (i2, t2, dtb__116))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__117, dtb__118) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt mc0) v))) dtb__117)) (fun ss -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (ss, dtb__118))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__119, dtb__120, dtb__121) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__119)) (fun b -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields mc0) dtb__120)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (b, fs, dtb__121))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__122, dtb__123, dtb__124) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderFields mc0) dtb__123)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__122, fs, dtb__124))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__125, dtb__126, dtb__127) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__125)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (b, dtb__126, dtb__127))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__128, dtb__129, dtb__130, dtb__131) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__128)) (fun c2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__129)) (fun th2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__130)) (fun el2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (c2, th2, el2, dtb__131))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__132, dtb__133, dtb__134) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__132)) (fun scrut2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts mc0) dtb__133)) (fun alts2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (scrut2, alts2, dtb__134))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__135, dtb__136) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses mc0) dtb__135)) (fun cs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (cs, dtb__136))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__137, dtb__138, dtb__139, dtb__140) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds mc0) dtb__137)) (fun binds2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__138)) (fun body2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (binds2, body2, dtb__139, dtb__140))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__144)) (fun dom2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__145)) (fun cod2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__141, dtb__142, dtb__143, dom2, cod2, dtb__146))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__147, dtb__148, dtb__149) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__147)) (fun fn2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) a))) dtb__148)) (fun args2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (fn2, args2, dtb__149))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__150, dtb__151, dtb__152) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__151)) (fun b -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__150, b, dtb__152))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__153, dtb__154) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__153)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__155, dtb__156, dtb__157) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__155)) (fun e2 -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode mc0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna_section", Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf mc0) dtb__156), dtb__157)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (e2, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("vuna_section", dtb__157)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__157)), dtb__157)))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (e2, dtb__156, dtb__157)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__158, dtb__159, dtb__160) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__159)) (fun e2 -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode mc0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons ("vuna_section", Base_dList.C_Base_dList_dList_Base_dList_dNil)), (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf mc0) dtb__158), dtb__160)), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("vuna_section", dtb__160)), (Base_dList.C_Base_dList_dList_Base_dList_dCons (e2, Base_dList.C_Base_dList_dList_Base_dList_dNil)))), dtb__160)), dtb__160)))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__158, e2, dtb__160)))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__161, dtb__162) -> (if (v_Vuna_dCompiler_dLoader_dFixity_drenameMode mc0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dFixity_daliasOf mc0) dtb__161), dtb__162)))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__161, dtb__162)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__163, dtb__164, dtb__165, dtb__166) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderChain mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__163, dtb__164, dtb__165, dtb__166)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__167, dtb__168, dtb__169, dtb__170) -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderChain mc0) (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__167, dtb__168, dtb__169, dtb__170)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__171, dtb__172) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__171, dtb__172))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__173, dtb__174) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__173, dtb__174))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__175, dtb__176) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__175, dtb__176))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderInterpParts = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match dtb__177 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__179) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInterpParts mc0) dtb__178)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__179)), ps))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (dtb__180) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__180)) (fun e2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInterpParts mc0) dtb__178)) (fun ps -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (e2)), ps))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds = (fun t binds -> ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderBind t) v))) binds))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderBind = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__181)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__182)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, v2))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderFields = (fun t fields -> ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderField t) v))) fields))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderField = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__184)) (fun v2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, v2))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses = (fun t clauses -> ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderClause t) v))) clauses))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts = (fun t alts -> ((Base_dResult.v_Base_dResult_dtraverse (fun a -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt t) a))) alts))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__185)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__186)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p2, b2))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__187, dtb__188) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun pat -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) pat))) dtb__187)) (fun pats2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__188)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (pats2, b2))))))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (dtb__189, dtb__190) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__189)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDExpr (e2, dtb__190))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (dtb__191, dtb__192, dtb__193) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) dtb__191)) (fun p2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__192)) (fun e2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDoStmt_Vuna_dCompiler_dFrontend_dAst_dDBind (p2, e2, dtb__193))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__194, dtb__195, dtb__196, dtb__197) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__195)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dCtor_Vuna_dCompiler_dFrontend_dAst_dCtor (dtb__194, ty2, dtb__196, dtb__197))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__198, dtb__199, dtb__200) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__199)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dField_Vuna_dCompiler_dFrontend_dAst_dField (dtb__198, ty2, dtb__200))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__201, dtb__202, dtb__203) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__202)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dTraitMethod_Vuna_dCompiler_dFrontend_dAst_dTraitMethod (dtb__201, ty2, dtb__203))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__204, dtb__205, dtb__206, dtb__207) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) p))) dtb__205)) (fun pats2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__206)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__204, pats2, b2, dtb__207))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__208, dtb__209, dtb__210, dtb__211) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__209)) (fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__210)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__208, ctx2, ty2, dtb__211))))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (mc1))
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (dtb__212, dtb__213, dtb__214, dtb__215) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__212)) (fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__213)) (fun head2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl mc0) v))) dtb__214)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDInstance (ctx2, head2, ms, dtb__215))))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__216, dtb__217, dtb__218, dtb__219) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod mc0) v))) dtb__218)) (fun ms -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDTrait (dtb__216, dtb__217, ms, dtb__219))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__220, dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField mc0) v))) dtb__222)) (fun fs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDRecord (dtb__220, dtb__221, fs, dtb__223, dtb__224, dtb__225))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__226, dtb__227, dtb__228, dtb__229) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun p -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern mc0) p))) dtb__227)) (fun pats2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__228)) (fun b2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDFun (dtb__226, pats2, b2, dtb__229))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__230, dtb__231, dtb__232, dtb__233) -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun e -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) e))) dtb__231)) (fun ctx2 -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__232)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDSig (dtb__230, ctx2, ty2, dtb__233))))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__234, dtb__235, dtb__236, dtb__237) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__236)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDExtern (dtb__234, dtb__235, ty2, dtb__237))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__238, dtb__239, dtb__240) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__239)) (fun ty2 -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDAxiom (dtb__238, ty2, dtb__240))))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__241, dtb__242, dtb__243, dtb__244, dtb__245, dtb__246, dtb__247) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr mc0) dtb__243)) (fun k2 -> ((Base_dResult.v_Base_dResult_dandThen ((Base_dResult.v_Base_dResult_dtraverse (fun c -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor mc0) c))) dtb__244)) (fun cs -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dDecl_Vuna_dCompiler_dFrontend_dAst_dDData (dtb__241, dtb__242, k2, cs, dtb__245, dtb__246, dtb__247))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram = (fun t decls -> ((Base_dResult.v_Base_dResult_dtraverse (fun v -> ((v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl t) v))) decls))
