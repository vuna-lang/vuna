open Vuna_runtime
# 33 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0 }

# 37 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dwilds = (fun n -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), (v_Vuna_dCompiler_dElab_dCoverage_dwilds (n - 1))))))

# 41 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dpatHead = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__0, dtb__1, dtb__2) -> (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__1)
  | _ -> mc0
))

# 45 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__3) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__5, dtb__6, dtb__7) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf = (fun rows -> (Base_dList.v_Base_dList_dnubNames ((Base_dList.v_Base_dList_dmapMaybe v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName) rows)))

# 56 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_disWildHead = (fun p -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead p) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__8, dtb__9) -> true
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__10) -> true
  | _ -> false
))

# 63 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows dtb__12)
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (v_Vuna_dCompiler_dElab_dCoverage_disWildHead dtb__13) then (Base_dList.C_Base_dList_dList_Cons (dtb__14, (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows dtb__12))) else (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows dtb__12))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 73 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> ((Base_dList.v_Base_dList_dappend (mc0 dtb__15)) ((v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow mc0) dtb__16))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dspecializeRow = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__17) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__19, dtb__20, dtb__21) -> (if (dtb__19 = mc1) then (Base_dList.C_Base_dList_dList_Cons (((Base_dList.v_Base_dList_dappend dtb__20) dtb__18), Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__22, dtb__23) -> (Base_dList.C_Base_dList_dList_Cons (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dCoverage_dwilds mc0)) dtb__18), Base_dList.C_Base_dList_dList_Nil))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__24) -> (Base_dList.C_Base_dList_dList_Cons (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dCoverage_dwilds mc0)) dtb__18), Base_dList.C_Base_dList_dList_Nil))
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 70 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dspecializeCtor = (fun ar cname rows -> ((v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow ((v_Vuna_dCompiler_dElab_dCoverage_dspecializeRow ar) cname)) rows))

# 85 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> (v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow dtb__26)
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (match dtb__27 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__29; Base_dPair.f_Base_dPair_dPair_second = dtb__30 } -> (if (dtb__29 = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30)) else ((v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry mc0) dtb__28))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 96 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors = (fun table cname -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (Base_dPair.v_Base_dPair_dfirstOf (Base_dPair.v_Base_dPair_dsecondOf dtb__31)) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf dtb__31)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((Base_dList.v_Base_dList_dfilter (fun e -> (((Base_dEq.v_Base_dEq_d_x47__x61_ (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dInt.v_Eq_uInt)) ((v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry cname) (Base_dPair.v_Base_dPair_dsecondOf (Base_dPair.v_Base_dPair_dsecondOf e)))) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))) table)))

# 103 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dorderedCtors = (fun ctors heads -> ((Base_dList.v_Base_dList_dappend ((Base_dList.v_Base_dList_dfilter (fun e -> (Base_dBool.v_Base_dBool_dnot ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf e)) heads)))) ctors)) ((Base_dList.v_Base_dList_dfilter (fun e -> ((Base_dList.v_Base_dList_dmemName (Base_dPair.v_Base_dPair_dfirstOf e)) heads))) ctors)))

# 108 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dtakePats = (fun n xs -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Nil else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (Base_dList.C_Base_dList_dList_Cons (dtb__33, ((v_Vuna_dCompiler_dElab_dCoverage_dtakePats (n - 1)) dtb__34)))
  | _ -> failwith "DT: impossible branch"
)))

# 114 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_ddropPats = (fun n xs -> (if (n <= 0) then xs else (match xs with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> ((v_Vuna_dCompiler_dElab_dCoverage_ddropPats (n - 1)) dtb__36)
  | _ -> failwith "DT: impossible branch"
)))

# 126 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness = (fun table fuel pending rows qs -> (let dtnat__37 = fuel in (if dtnat__37 = 0 then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (let dtb__38 = (dtnat__37 - 1) in (match pending with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__39) -> (match dtb__39 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> ((fun ar -> ((fun specialized -> ((fun deeper -> (match deeper with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__38) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41))) rows) qs)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon ((Base_dPair.v_Base_dPair_dfirstOf dtb__40), ((v_Vuna_dCompiler_dElab_dCoverage_dtakePats ar) dtb__42), v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), ((v_Vuna_dCompiler_dElab_dCoverage_ddropPats ar) dtb__42)))))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__38) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) specialized) ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dElab_dCoverage_dwilds ar)) qs)))) (((v_Vuna_dCompiler_dElab_dCoverage_dspecializeCtor ar) (Base_dPair.v_Base_dPair_dfirstOf dtb__40)) rows))) (Base_dPair.v_Base_dPair_dsecondOf dtb__40))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match qs with
  | Base_dList.C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow rows) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (Base_dList.C_Base_dList_dList_Nil)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> ((fun heads -> (match heads with
  | Base_dList.C_Base_dList_dList_Nil -> (match (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__38) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) (v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows rows)) dtb__44) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__45) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.C_Base_dList_dList_Cons ((Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan)), dtb__45))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (match ((v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors table) dtb__46) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) dtb__38) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (((v_Vuna_dCompiler_dElab_dCoverage_dorderedCtors dtb__48) heads)))) rows) dtb__44)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf rows))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 165 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_dallSameLen = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if ((Base_dList.v_Base_dList_dlength dtb__49) = mc0) then ((v_Vuna_dCompiler_dElab_dCoverage_dallSameLen mc0) dtb__50) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_duniformArity = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> ((v_Vuna_dCompiler_dElab_dCoverage_dallSameLen (Base_dList.v_Base_dList_dlength dtb__51)) dtb__52)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dmatrixArity = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (Base_dList.v_Base_dList_dlength dtb__53)
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dmatrixWitness = (fun table clauses -> (if (v_Vuna_dCompiler_dElab_dCoverage_duniformArity clauses) then (((((v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness table) (bi_natFromInt 256)) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) clauses) (v_Vuna_dCompiler_dElab_dCoverage_dwilds (v_Vuna_dCompiler_dElab_dCoverage_dmatrixArity clauses))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 197 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dwitnessNamesCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead dtb__55) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__57, dtb__58, dtb__59) -> true
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 208 "Vuna/Compiler/Elab/Coverage.vuna"
let rec v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn = (fun fuel paren p -> (if (fuel <= 0) then "_" else (match (v_Vuna_dCompiler_dElab_dCoverage_dpatHead p) with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PCon (dtb__60, dtb__61, dtb__62) -> (if ((Base_dList.v_Base_dList_dlength dtb__61) = 0) then dtb__60 else ((fun body -> (if paren then (String.concat "" ["("; body; ")"]) else body)) (String.concat "" [dtb__60; " "; ((Base_dString.v_Base_dString_djoin " ") ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn (fuel - 1)) true)) dtb__61))])))
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PVar (dtb__63, dtb__64) -> "_"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PWild (dtb__65) -> "_"
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PInt (dtb__66, dtb__67) -> (bi_strFromInt dtb__66)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PStr (dtb__68, dtb__69) -> (String.concat "" ["\""; dtb__68; "\""])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PRecord (dtb__70, dtb__71, dtb__72) -> (String.concat "" ["{ "; dtb__70; " }"])
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dPat_PAs (dtb__73, dtb__74, dtb__75) -> (((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn (fuel - 1)) paren) dtb__74)
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_drenderPat = (fun p -> (((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn 64) false) p))

# 223 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_drenderWitness = (fun ws -> ((Base_dString.v_Base_dString_djoin " ") ((Base_dList.v_Base_dList_dmap ((v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn 64) true)) ws)))

# 185 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dimproveDiag = (fun table clauses sp d -> (if ((d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagCode <> "TC_NotExhaustive") then d else (match ((v_Vuna_dCompiler_dElab_dCoverage_dmatrixWitness table) clauses) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> (if (v_Vuna_dCompiler_dElab_dCoverage_dwitnessNamesCtor dtb__76) then ((fun rx -> ((Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan sp) ((Vuna_dCompiler_dBase_dDiagnostics_dTc.v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg (Vuna_dCompiler_dBase_dDiagnostics_dTc.C_Vuna_dCompiler_dBase_dDiagnostics_dTc_dTcErr_NotExhaustive (rx))) (Base_dVec.C_Base_dVec_dVec_Cons (rx, Base_dVec.C_Base_dVec_dVec_Nil))))) (v_Vuna_dCompiler_dElab_dCoverage_drenderWitness dtb__76)) else d)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> d
  | _ -> failwith "DT: impossible branch"
)))

# 181 "Vuna/Compiler/Elab/Coverage.vuna"
let v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__77) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (((((v_Vuna_dCompiler_dElab_dCoverage_dimproveDiag mc0) (mc1 0)) mc2) dtb__77)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__78) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__78))
  | _ -> failwith "DT: impossible branch"
))
