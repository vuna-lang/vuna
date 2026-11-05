open Vuna_runtime
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__8 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__11) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dList.v_Base_dList_dlength dtb__10)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Base_dList_dCons (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun n -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (n - 0)) n) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, Base_dList.C_Base_dList_dList_Base_dList_dNil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__13) mc1), (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__14, dtb__15) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__16, dtb__17) -> (dtb__14 = dtb__16)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__18, dtb__19) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__20) -> true
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__21, dtb__22) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__23, dtb__24) -> (dtb__21 = dtb__23)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__25, dtb__26) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__27) -> true
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__28, dtb__29) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__28, dtb__29))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__30, dtb__31) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__30, dtb__31))
  | _ -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (match dtb__34 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> (match dtb__36 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__38, dtb__39, dtb__40) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__33)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__32)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__41, dtb__42, dtb__43) -> dtb__42
  | _ -> mc0
))

let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (match dtb__44 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (match dtb__46 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__48)
  | _ -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if ((Base_dList.v_Base_dList_dmemName mc1) (Base_dPair.v_Base_dPair_dsecondOf dtb__50)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.v_Base_dPair_dsecondOf dtb__50))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__51) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallNamesIn = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> (if ((Base_dList.v_Base_dList_dmemName dtb__52) mc1) then ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__53) mc1) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor mc0) dtb__54) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__56) -> ((v_Vuna_dCompiler_dElab_dMatch_dallNamesIn dtb__56) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__57, dtb__58) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__59, dtb__60) -> (match dtb__59 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__58)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__61, dtb__62) -> (match dtb__61 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__63, dtb__64, dtb__65) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__58)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__57)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (match dtb__68 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__72, dtb__73, dtb__74) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__67)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__66)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__75, dtb__76) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__76)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__75)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (0, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__79, dtb__80) -> (match dtb__79 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__81, dtb__82) -> dtb__82
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__83) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__84, dtb__85) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__86, dtb__87) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> (match dtb__88 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__90) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__87) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__86)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> (match dtb__94 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__97, dtb__95)), (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__93)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__93)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__92)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPRecord (dtb__98, dtb__99, dtb__100) -> ((Base_dList.v_Base_dList_dconcatMap (fun f -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dsecondOf f)))) dtb__99)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPStr (dtb__101, dtb__102) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPInt (dtb__103, dtb__104) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__105, dtb__106, dtb__107) -> ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__106)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__108) -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__109, dtb__110, dtb__111) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__109, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__110)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__112, dtb__113) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__112, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__114, dtb__115) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dPair.v_Base_dPair_dfirstOf dtb__114))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__115))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun oldName newName e -> (match e with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (dtb__116, dtb__117) -> (if (dtb__116 = oldName) then (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (newName, dtb__117)) else e)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__118, dtb__119) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInt (dtb__118, dtb__119))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__120, dtb__121) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEStr (dtb__120, dtb__121))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__122, dtb__123, dtb__124) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELam (dtb__122, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) dtb__122) dtb__123), dtb__124))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp (dtb__125, dtb__126, dtb__127) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__125), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__126), dtb__127))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEPi (dtb__128, dtb__129, dtb__130, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__131), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__128, Base_dList.C_Base_dList_dList_Base_dList_dNil))) dtb__132), dtb__133))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (dtb__134, dtb__135, dtb__136, dtb__137) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELet (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__134), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__134)) dtb__135), dtb__136, dtb__137))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase (dtb__138, dtb__139, dtb__140) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__138), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__139), dtb__140))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (dtb__141, dtb__142) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dELocalFun (((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__141), dtb__142))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf (dtb__143, dtb__144, dtb__145, dtb__146) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__143), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__144), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__145), dtb__146))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField (dtb__147, dtb__148, dtb__149) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__147), dtb__148, dtb__149))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__150, dtb__151, dtb__152) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecord (dtb__150, ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__151), dtb__152))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate (dtb__153, dtb__154, dtb__155) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__153), ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__154), dtb__155))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__156, dtb__157) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEDo (dtb__156, dtb__157))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__158, dtb__159, dtb__160, dtb__161) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInfix (dtb__158, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__159), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__160), dtb__161))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__162, dtb__163, dtb__164, dtb__165) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEBacktick (dtb__162, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__163), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__164), dtb__165))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__166, dtb__167) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectOp (dtb__166, dtb__167))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__168, dtb__169, dtb__170) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectL (dtb__168, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__169), dtb__170))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR (dtb__171, dtb__172, dtb__173) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dESectR ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__171), dtb__172, dtb__173))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen (dtb__174, dtb__175) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__174), dtb__175))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn (dtb__176, dtb__177, dtb__178) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__176), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__177), dtb__178))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__179, dtb__180, dtb__181) -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEInterp (dtb__179, (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts oldName) newName) dtb__180), dtb__181))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (match dtb__182 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole (dtb__184) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPHole ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr mc0) mc1) dtb__184))), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__183)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__185) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dInterpPart_Vuna_dCompiler_dFrontend_dAst_dIPText (dtb__185)), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__183)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun oldName newName names body -> (if ((Base_dList.v_Base_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body)))
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun oldName newName bind -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf bind), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf bind)))))
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun oldName newName field -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf field), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dPair.v_Base_dPair_dsecondOf field)))))
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun oldName newName clause -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf clause), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (Base_dPair.v_Base_dPair_dfirstOf clause))) (Base_dPair.v_Base_dPair_dsecondOf clause)))))
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun oldName newName alt -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (p, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (Base_dPair.v_Base_dPair_dsecondOf alt))))) (Base_dPair.v_Base_dPair_dfirstOf alt)))

let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__186, dtb__187) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__186) mc0) mc2)
  | _ -> mc2
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (match dtb__188 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (match dtb__190 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__189) mc3)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__192, dtb__193) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__192) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__189) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__192) dtb__191))), mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__189) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.v_Base_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun lit pos clauses -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun mc0 mc1 mc2 -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__194, dtb__195) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__194) mc0) mc2)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPAs (dtb__196, dtb__197, dtb__198) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__196) mc0) mc2)
  | _ -> mc2
))

let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun mc0 mc1 -> (match mc1 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, dtb__200) -> (match dtb__199 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__201, dtb__202) -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dappend (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__201), Base_dList.C_Base_dList_dList_Base_dList_dNil))) dtb__202), (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__201) dtb__200)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__203, dtb__204) -> (match dtb__203 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__205, dtb__206) -> (match dtb__205 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__204) mc1) mc2)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__207, dtb__208) -> (match dtb__207 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__209, dtb__210) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__204) mc1) (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__209) mc1) mc2))
  | _ -> (((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars dtb__204) mc1) mc2)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__213, dtb__214) -> (match dtb__213 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__212) mc1)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__215, dtb__216) -> (match dtb__215 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__217, dtb__218, dtb__219) -> (if (dtb__217 = mc1) then (Base_dList.v_Base_dList_dlength dtb__218) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__212) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__212) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__211)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun pos remaining n acc -> (if (remaining <= 0) then (Base_dList.v_Base_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (remaining - 1)) n) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun pos i n acc -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (n - i)) n) acc))

let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun pos n -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__220, dtb__221) -> (if (dtb__220 = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__220, dtb__221)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__220, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__221))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__222, dtb__223) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__224, dtb__225) -> (match dtb__224 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__223)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__226, dtb__227) -> (match dtb__226 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__228, dtb__229, dtb__230) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct dtb__228) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__223))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__223)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__222)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__233, dtb__234) -> (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__232)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__235, dtb__236) -> (match dtb__235 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__237, dtb__238, dtb__239) -> (if (dtb__237 = mc0) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dappend dtb__238) dtb__236), dtb__234)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__232))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__232))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__240, dtb__241) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dappend mc1) dtb__236), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__240) mc2) dtb__234))), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__232)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__242) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Base_dList.v_Base_dList_dappend mc1) dtb__236), dtb__234)), ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__232)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__232)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__231)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__243, dtb__244) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, dtb__246) -> (match dtb__245 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__244)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__247) then (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__243, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__244))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__244))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__243)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252) -> (match dtb__251 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__249, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__250)))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__253, dtb__254) -> (match dtb__253 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__255, dtb__256) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__255) mc0) dtb__252))), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__250)))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__257) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__254, dtb__252)), ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__250)))
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__249, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__250)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__249)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fuel)))
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__258, dtb__259) -> (match dtb__258 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__260, dtb__261) -> (match dtb__260 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dClauseTooManyPatterns) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__262, dtb__263) -> (match dtb__262 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (dtb__264, dtb__265) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) (fuel - 1))) (fun inner -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__264) pos) inner)))))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild (dtb__266) -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) (fuel - 1))
  | _ -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__259) pos) restParams) (fuel - 1))) (fun restExpr -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__262) pos) clauses)) restParams) (fuel - 1))) (fun bodyExpr -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEIf ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEApp ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar ("==", (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__262), Base_dList.C_Base_dList_dList_Base_dList_dNil)))), (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__262))), bodyExpr, restExpr, (Vuna_dCompiler_dFrontend_dAst.v_Vuna_dCompiler_dFrontend_dAst_dpatSpan dtb__262)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dIntStringCaseNeedsFallback) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | _ -> failwith "DT: impossible branch"
)) clauses)))
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun table clauses params fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dPatternFuel) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dClauseTooManyPatterns) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__267, dtb__268) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__267) dtb__268) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) dtb__268) (fuel - 1))) (fun inner -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars clauses) dtb__267) inner))))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__267) dtb__268) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__267) dtb__268) fuel) else (((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__267) dtb__268) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dPatternFuel) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil))) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (pos, restParams))) (fuel - 1))) (fun e -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (e))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) (fuel - 1))) (fun alts -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), alts, caseSp)))) else ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) (fuel - 1))) (fun fb -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dECase ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_Vuna_dCompiler_dFrontend_dAst_dEVar (pos, caseSp)), ((Base_dList.v_Base_dList_dappend alts) fb), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun table clauses pos restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fuel)))
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__269, dtb__270) -> (if (mc5 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) (mc5 - 1))) (fun bodyExpr -> ((Base_dResult.v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__270) mc3) mc4) (mc5 - 1))) (fun tail -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPCon (dtb__269, branchPats, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__269) branchPats) mc3) mc1))) ((Base_dList.v_Base_dList_dmap (fun n -> (Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPVar (n, (Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) freshSubs))) ((Base_dList.v_Base_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__269)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc5 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun table pos clauses restParams fuel -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: pattern matrix fuel exhausted")) else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | dtb__271 -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__271) restParams) (fuel - 1))) (fun bodyExpr -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_Vuna_dCompiler_dFrontend_dAst_dPWild ((Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), bodyExpr)), Base_dList.C_Base_dList_dList_Base_dList_dNil))))))
)))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun table clauses -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (((Vuna_dCompiler_dDiagnostics_dTc.v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dDiagnostics_dTc.C_Vuna_dCompiler_dDiagnostics_dTc_dTcErr_Vuna_dCompiler_dDiagnostics_dTc_dFunctionNoClauses) Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__272) -> ((fun names -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) 200)) (fun body -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__272))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun table clauses name -> ((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (Base_dList.C_Base_dList_dList_Base_dList_dCons (name, Base_dList.C_Base_dList_dList_Base_dList_dNil))) 200))
