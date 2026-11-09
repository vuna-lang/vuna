open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__8 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__10, dtb__11) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dlength dtb__10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (n - 0)) n) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam ((Base_dList.C_Base_dList_dList_Cons (dtb__12, Base_dList.C_Base_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__13) mc1), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__14, dtb__15) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__16, dtb__17) -> (dtb__14 = dtb__16)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__18, dtb__19) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__20) -> true
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__21, dtb__22) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__23, dtb__24) -> (dtb__21 = dtb__23)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__25, dtb__26) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__27) -> true
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__28, dtb__29) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__28, dtb__29))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__30, dtb__31) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__30, dtb__31))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (match dtb__36 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__38, dtb__39, dtb__40) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__32)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__41, dtb__42, dtb__43) -> dtb__42
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__46, dtb__47) -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__48)
  | _ -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if ((Base_dList.v_Base_dList_dmemName mc1) (Base_dPair.v_Base_dPair_dsecondOf dtb__50)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__50))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__51) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallNamesIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if ((Base_dList.v_Base_dList_dmemName dtb__52) mc1) then ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__53) mc1) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor mc0) dtb__54) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__56) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__59, dtb__60) -> (match dtb__59 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__58)
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (match dtb__61 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__63, dtb__64, dtb__65) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__58)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__57)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__66, dtb__67) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__68, dtb__69) -> (match dtb__68 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__72, dtb__73, dtb__74) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__67)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__66)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__77, dtb__78) -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__76)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__75)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (0, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0))))
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (match dtb__79 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__81, dtb__82) -> dtb__82
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__83) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__84, dtb__85) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__86, dtb__87) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__88, dtb__89) -> (match dtb__88 with
  | Base_dList.C_Base_dList_dList_Nil -> false
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__90) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__86)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__94, dtb__95) -> (match dtb__94 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__97, dtb__95)), (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__93)))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__92, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__93)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__92)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__98, dtb__99, dtb__100) -> ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__101, dtb__102) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__103, dtb__104) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__105, dtb__106, dtb__107) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__106)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__108) -> Base_dList.C_Base_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__109, dtb__110, dtb__111) -> (Base_dList.C_Base_dList_dList_Cons (dtb__109, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__110)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__112, dtb__113) -> (Base_dList.C_Base_dList_dList_Cons (dtb__112, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dfirstOf dtb__114))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__115))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName newName e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__116, dtb__117) -> (if (dtb__116 = oldName) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (newName, dtb__117)) else e)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__118, dtb__119) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInt (dtb__118, dtb__119))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__120, dtb__121) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EStr (dtb__120, dtb__121))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__122, dtb__123) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EFloat (dtb__122, dtb__123))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__124, dtb__125, dtb__126) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELam (dtb__124, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__124) dtb__125), dtb__126))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__127, dtb__128, dtb__129) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__127), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__128), dtb__129))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134, dtb__135) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EPi (dtb__130, dtb__131, dtb__132, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__133), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (Base_dList.C_Base_dList_dList_Cons (dtb__130, Base_dList.C_Base_dList_dList_Nil))) dtb__134), dtb__135))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (dtb__136, dtb__137, dtb__138, dtb__139) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELet (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__136), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__136)) dtb__137), dtb__138, dtb__139))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase (dtb__140, dtb__141, dtb__142) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__140), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__141), dtb__142))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (dtb__143, dtb__144) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ELocalFun (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__143), dtb__144))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf (dtb__145, dtb__146, dtb__147, dtb__148) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__145), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__146), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__147), dtb__148))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField (dtb__149, dtb__150, dtb__151) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__149), dtb__150, dtb__151))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__152, dtb__153, dtb__154) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecord (dtb__152, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__153), dtb__154))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate (dtb__155, dtb__156, dtb__157) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__155), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__156), dtb__157))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__158, dtb__159) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EDo (dtb__158, dtb__159))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__160, dtb__161, dtb__162, dtb__163) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__160, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__161), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__162), dtb__163))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__164, dtb__165, dtb__166, dtb__167) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EBacktick (dtb__164, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__165), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__166), dtb__167))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__168, dtb__169) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectOp (dtb__168, dtb__169))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__170, dtb__171, dtb__172) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectL (dtb__170, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__171), dtb__172))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR (dtb__173, dtb__174, dtb__175) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ESectR ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__173), dtb__174, dtb__175))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen (dtb__176, dtb__177) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__176), dtb__177))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn (dtb__178, dtb__179, dtb__180) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__178), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__179), dtb__180))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__181, dtb__182, dtb__183) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInterp (dtb__181, (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts oldName) newName) dtb__182), dtb__183))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (match dtb__184 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole (dtb__186) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPHole ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr mc0) mc1) dtb__186))), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__185)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__187) -> (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_IPText (dtb__187)), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__185)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName newName names body -> (if ((Base_dList.v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body)))
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName newName bind -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf bind), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf bind)))))
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName newName field -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf field), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf field)))))
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName newName clause -> (Base_dPair.C_Base_dPair_dPair_Pair ((Base_dPair.v_Base_dPair_dfirstOf clause), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (Base_dPair.v_Base_dPair_dfirstOf clause))) (Base_dPair.v_Base_dPair_dsecondOf clause)))))
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName newName alt -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Pair (p, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (Base_dPair.v_Base_dPair_dsecondOf alt))))) (Base_dPair.v_Base_dPair_dfirstOf alt)))

let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__188, dtb__189) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__188) mc0) mc2)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__190, dtb__191) -> (match dtb__190 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__192, dtb__193) -> (match dtb__192 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__191) mc3)
  | Base_dList.C_Base_dList_dList_Cons (dtb__194, dtb__195) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__194) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__191) (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__195, (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__194) dtb__193))), mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__191) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit pos clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__196, dtb__197) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__196) mc0) mc2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__198, dtb__199, dtb__200) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__198) mc0) mc2)
  | _ -> mc2
))

let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__201, dtb__202) -> (match dtb__201 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | Base_dList.C_Base_dList_dList_Cons (dtb__203, dtb__204) -> (Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__203), Base_dList.C_Base_dList_dList_Nil))) dtb__204), (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__203) dtb__202)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__205, dtb__206) -> (match dtb__205 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__207, dtb__208) -> (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__206) mc1) mc2)
  | Base_dList.C_Base_dList_dList_Cons (dtb__209, dtb__210) -> (match dtb__209 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__211, dtb__212) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__206) mc1) (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__211) mc1) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__206) mc1) mc2)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__213, dtb__214) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__215, dtb__216) -> (match dtb__215 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__214) mc1)
  | Base_dList.C_Base_dList_dList_Cons (dtb__217, dtb__218) -> (match dtb__217 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__219, dtb__220, dtb__221) -> (if (dtb__219 = mc1) then (Base_dList.v_Base_dList_dlength dtb__220) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__214) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__214) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__213)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos i n acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (n - i)) n) acc))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) Base_dList.C_Base_dList_dList_Nil))

let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223) -> (if (dtb__222 = mc0) then (Base_dList.C_Base_dList_dList_Cons (dtb__222, dtb__223)) else (Base_dList.C_Base_dList_dList_Cons (dtb__222, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__223))))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (mc0, Base_dList.C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__224, dtb__225) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__226, dtb__227) -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__225)
  | Base_dList.C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (match dtb__228 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__230, dtb__231, dtb__232) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__230) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__225))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__225)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__224)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__233, dtb__234) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__235, dtb__236) -> (match dtb__235 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__234)
  | Base_dList.C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (match dtb__237 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__239, dtb__240, dtb__241) -> (if (dtb__239 = mc0) then (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dappend dtb__240) dtb__238), dtb__236)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__234))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__234))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__242, dtb__243) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dappend mc1) dtb__238), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__242) mc2) dtb__236))), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__234)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__244) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (((Base_dList.v_Base_dList_dappend mc1) dtb__238), dtb__236)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__234)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__234)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__233)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__245, dtb__246) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__247, dtb__248) -> (match dtb__247 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__246)
  | Base_dList.C_Base_dList_dList_Cons (dtb__249, dtb__250) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__249) then (Base_dList.C_Base_dList_dList_Cons (dtb__245, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__246))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__246))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__245)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__251, dtb__252) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__253, dtb__254) -> (match dtb__253 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.C_Base_dList_dList_Cons (dtb__251, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__252)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__255, dtb__256) -> (match dtb__255 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__257, dtb__258) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__256, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__257) mc0) dtb__254))), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__252)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__259) -> (Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair (dtb__256, dtb__254)), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__252)))
  | _ -> (Base_dList.C_Base_dList_dList_Cons (dtb__251, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__252)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__251)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fuel)))
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__260, dtb__261) -> (match dtb__260 with
  | Base_dPair.C_Base_dPair_dPair_Pair (dtb__262, dtb__263) -> (match dtb__262 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__264, dtb__265) -> (match dtb__264 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__266, dtb__267) -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) (fuel - 1))) (fun inner -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__266) pos) inner)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__268) -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) (fuel - 1))
  | _ -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__261) pos) restParams) (fuel - 1))) (fun restExpr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__264) pos) clauses)) restParams) (fuel - 1))) (fun bodyExpr -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar ("==", (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))), (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__264), Base_dList.C_Base_dList_dList_Nil)))), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__264))), bodyExpr, restExpr, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__264)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback) Base_dVec.C_Base_dVec_dVec_Nil)))
  | _ -> failwith "DT: impossible branch"
)) clauses)))
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table clauses params fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (Base_dResult.C_Base_dResult_dResult_Ok ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__269, dtb__270) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__269) dtb__270) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) dtb__270) (fuel - 1))) (fun inner -> (Base_dResult.C_Base_dResult_dResult_Ok ((((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars clauses) dtb__269) inner))))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__269) dtb__270) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__269) dtb__270) fuel) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__269) dtb__270) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dVec.C_Base_dVec_dVec_Nil))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (Base_dList.C_Base_dList_dList_Cons (pos, restParams))) (fuel - 1))) (fun e -> (Base_dResult.C_Base_dResult_dResult_Ok (e))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) (fuel - 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), alts, caseSp)))) else ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) (fuel - 1))) (fun fb -> (Base_dResult.C_Base_dResult_dResult_Ok ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_ECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (pos, caseSp)), ((Base_dList.v_Base_dList_dappend alts) fb), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fuel)))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__271, dtb__272) -> (if (mc5 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) (mc5 - 1))) (fun bodyExpr -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__272) mc3) mc4) (mc5 - 1))) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__271, branchPats, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))), bodyExpr)), tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__271) branchPats) mc3) mc1))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (n, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))))) freshSubs))) ((Base_dList.v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__271)))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc5 <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table pos clauses restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: internal: pattern matrix fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok (Base_dList.C_Base_dList_dList_Nil))
  | dtb__273 -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__273) restParams) (fuel - 1))) (fun bodyExpr -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.C_Base_dList_dList_Cons ((Base_dPair.C_Base_dPair_dPair_Pair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild ((Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Span ("", 0, 0, 0, 0)))), bodyExpr)), Base_dList.C_Base_dList_dList_Nil))))))
)))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dResult.C_Base_dResult_dResult_Err (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_FunctionNoClauses) Base_dVec.C_Base_dVec_dVec_Nil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__274) -> ((fun names -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) 200)) (fun body -> (Base_dResult.C_Base_dResult_dResult_Ok (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__274))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table clauses name -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (Base_dList.C_Base_dList_dList_Cons (name, Base_dList.C_Base_dList_dList_Nil))) 200))
