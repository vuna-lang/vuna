open Vuna_runtime
# 28 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarPats = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (match dtb__0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__2, dtb__3) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__4) -> (v_Vuna_dCompiler_dElab_dMatch_dallVarPats dtb__1)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__5, dtb__6, dtb__7) -> false
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany = (fun (mc0 : int) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (match dtb__8 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__10; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__11 } -> (if ((Base_dData_dList.v_Base_dData_dList_dlength dtb__10) > mc0) then true else ((v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany mc0) dtb__9))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripAsPat = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__12, dtb__13, dtb__14) -> (v_Vuna_dCompiler_dElab_dMatch_dstripAsPat dtb__13)
  | _ -> mc0
))

# 71 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmatrixOf = (fun (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dMatch_dstripAsPat)) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) clauses)))

# 78 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_darityOf = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> (match dtb__15 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__17; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__18 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dlength dtb__17)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo = (fun (remaining : int) (n : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (remaining <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse acc) else (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (remaining - 1)) n) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (("mc" ^ (bi_strFromInt (n - remaining))), acc)))))

# 82 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dparamNames = (fun (n : int) -> (((v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo (n - 0)) n) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 92 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__19; Base_dData_dPair.f_Base_dData_dPair_dPair_second = Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty }, Base_dData_dList.C_Base_dData_dList_dList_Nil)), ((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas dtb__20) mc1), Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dspanEmpty))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__21, dtb__22) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__23, dtb__24) -> (dtb__21 = dtb__23)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__25, dtb__26) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__27) -> true
  | _ -> false
)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__28, dtb__29) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__30, dtb__31) -> (dtb__28 = dtb__30)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__32, dtb__33) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__34) -> true
  | _ -> false
)
  | _ -> false
))

# 157 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__35, dtb__36) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__35, dtb__36))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__37, dtb__38) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__37, dtb__38))
  | _ -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (0, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))
))

# 189 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasAsHead = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__39, dtb__40) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__41; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__42 } -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__45, dtb__46, dtb__47) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__40)
)
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead dtb__40)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__39)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__48, dtb__49, dtb__50) -> dtb__49
  | _ -> mc0
))

# 220 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (match dtb__51 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> (match dtb__53 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dpatSpan dtb__55)
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }
))

# 242 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor = (fun (mc0 : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName mc1) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__57)))) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__57))) else ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor dtb__58) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfamilyOfHead = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (h : string) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor table) h) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__59) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__59)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (if (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_disListNilSyntax h) then ((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dfamilyOfShortCtors table) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Nil", Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (if (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_disListConsSyntax h) then ((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dfamilyOfShortCtors table) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("::", (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ("Cons", Base_dData_dList.C_Base_dData_dList_dList_Nil))))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dcanonHeads = (fun (mc0 : (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (match ((Vuna_dCompiler_dElab_dCoverage.v_Vuna_dCompiler_dElab_dCoverage_dsentinelCtorIn mc0) dtb__60) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__62) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dcanonHeads mc0) dtb__61) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__62, dtb__63))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered = (fun (mc0 : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__64, dtb__65) -> (match ((v_Vuna_dCompiler_dElab_dMatch_dfamilyOfHead mc0) dtb__64) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__66) -> ((fun names -> (match ((v_Vuna_dCompiler_dElab_dMatch_dcanonHeads dtb__66) mc1) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__67) -> ((Base_dData_dList.v_Base_dData_dList_dallMem names) dtb__67)
  | _ -> failwith "DT: impossible branch"
)) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__66))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 287 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__68, dtb__69) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__70; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__71 } -> (match dtb__70 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__69)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__72, dtb__73) -> (match dtb__72 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__74, dtb__75, dtb__76) -> true
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead dtb__69)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__68)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__77, dtb__78) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__79; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__80 } -> (match dtb__79 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (match dtb__81 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__83, dtb__84, dtb__85) -> (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads dtb__78)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__77)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 313 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_disWildPat = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__86) -> true
  | _ -> false
))

# 309 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallWildPats = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__87, dtb__88) -> (if (v_Vuna_dCompiler_dElab_dMatch_disWildPat dtb__87) then (v_Vuna_dCompiler_dElab_dMatch_dallWildPats dtb__88) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 317 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dfirstPats = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__92 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__93, dtb__94, dtb__95) -> (v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat dtb__94)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__96) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__97, dtb__98) -> true
  | _ -> false
))

# 328 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__99, dtb__100) -> (if (v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat dtb__99) then (v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats dtb__100) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 333 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dpruneRows = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__101, dtb__102) -> (if (v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__101)) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__101, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__101, (v_Vuna_dCompiler_dElab_dMatch_dpruneRows dtb__102))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 337 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__103, dtb__104) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__105; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__106 } -> (match dtb__105 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats dtb__104)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) dtb__103)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 344 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (0, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__109; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__110 } -> dtb__110
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 348 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_disVarPatD = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__111) -> true
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__112, dtb__113) -> true
  | _ -> false
))

# 353 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dallVarHeads = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__114, dtb__115) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__116; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__117 } -> (match dtb__116 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__118, dtb__119) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__118) then (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads dtb__115) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__114)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, dtb__121) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 } -> (match dtb__122 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__125; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 }, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__121)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__120, (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol dtb__121)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__120)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 463 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PRecord (dtb__126, dtb__127, dtb__128) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (fun (f : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dData_dPair.v_Base_dData_dPair_dsecondOf f)))) dtb__127)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PStr (dtb__129, dtb__130) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PInt (dtb__131, dtb__132) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__133, dtb__134, dtb__135) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) dtb__134)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__136) -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__137, dtb__138, dtb__139) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf dtb__138)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__140, dtb__141) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__140, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 459 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dbindNames = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> ((Base_dData_dList.v_Base_dData_dList_dappend (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__142))) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__143))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 381 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_drenameExpr = (fun (oldName : string) (newName : string) (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match e with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar (dtb__144, dtb__145) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__144) = oldName) then (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName newName), dtb__145)) else e)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__146, dtb__147) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInt (dtb__146, dtb__147))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__148, dtb__149) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EStr (dtb__148, dtb__149))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__150, dtb__151) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EFloat (dtb__150, dtb__151))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__152, dtb__153, dtb__154) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELam (dtb__152, ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) dtb__152)) dtb__153), dtb__154))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp (dtb__155, dtb__156, dtb__157) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__155), ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName)) dtb__156), dtb__157))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EPi (dtb__158, dtb__159, dtb__160, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__161), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__162), dtb__163))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (dtb__164, dtb__165, dtb__166, dtb__167) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELet (((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameBind oldName) newName)) dtb__164), ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dbindNames dtb__164)) dtb__165), dtb__166, dtb__167))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase (dtb__168, dtb__169, dtb__170) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__168), ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameAlt oldName) newName)) dtb__169), dtb__170))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (dtb__171, dtb__172) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ELocalFun (((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause oldName) newName)) dtb__171), dtb__172))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf (dtb__173, dtb__174, dtb__175, dtb__176) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__173), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__174), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__175), dtb__176))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField (dtb__177, dtb__178, dtb__179) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EField ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__177), dtb__178, dtb__179))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__180, dtb__181, dtb__182) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecord (dtb__180, ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__181), dtb__182))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate (dtb__183, dtb__184, dtb__185) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ERecUpdate ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__183), ((Base_dData_dList.v_Base_dData_dList_dmap ((v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue oldName) newName)) dtb__184), dtb__185))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__186, dtb__187) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EDo (dtb__186, dtb__187))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__188, dtb__189, dtb__190, dtb__191) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInfix (dtb__188, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__189), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__190), dtb__191))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__192, dtb__193, dtb__194, dtb__195) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EBacktick (dtb__192, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__193), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__194), dtb__195))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__196, dtb__197) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectOp (dtb__196, dtb__197))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__198, dtb__199, dtb__200) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectL (dtb__198, (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__199), dtb__200))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR (dtb__201, dtb__202, dtb__203) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ESectR ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__201), dtb__202, dtb__203))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen (dtb__204, dtb__205) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EParen ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__204), dtb__205))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn (dtb__206, dtb__207, dtb__208) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EAnn ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__206), (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) dtb__207), dtb__208))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__209, dtb__210, dtb__211) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EInterp (dtb__209, (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts oldName) newName) dtb__210), dtb__211))
  | _ -> failwith "DT: impossible branch"
))
# 434 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts = (fun (mc0 : string) (mc1 : string) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dInterpPart Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole (dtb__214) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPHole ((((v_Vuna_dCompiler_dElab_dMatch_drenameExpr mc0) mc1) dtb__214))), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__213)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__215) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dInterpPart_IPText (dtb__215)), (((v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts mc0) mc1) dtb__213)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 441 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless = (fun (oldName : string) (newName : string) (names : string Base_dData_dList.t_Base_dData_dList_dList) (body : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName oldName) names) then body else (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) body)))
# 445 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameBind = (fun (oldName : string) (newName : string) (bnd : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf bnd); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf bnd)) })
# 448 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue = (fun (oldName : string) (newName : string) (field : (string, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf field); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr oldName) newName) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf field)) })
# 453 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause = (fun (oldName : string) (newName : string) (clause : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf clause); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) ((Base_dData_dList.v_Base_dData_dList_dconcatMap v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf clause))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf clause)) })
# 472 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_drenameAlt = (fun (oldName : string) (newName : string) (alt : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> ((fun p -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = p; Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((((v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless oldName) newName) (v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf p)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf alt)) }) (Base_dData_dPair.v_Base_dData_dPair_dfirstOf alt)))

# 137 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__216, dtb__217) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__216) mc0) mc2)
  | _ -> mc2
))

# 127 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch = (fun (mc0 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc1 : string) (mc2 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__218, dtb__219) -> (match dtb__218 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__220; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__221 } -> (match dtb__220 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__219) mc3)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__222, dtb__223) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches mc0) dtb__222) then ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__219) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__223; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody mc1) dtb__222) dtb__221) }, mc3))) else ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch mc0) mc1) dtb__219) mc3))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc3)
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses = (fun (lit : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (pos : string) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch lit) pos) clauses) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 213 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_drenameAsHead = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat) (mc2 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (match mc1 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__224, dtb__225) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__224) mc0) mc2)
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PAs (dtb__226, dtb__227, dtb__228) -> (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__226) mc0) mc2)
  | _ -> mc2
))

# 205 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dasInnerClause = (fun (mc0 : string) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (match mc1 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__229; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__230 } -> (match dtb__229 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__231, dtb__232) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead dtb__231), Base_dData_dList.C_Base_dData_dList_dList_Nil))) dtb__232); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameAsHead mc0) dtb__231) dtb__230) }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 370 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn = (fun (mc0 : string) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__233, dtb__234) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__235; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__236 } -> (match dtb__235 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__233, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__234)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__237, dtb__238) -> (match dtb__237 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__239, dtb__240) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__238; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__239) mc0) dtb__236) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__234)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__241) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__238; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__236 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__234)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__238; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__236 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn mc0) dtb__234)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__233)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 506 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__242, dtb__243) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__244; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__245 } -> (match dtb__244 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__243) mc1)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (match dtb__246 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__248, dtb__249, dtb__250) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__248) = mc1) then (Base_dData_dList.v_Base_dData_dList_dlength dtb__249) else ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__243) mc1))
  | _ -> ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount dtb__243) mc1)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__242)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo = (fun (pos : string) (remaining : int) (n : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (remaining <= 0) then (Base_dData_dList.v_Base_dData_dList_dreverse acc) else ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (remaining - 1)) n) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["_sc_"; pos; "_"; (bi_strFromInt (n - remaining))]), acc)))))

# 523 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo = (fun (pos : string) (i : int) (n : int) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo pos) (n - i)) n) acc))

# 520 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor = (fun (pos : string) (n : int) -> ((((v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo pos) 0) n) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 543 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct = (fun (mc0 : string) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__251, dtb__252) -> (if (dtb__251 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__251, dtb__252)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__251, ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct mc0) dtb__252))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 533 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dctorHeads = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__253, dtb__254) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__255; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__256 } -> (match dtb__255 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__254)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__257, dtb__258) -> (match dtb__257 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__259, dtb__260, dtb__261) -> ((v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct (Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__259)) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__254))
  | _ -> (v_Vuna_dCompiler_dElab_dMatch_dctorHeads dtb__254)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__253)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string) (mc3 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, dtb__263) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__264; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 } -> (match dtb__264 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__263)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, dtb__267) -> (match dtb__266 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon (dtb__268, dtb__269, dtb__270) -> (if ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_drnameKey dtb__268) = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend dtb__269) dtb__267); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__263))) else ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__263))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__271, dtb__272) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend mc1) dtb__267); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__271) mc2) dtb__265) }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__263)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__273) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((Base_dData_dList.v_Base_dData_dList_dappend mc1) dtb__267); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 }, ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__263)))
  | _ -> ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor mc0) mc1) mc2) dtb__263)
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__262)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dfilterFallback = (fun (mc0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, dtb__275) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__276; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__277 } -> (match dtb__276 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__275)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__278, dtb__279) -> (if (v_Vuna_dCompiler_dElab_dMatch_disVarPatD dtb__278) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__275))) else (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback dtb__275))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__274)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 588 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks = (fun (mc0 : string) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, dtb__281) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__282; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 } -> (match dtb__282 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__281)))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__284, dtb__285) -> (match dtb__284 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__286, dtb__287) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__285; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dMatch_drenameExpr dtb__286) mc0) dtb__283) }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__281)))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__288) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__285; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__283 }, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__281)))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__280, ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks mc0) dtb__281)))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__280)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Elab/Match.vuna"
let rec v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (pos : string) (restParams : string Base_dData_dList.t_Base_dData_dList_dList) (fb : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) clauses) pos) restParams) fb) fuel)))
# 103 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (pos : string) (restParams : string Base_dData_dList.t_Base_dData_dList_dList) (fb : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__289, dtb__290) -> (match dtb__289 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__291; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__292 } -> (match dtb__291 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__293, dtb__294) -> (match dtb__293 with
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (dtb__295, dtb__296) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn pos) clauses)) restParams) fb) (fuel - 1))
  | Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild (dtb__297) -> (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol clauses)) restParams) fb) (fuel - 1))
  | _ -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo table) dtb__290) pos) restParams) fb) (fuel - 1))) (fun (restExpr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) (((v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses dtb__293) pos) clauses)) restParams) fb) (fuel - 1))) (fun (bodyExpr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EIf ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EApp ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName "=="), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName pos), { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr dtb__293), Base_dData_dList.C_Base_dData_dList_dList_Nil)))), (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dpatSpan dtb__293))), bodyExpr, restExpr, (Vuna_dCompiler_dFrontend_dRast.v_Vuna_dCompiler_dFrontend_dRast_dpatSpan dtb__293)))))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_IntStringCaseNeedsFallback)
  | _ -> failwith "DT: impossible branch"
)) clauses)))
# 163 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses0 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (params : string Base_dData_dList.t_Base_dData_dList_dList) (fb : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))) else (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExprPruned table) (v_Vuna_dCompiler_dElab_dMatch_dpruneRows clauses0)) params) fb) fuel)))
# 170 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExprPruned = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (params : string Base_dData_dList.t_Base_dData_dList_dList) (fb : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats clauses) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (if (v_Vuna_dCompiler_dElab_dMatch_dallWildPats (v_Vuna_dCompiler_dElab_dMatch_dfirstPats clauses)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst clauses))) else (match params with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 fb) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__298, dtb__299) -> (if (v_Vuna_dCompiler_dElab_dMatch_dhasAsHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dasColumn table) clauses) dtb__298) dtb__299) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dallVarHeads clauses) then (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn dtb__298) clauses)) dtb__299) fb) (fuel - 1)) else (if (v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__298) dtb__299) fb) fuel) else (if (v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead clauses) then ((((((v_Vuna_dCompiler_dElab_dMatch_dctorColumn table) clauses) dtb__298) dtb__299) fb) fuel) else ((((((v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr table) clauses) dtb__298) dtb__299) fb) (fuel - 1))))))
  | _ -> failwith "DT: impossible branch"
)))))
# 196 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dasColumn = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (pos : string) (restParams : string Base_dData_dList.t_Base_dData_dList_dList) (fb : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_PatternFuel) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) ((Base_dData_dList.v_Base_dData_dList_dmap (v_Vuna_dCompiler_dElab_dMatch_dasInnerClause pos)) clauses)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (pos, restParams))) fb) (fuel - 1))) (fun (e : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (e))))))
# 229 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorColumn = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (pos : string) (restParams : string Base_dData_dList.t_Base_dData_dList_dList) (fbSp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltList table) clauses) pos) restParams) fbSp) (fuel - 1))) (fun (alts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((fun caseSp -> (if ((v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered table) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName pos), caseSp)), alts, caseSp)))) else ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind ((((((v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList table) pos) clauses) restParams) fbSp) (fuel - 1))) (fun (fbAlts : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_ECase ((Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dExpr_EVar ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName pos), caseSp)), ((Base_dData_dList.v_Base_dData_dList_dappend alts) fbAlts), caseSp)))))))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses))))))
# 483 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltList = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (pos : string) (restParams : string Base_dData_dList.t_Base_dData_dList_dList) (fbSp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo table) clauses) (v_Vuna_dCompiler_dElab_dMatch_dctorHeads clauses)) pos) restParams) fbSp) fuel)))
# 490 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo = (fun (mc0 : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) (mc5 : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (mc6 : int) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__300, dtb__301) -> (if (mc6 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else ((fun subpatCount -> ((fun freshSubs -> ((fun subParams -> ((fun branchPats -> ((fun expanded -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr mc0) expanded) subParams) mc5) (mc6 - 1))) (fun (bodyExpr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((((v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo mc0) mc1) dtb__301) mc3) mc4) mc5) (mc6 - 1))) (fun (tail : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PCon ((Vuna_dCompiler_dFrontend_dRast_dName.v_Vuna_dCompiler_dFrontend_dRast_dName_dclassifyName dtb__300), branchPats, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = bodyExpr }, tail))))))))) ((((v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor dtb__300) branchPats) mc3) mc1))) ((Base_dData_dList.v_Base_dData_dList_dmap (fun (n : string) -> (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PVar (n, { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })))) freshSubs))) ((Base_dData_dList.v_Base_dData_dList_dappend freshSubs) mc4))) ((v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor mc3) subpatCount))) ((v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount mc1) dtb__300)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (mc6 <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
# 579 "Vuna/Compiler/Elab/Match.vuna"
and v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (pos : string) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (restParams : string Base_dData_dList.t_Base_dData_dList_dList) (fbSp : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan) (fuel : int) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "pattern matrix") else (match ((v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks pos) (v_Vuna_dCompiler_dElab_dMatch_dfilterFallback clauses)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | dtb__302 -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) dtb__302) restParams) fbSp) (fuel - 1))) (fun (bodyExpr : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dFrontend_dRast.C_Vuna_dCompiler_dFrontend_dRast_dPat_PWild ({ Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 })); Base_dData_dPair.f_Base_dData_dPair_dPair_second = bodyExpr }, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))
)))

# 45 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_FunctionNoClauses) Base_dData_dVec.C_Base_dData_dVec_dVec_Nil)))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__303) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany dtb__303) clauses) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns) else ((fun names -> ((Vuna_dCompiler_dBase_dCommon.v_Vuna_dCompiler_dBase_dCommon_dbind (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) names) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200)) (fun (body : Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas names) body)))))) (v_Vuna_dCompiler_dElab_dMatch_dparamNames dtb__303)))
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Elab/Match.vuna"
let v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr = (fun (table : (string, (bool, (string, int) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (clauses : (Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dPat Base_dData_dList.t_Base_dData_dList_dList, Vuna_dCompiler_dFrontend_dRast.t_Vuna_dCompiler_dFrontend_dRast_dExpr) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (name : string) -> (match (v_Vuna_dCompiler_dElab_dMatch_darityOf clauses) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__304) -> (if ((v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany dtb__304) clauses) then ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0 (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_ClauseTooManyPatterns) else (((((v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr table) clauses) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (name, Base_dData_dList.C_Base_dData_dList_dList_Nil))) (v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan clauses)) 200))
  | _ -> failwith "DT: impossible branch"
))
