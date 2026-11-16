open Vuna_runtime
# 23 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = 0 }

# 27 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dwilds = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), (v_Vuna_dCompiler_dElab_dCoverage_dwilds (n - 1))))))

# 31 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dpatHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__0, dtb__1, dtb__2) -> (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__1)
  | _ -> mc0
))

# 35 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__3) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__5, dtb__6, dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf = (fun rows -> (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName) rows)))

# 45 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dallRowsUnary = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if ((Base_dList.v_Base_dList_dlength dtb__8) = 1) then (v_Vuna_dCompiler_dElab_dCoverage_dallRowsUnary dtb__9) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__10 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__12; Base_dPair.f_Base_dPair_dPair_second = dtb__13 } -> (if (dtb__12 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13)) else ((v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry mc0) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors = (fun table cname -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__14)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Base_dList.v_Base_dList_dfilter (fun e -> (((Base_dEq.v_Base_dEq_dneq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dInt.v_Eq_uInt)) ((v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry cname) (Base_dPair.v_Base_dPair_dsecondOf e))) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) table)))

# 68 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dfirstMissing = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf dtb__16)) mc1) then ((v_Vuna_dCompiler_dElab_dCoverage_dfirstMissing dtb__17) mc1) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ((Base_dPair.v_Base_dPair_dfirstOf dtb__16), (v_Vuna_dCompiler_dElab_dCoverage_dwilds (Base_dPair.v_Base_dPair_dsecondOf dtb__16)), v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dmissingTopCtor = (fun table clauses -> (if (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dElab_dCoverage_dallRowsUnary clauses)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match (v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf clauses) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match ((v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors table) dtb__18) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20) -> ((v_Vuna_dCompiler_dElab_dCoverage_dfirstMissing dtb__20) (v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf clauses))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 79 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn = (fun fuel paren p -> (if (fuel <= 0) then "_" else (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead p) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__21, dtb__22, dtb__23) -> (if ((Base_dList.v_Base_dList_dlength dtb__22) = 0) then dtb__21 else ((fun body -> (if paren then (String.concat "" ["("; body; ")"]) else body)) (String.concat "" [dtb__21; " "; ((Base_dString.v_Base_dString_djoin " ") ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn (fuel - 1)) true)) dtb__22))])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__24, dtb__25) -> "_"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__26) -> "_"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__27, dtb__28) -> (bi_strFromInt dtb__27)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__29, dtb__30) -> (String.concat "" ["\""; dtb__29; "\""])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__31, dtb__32, dtb__33) -> (String.concat "" ["{ "; dtb__31; " }"])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__34, dtb__35, dtb__36) -> (((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn (fuel - 1)) paren) dtb__35)
  | _ -> failwith "DT: impossible branch"
)))

# 76 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_drenderPat = (fun p -> (((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn 64) false) p))
